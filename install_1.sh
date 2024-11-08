# Update and upgrade the system
sudo apt update -y
sudo apt upgrade -y

# Install basic tools
sudo apt install git -y
sudo apt install wget -y
sudo apt install python3.8 -y
sudo apt install gcc-10 g++-10 -y
export CC=/usr/bin/gcc-10
export CXX=/usr/bin/g++-10

# Add ROS repository
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update -y

# Install ROS
export ROS_DISTRO=noetic
sudo apt install ros-${ROS_DISTRO}-desktop-full -y
source /opt/ros/${ROS_DISTRO}/setup.bash
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential python3-rospy -y
sudo rosdep init
rosdep update

sudo apt-get install ros-${ROS_DISTRO}-mavros ros-${ROS_DISTRO}-mavros-extras ros-${ROS_DISTRO}-mavros-msgs -y
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh
sudo apt-get install python3-catkin-tools python3-rosinstall-generator -y
sudo apt-get install ros-${ROS_DISTRO}-catkin python3-catkin-tools python3-roslaunch -y
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
wstool init src
#wstool init ~/catkin_ws/src
rosinstall_generator --rosdistro ${ROS_DISTRO} mavlink | sudo tee /tmp/mavros.rosinstall
source /opt/ros/${ROS_DISTRO}/setup.bash
rosinstall_generator --rosdistro ${ROS_DISTRO} --upstream mavros | sudo tee -a /tmp/mavros.rosinstall
catkin init
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro ${ROS_DISTRO} -y
sudo bash ./src/mavros/mavros/scripts/install_geographiclib_datasets.sh
catkin build mavros -j8
rosdep update
source devel/setup.bash 

# Install PX4
cd ~
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
sudo bash ./PX4-Autopilot/Tools/setup/ubuntu.sh
cd ~/PX4-Autopilot
pip3 install jinja2 kconfiglib jsonschema testresources
sudo reboot now
