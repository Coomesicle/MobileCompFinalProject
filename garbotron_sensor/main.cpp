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
    std::string apiRunning = "https://b764-128-227-14-9.ngrok-free.app/garbotron/status";
    std::string apiPUTDist = "https://b764-128-227-14-9.ngrok-free.app/garbotron/distance";
    std::string apiPUTPercent = "https://b764-128-227-14-9.ngrok-free.app/garbotron/percent";

     while (true) {
        // Continuously check the API
        running = getBooleanFromAPI(apiRunning);

        while (true) {  // Outer loop that should never exit
        bool running = getBooleanFromAPI(apiRunning);
        std::cout << "API Check, running status: " << running << std::endl;

        while (running) {
            // Actions to perform when the API returns true
            garbotron.set_distance(measureDistance());
            garbotron.update_trash();

            std::cout << "Distance: " << garbotron.get_distance() << " cm" << std::endl;
            std::cout << "Percent of trashcan filled: " << garbotron.get_trash_percent() << "%" << std::endl;

            Json::Value depth;
            depth["distance"] = std::to_string(garbotron.get_distance());
            Json::StyledWriter writer;
            std::string jsonData = writer.write(depth);

            Json::Value percentJson;
            percentJson["percent"] = std::to_string(garbotron.get_trash_percent());
            Json::StyledWriter writerPercent;
            std::string percentData = writerPercent.write(percentJson);

            sendPutRequest(apiPUTDist, jsonData);
            sendPutRequest(apiPUTPercent, percentData);

            std::this_thread::sleep_for(std::chrono::seconds(3)); // Measure every second

            // Check the status again to decide whether to continue running
            running = getBooleanFromAPI(apiRunning);
            std::cout << "Rechecking API, running status: " << running << std::endl;

            if (!running) {
                std::cout << "Status changed to false, exiting inner loop." << std::endl;
            }
        }

        // Brief pause to prevent overwhelming the API with requests
        std::this_thread::sleep_for(std::chrono::seconds(3));
    }
}
}