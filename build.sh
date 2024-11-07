#!/bin/bash

# Specify the paths to websocketpp and boost
WEBSOCKETPP_PATH=/opt/homebrew/Cellar/websocketpp/0.8.2/include
BOOST_PATH=/opt/homebrew/Cellar/boost/1.86.0_2/include

# Compile source files
g++ -std=c++17 -I$WEBSOCKETPP_PATH -I$BOOST_PATH -c main.cpp -o main.o
g++ -std=c++17 -I$WEBSOCKETPP_PATH -I$BOOST_PATH -c RestClient.cpp -o RestClient.o
g++ -std=c++17 -I$WEBSOCKETPP_PATH -I$BOOST_PATH -c env_loader.cpp -o env_loader.o
g++ -std=c++17 -I$WEBSOCKETPP_PATH -I$BOOST_PATH -c WSServer.cpp -o WSServer.o

# Link object files to create the executable
g++ -std=c++17 main.o RestClient.o env_loader.o WSServer.o -o DeribitClient -lcurl -L/opt/homebrew/Cellar/boost/1.86.0_2/lib -lboost_system

# Clean up object files
rm *.o

echo "Build complete. Run ./DeribitClient to start."
