#include <iostream>
#include <curl/curl.h>
#include <string>
#include <cstddef>
#include <jsoncpp/json/json.h>

// Callback function to handle the response data
size_t WriteCallback(void *contents, size_t size, size_t nmemb, std::string *userp) {
    userp->append((char*)contents, size * nmemb);
    return size * nmemb;
}

// Function to send a PUT request to an API
bool sendPutRequest(const std::string& url, const std::string& jsonData) {
    CURL *curl;
    CURLcode res;
    std::string readBuffer;
    curl = curl_easy_init();

    if(curl) {
        // Set the URL
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());

        // Specify the PUT request method
        curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, "PUT");

        // Set the header
        struct curl_slist *headers = nullptr;
        headers = curl_slist_append(headers, "Content-Type: application/json");
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);

        // Provide the data for the PUT request
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, jsonData.c_str());

        // Set the callback function to capture the response
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

        // Perform the PUT request
        res = curl_easy_perform(curl);

        // Clean up
        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);

        // Check for errors
        if(res != CURLE_OK) {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
            return false;
        }

        // Optionally print the response
        std::cout << "Response: " << readBuffer << std::endl;
        
        return true;
    }

    return false;
}

//Function to GET bool from API
bool getBooleanFromAPI(const std::string& url) {
    CURL *curl;
    CURLcode res;
    std::string readBuffer;
    bool result = false;

    curl = curl_easy_init();
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
        curl_easy_setopt(curl, CURLOPT_USERAGENT, "libcurl-agent/1.0");

        res = curl_easy_perform(curl);
        if (res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        } else {
            Json::Value jsonData;
            Json::Reader jsonReader;
            if (jsonReader.parse(readBuffer, jsonData)) {
                // Assuming the JSON response structure has a boolean in the "status" field
                result = jsonData["status"].asBool();
            }
        }
        curl_easy_cleanup(curl);
    }

    return result;
}

// Function to perform a GET request and parse the JSON response
double getPercent(const std::string& url) {
    CURL *curl;
    CURLcode res;
    std::string readBuffer;
    Json::Value jsonData;
    double percent = 0.0;  // Default percent value

    curl = curl_easy_init();
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);
        curl_easy_setopt(curl, CURLOPT_USERAGENT, "libcurl-agent/1.0");

        res = curl_easy_perform(curl);
        if (res != CURLE_OK) {
            std::cerr << "curl_easy_perform() failed: " << curl_easy_strerror(res) << std::endl;
        } else {
            Json::Reader jsonReader;
            if (jsonReader.parse(readBuffer, jsonData)) {
                std::cout << "Successfully parsed JSON data" << std::endl;
                std::cout << "Received data: " << jsonData.toStyledString() << std::endl;
                
                if (jsonData.isMember("percent")) {
                    if (jsonData["percent"].isString()) {
                        try {
                            percent = std::stod(jsonData["percent"].asString());
                        } catch (const std::invalid_argument& e) {
                            std::cerr << "Invalid argument: could not convert string to double" << std::endl;
                        } catch (const std::out_of_range& e) {
                            std::cerr << "Out of range: string to double conversion error" << std::endl;
                        }
                    } else if (jsonData["percent"].isNumeric()) {
                        percent = jsonData["percent"].asDouble();
                    }
                }
            } else {
                std::cerr << "Failed to parse JSON" << std::endl;
            }
        }
        curl_easy_cleanup(curl);
    }
    return percent;  // Return the percent value, whether modified or default
}