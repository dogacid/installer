#!/bin/bash

echo ""
echo "--- Step 13: Install .NET SDK ---"
sudo add-apt-repository ppa:dotnet/backports
sudo apt-get update && sudo apt-get install -y dotnet-sdk-9.0

echo "--- Verifying .NET SDK installation ---"
dotnet --list-sdks

