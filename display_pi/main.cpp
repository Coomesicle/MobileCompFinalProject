#include <stdio.h>
#include <pigpio.h>
#include <string.h>
#include <wiringPi.h> 
#include <wiringPiI2C.h>
#include <iostream>
#include <string>
#include <cstring>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <thread>
#include <sstream>
#include "../garbotron_sensor/apis.cpp"

// Global vars for LCD 
int LCDAddr = 0x27; // I2C addr
int BLEN = 1; // backlight enabled 
int fd; // File Descriptor

// writes data to the I2C device 
void write_word(int data){
    int temp = data;
    if ( BLEN == 1 )
        temp |= 0x08; // enable backlight
    else
        temp &= 0xF7; // disables
    wiringPiI2CWrite(fd, temp);
}

// sends the command in bits to the I2C
void send_command(int comm){
    int buf;
    // nibble = (half a bit) (0-15, one hex digit )
    // Send bit7-4 firstly, high nibble first 
    buf = comm & 0xF0;
    buf |= 0x04;                    // RS = 0, RW = 0, EN = 1
    write_word(buf);
    delay(2);
    buf &= 0xFB;                    // Make EN = 0
    write_word(buf);

    // Send bit3-0 secondly, low second 
    buf = (comm & 0x0F) << 4;
    buf |= 0x04;                    // RS = 0, RW = 0, EN = 1
    write_word(buf);
    delay(2);
    buf &= 0xFB;                    // Make EN = 0
    write_word(buf);
}

// sends data to the I2C
void send_data(int data){
    int buf;
    // Send bit7-4 firstly, same high first, low second 
    buf = data & 0xF0;
    buf |= 0x05;                    // RS = 1, RW = 0, EN = 1
    write_word(buf);
    delay(2);
    buf &= 0xFB;                    // Make EN = 0
    write_word(buf);

    // Send bit3-0 secondly
    buf = (data & 0x0F) << 4;
    buf |= 0x05;                    // RS = 1, RW = 0, EN = 1
    write_word(buf);
    delay(2);
    buf &= 0xFB;                    // Make EN = 0
    write_word(buf);
}

void init(){ //initialize the lcd display
    send_command(0x33);     // Must initialize to 8-line mode at first
    delay(5);
    send_command(0x32);     // Then initialize to 4-line mode
    delay(5);
    send_command(0x28);     // 2 Lines & 5*7 dots
    delay(5);
    send_command(0x0C);     // Enable display without cursor
    delay(5);
    send_command(0x01);     // Clear Screen
    wiringPiI2CWrite(fd, 0x08);
}

void clear(){
    send_command(0x01);     //clear Screen
}

// Function to write a string to a specific location on the LCD
void write(int x, int y, char data[]){
    int addr, i;
    int tmp;
    if (x < 0)  x = 0;
    if (x > 15) x = 15;
    if (y < 0)  y = 0;
    if (y > 1)  y = 1;

    // Move cursor
    addr = 0x80 + 0x40 * y + x;
    send_command(addr);

    tmp = strlen(data);
    for (i = 0; i < tmp; i++){
        send_data(data[i]);
    }
}

// writes the distance using stringstream given info from the sensorpi
void writeDistance(int x, int y, double distance) {
    std::ostringstream oss;
    oss << distance << " %"; // Convert the distance to a string with a percentage symbol
    std::string distanceString = oss.str(); // set the string equal to the string stream
    const char* distanceChars = distanceString.c_str(); // set to c style string 
    char nonConstBuffer[distanceString.length() + 1];  // create a buffer to hold the distance
    strcpy(nonConstBuffer, distanceChars); // copy the distance C-style string to the buffer 
    clear(); // clear the LCD display
    write(0, 0, "Distance: "); // write "Distance: " at the top left of the LCD
    write(x, y, nonConstBuffer); // write the distance at the specified position below
}


