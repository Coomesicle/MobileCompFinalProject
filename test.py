import socket
import struct
import json

# Multicast group IP and port
MCAST_GRP = '232.1.1.1'
MCAST_PORT = 1235

# Create a UDP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind(('', MCAST_PORT))

# Tell the OS to add the socket to the multicast group on all interfaces.
mreq = struct.pack("4sl", socket.inet_aton(MCAST_GRP), socket.INADDR_ANY)
sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)

def save_tweet(tweet):
    tweet_type = tweet.get("Tweet Type", "Unknown")
    file_name = f"{tweet_type}.json"

    # Read existing data or start with an empty list
    try:
        with open(file_name, "r") as file:
            data = json.load(file)
    except FileNotFoundError:
        data = []

    # Append new tweet
    data.append(tweet)

    # Write data back to the file
    with open(file_name, "w") as file:
        json.dump(data, file, indent=4)

print(f"Listening for messages on {MCAST_GRP}:{MCAST_PORT}")
try:
    while True:
        data, address = sock.recvfrom(1024)
        try:
            tweet = json.loads(data.decode())
            print(f"Received tweet from {address}: {tweet}")
            save_tweet(tweet)
        except json.JSONDecodeError:
            print("Received non-JSON data")
except KeyboardInterrupt:
    print("Exited by user")
finally:
    sock.close()

# import os
# import socket
# import struct
# import json
# import re

# # Multicast group IP and port
# MCAST_GRP = '232.1.1.1'
# MCAST_PORT = 1235

# # Create a UDP socket
# sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
# sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
# sock.bind(('', MCAST_PORT))

# # Tell the OS to add the socket to the multicast group on all interfaces.
# mreq = struct.pack("4sl", socket.inet_aton(MCAST_GRP), socket.INADDR_ANY)
# sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)

# def preprocess_data(data):
#     # Function to escape JSON-like structures within strings
#     data = re.sub(r'(\["[^"]*"):(.*?\])', lambda m: m.group(1) + '\\:' + m.group(2), data)
#     return data

# def save_tweet(tweet):
#     tweet_type = tweet.get("Tweet Type", "Unknown")
#     file_name = f"{tweet_type}.json"

#     # Attempt to read the existing data from the file, or start with an empty list if not found
#     if os.path.exists(file_name):
#         with open(file_name, "r") as file:
#             try:
#                 existing_data = json.load(file)
#             except json.JSONDecodeError:
#                 existing_data = []
#     else:
#         existing_data = []

#     # Check if the tweet is already in the existing data to avoid duplicates
#     if any(t["Entity ID"] == tweet["Entity ID"] for t in existing_data):
#         print("Duplicate tweet detected, not saving.")
#     else:
#         existing_data.append(tweet)
#         # Write the updated list back to the file
#         with open(file_name, "w") as file:
#             json.dump(existing_data, file, indent=4)

# print(f"Listening for messages on {MCAST_GRP}:{MCAST_PORT}")
# try:
#     while True:
#         data, address = sock.recvfrom(1024)
#         try:
#             cleaned_data = preprocess_data(data.decode())
#             tweet = json.loads(cleaned_data)
#             save_tweet(tweet)
#         except json.JSONDecodeError as e:
#             print("Received non-JSON data")
#             print(f"Problematic data from {address}: {data.decode()}")  # Log the raw problematic data
#         except Exception as e:
#             print(f"Error processing data: {e}")
# except KeyboardInterrupt:
#     print("Exited by user")
# finally:
#     sock.close()
