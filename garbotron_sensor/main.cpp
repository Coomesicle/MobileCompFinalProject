#include "sensor.cpp"
#include "apis.cpp"

//trig gpio 4
//echo gpio 24
const int TRIG = 4;
const int ECHO = 24;

Sensor garbotron(20);

void setup() {
    if (gpioInitialise() < 0) {
        std::cerr << "pigpio initialization failed." << std::endl;
        exit(1);
    }

    // Set GPIO modes
    gpioSetMode(TRIG, PI_OUTPUT);
    gpioSetMode(ECHO, PI_INPUT);

    // Ensure trigger is low
    gpioWrite(TRIG, 0);
    std::this_thread::sleep_for(std::chrono::milliseconds(500));
}

double measureDistance() {
    // Send pulse
    gpioWrite(TRIG, 1);
    std::this_thread::sleep_for(std::chrono::microseconds(10)); // 10 microsecond pulse
    gpioWrite(TRIG, 0);

    // Wait for echo start
    while(gpioRead(ECHO) == 0) {}

    auto start = std::chrono::steady_clock::now();

    // Wait for echo end
    while(gpioRead(ECHO) == 1) {}

    auto end = std::chrono::steady_clock::now();

    // Calculate pulse length
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();

    // Calculate distance in centimeters
    double distance = duration * 0.034 / 2;

    return distance;
}


bool check_number(std::string str) {
   for (int i = 0; i < str.length(); i++)
   if (isdigit(str[i]) == false)
      return false;
      return true;
}

int main() {
    bool running = false;
    bool listening = true;
    int input = 0;
    int length = garbotron.get_distance();
    int time = 5;
    setup();
    


    while (listening) {
        if (getBooleanFromAPI("http://127.0.0.1:5000/garbotron/status")) {
            listening = false;
            running = true;
        }

    }
    while (running) {
        //double distance = measureDistance();
        garbotron.set_distance(measureDistance());
        garbotron.update_trash();
        std::cout << "Distance: " << garbotron.get_distance() << " cm" << std::endl;
        std::cout << "Percent of trashcan filled: " << garbotron.get_trash_percent() << "%" << std::endl;
        // 145-148 jsonifies depth of trashcan data
        Json::Value depth;
        depth["distance"] = std::to_string(garbotron.get_distance());
        Json::StyledWriter writer; 
    	std::string jsonData = writer.write(depth);
        // 150-153 jsonifies percent of trash can filled
        Json::Value percentJson;
        percentJson["percent"] = std::to_string(garbotron.get_trash_percent());
        Json::StyledWriter writerPercent;
        std::string percentData = writerPercent.write(percentJson);
        sendPutRequest("http://127.0.0.1:5000/garbotron/distance", jsonData);
        sendPutRequest("http://127.0.0.1:5000/garbotron/percent", percentData);
        std::this_thread::sleep_for(std::chrono::seconds(time)); // Measure every second
        // Simulate distance data (replace with your actual distance sensor code)
        std::string percent = std::to_string(garbotron.get_trash_percent());
    }
    

    

    gpioTerminate(); // Should ideally be called on program exit
    return 0;
}