int main() {
    int LCDAddr = 0x27; // Assuming this is the I2C address of your LCD

    fd = wiringPiI2CSetup(LCDAddr); // set up I2C communication with the LCD
    init();
    write(0, 0, "Greetings!"); // source testing that it writes 
    write(1, 1, "From SunFounder");
    delay(3000);
    clear();

    



    // // Create a socket file descriptor for network communication setup 
    // int server_fd = socket(AF_INET, SOCK_STREAM, 0); // create a socket for IPv4 and TCP
    // if (server_fd == -1) {
    //     std::cerr << "Failed to create socket" << std::endl;
    //     return 1; //exit if failed 
    // }

    // // Set up the server address
    // sockaddr_in server_addr;
    // server_addr.sin_family = AF_INET; // IPv4 
    // server_addr.sin_addr.s_addr = INADDR_ANY; // listen on any networks interface 
    // server_addr.sin_port = htons(8080); // sets server port 

    // // Bind the socket to the server address
    // if (bind(server_fd, (sockaddr*)&server_addr, sizeof(server_addr)) == -1) {
    //     std::cerr << "Failed to bind socket" << std::endl;
    //     return 1;
    // }

    // // Listen for incoming connections, max of 5 connectiosn 
    // if (listen(server_fd, 5) == -1) {
    //     std::cerr << "Failed to listen on socket" << std::endl;
    //     return 1;
    // }

    // // Display the IP address of the connected client
    // std::cout << "Server listening on port 8080" << std::endl;

    // // Accept a new connection
    // sockaddr_in client_addr;
    // socklen_t client_len = sizeof(client_addr);
    // int client_fd = accept(server_fd, (sockaddr*)&client_addr, &client_len);
    // if (client_fd == -1) {
    //     std::cerr << "Failed to accept connection" << std::endl;
    //     return 1;
    // }

    // std::cout << "Accepted connection from " << inet_ntoa(client_addr.sin_addr) << std::endl;


    // while (true) { // runs until force terminated
    //     // Receive the distance data
    //     char buffer[1024]; // buffer for recieving data 
    //     memset(buffer, 0, sizeof(buffer)); //clear buffer 
    //     ssize_t bytes_received = recv(client_fd, buffer, sizeof(buffer) - 1, 0); // recieve data from client 
    //     if (bytes_received == -1) {
    //         std::cerr << "Failed to receive data" << std::endl;
    //         break;
    //     } else {
    //         // convert received data to a string, then to a double, and display it on the LCD

    //         std::string distanceString(buffer, bytes_received);
    //         std::istringstream iss(distanceString);
    //         double distance;
    //         iss >> distance;
    //         if (iss.fail()) {
    //             std::cerr << "Error converting received data to double" << std::endl;
    //         } else {
    //             std::cout << "Received distance: " << distance << std::endl; // print distance
    //             writeDistance(1, 1, distance); //write to lcd
    //         }
    //     }
    // }
    bool running = false;
    std::string api = "https://a3b9-128-227-14-9.ngrok-free.app/garbotron/status";


    while (true) {
            // Continuously check the API
            running = getBooleanFromAPI(api);

            while (true) {  // Outer loop that should never exit
            bool running = getBooleanFromAPI(api);
            std::cout << "API Check, running status: " << running << std::endl;

            while (running) {
                // Actions to perform when the API returns true

                Json::Value percentJson;
                percentJson = getPercent;

                double distance = percentJson.asDouble();
                std::cout << "Received distance: " << distance << std::endl; // print distance
                writeDistance(1, 1, distance); //write to lcd

                // Check the status again to decide whether to continue running
                running = getBooleanFromAPI(api);
                std::cout << "Rechecking API, running status: " << running << std::endl;

                if (!running) {
                    std::cout << "Status changed to false, exiting inner loop." << std::endl;
                }
                
                std::this_thread::sleep_for(std::chrono::seconds(1));

            }

            // Brief pause to prevent overwhelming the API with requests
            std::this_thread::sleep_for(std::chrono::seconds(1));
        }
    }

        // Close the server socket
        
        return 0;
        }



