#!/bin/bash

echo "Moving wpa-tools.py"
sudo mv wpa-tools.py /bin/wpa-tools
echo "Adding executable permission"
sudo chmod +x /bin/wpa-tools
echo "Installation complete."