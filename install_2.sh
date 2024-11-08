
# Run and build PX4
export ROS_DISTRO=noetic
source /opt/ros/${ROS_DISTRO}/setup.bash
source ~/catkin_ws/devel/setup.bash
cd ~/PX4-Autopilot

# Install Gazebo
pip install symforce
DONT_RUN=1  make px4_sitl_default gazebo
cd ~/catkin_ws/src
catkin_create_pkg pkg_name rospy --rosdistro ${ROS_DISTRO}
cd ..

# Build the packages and create launch file
catkin build
source devel/setup.bash
roscd pkg_name
cd ~/catkin_ws/src/pkg_name
mkdir scripts
cd scripts
mkdir launch
cd launch
cat <<EOF > start_pkg.launch
<?xml version="1.0"?>
<launch>
    <!-- Include the MAVROS node with SITL and Gazebo -->
    <include file="\$(find px4)/launch/mavros_posix_sitl.launch">
    </include>

    <!-- Our node to control the drone -->
    <node pkg="pkg_name" type="offb_node.py" name="offb_node_py" required="true" output="screen" />
</launch>
EOF

# Add the PX4 and ROS setup to the bashrc
cat <<EOF >> ~/.bashrc
# ROS and PX4 setup
export ROS_DISTRO=noetic
source /opt/ros/\${ROS_DISTRO}/setup.bash
source ~/catkin_ws/devel/setup.bash
source ~/PX4-Autopilot/Tools/simulation/gazebo-classic/setup_gazebo.bash ~/PX4-Autopilot ~/PX4-Autopilot/build/px4_sitl_default
export ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:~/PX4-Autopilot
export ROS_PACKAGE_PATH=\$ROS_PACKAGE_PATH:~/PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_gazebo-classic
export PATH="/usr/bin/python3.8:\$PATH"
export GAZEBO_PLUGIN_PATH=\$GAZEBO_PLUGIN_PATH:/usr/lib/x86_64-linux-gnu/gazebo-9/plugins
EOF

cd ~

# QGround Control installation
sudo usermod -a -G dialout $USER
sudo apt-get remove modemmanager -y
sudo apt install gstreamer1.0-plugins-bad gstreamer1.0-libav gstreamer1.0-gl -y
sudo apt install libfuse2 -y
sudo apt install libxcb-xinerama0 libxkbcommon-x11-0 libxcb-cursor-dev -y

wget https://d176tv9ibo4jno.cloudfront.net/latest/QGroundControl.AppImage
chmod +x ./QGroundControl.AppImage

echo 'Installation complete. Rebooting now...'
sudo reboot now