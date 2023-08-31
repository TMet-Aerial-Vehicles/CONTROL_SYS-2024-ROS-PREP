
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl -y # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update -y
sudo apt install ros-noetic-desktop-full -y
source /opt/ros/noetic/setup.bash
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential python3-rospy -y
sudo rosdep init
rosdep update
#uncomment above if ros has not been installed


export ROS_DISTRO=noetic
sudo apt-get install ros-${ROS_DISTRO}-mavros ros-${ROS_DISTRO}-mavros-extras ros-${ROS_DISTRO}-mavros-msgs -y
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh
sudo apt-get install python3-catkin-tools python-rosinstall-generator -y
sudo apt-get install ros-noetic-catkin python3-catkin-tools python3-roslaunch -y
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
wstool init src
wstool init ~/catkin_ws/src
rosinstall_generator --rosdistro kinetic mavlink | sudo tee /tmp/mavros.rosinstall
source /opt/ros/noetic/setup.bash
rosinstall_generator --upstream mavros | sudo tee -a /tmp/mavros.rosinstall
catkin init
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4
rosdep update
rosdep install --from-paths src --ignore-src -y
sudo bash ./src/mavros/mavros/scripts/install_geographiclib_datasets.sh
catkin build mavros -j8
rosdep update
source devel/setup.bash 