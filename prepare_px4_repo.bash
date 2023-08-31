git clone https://github.com/PX4/PX4-Autopilot.git --recursive
sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh
cd PX4-Autopilot
pip3 install jinja2 kconfiglib jsonschema
sudo reboot now