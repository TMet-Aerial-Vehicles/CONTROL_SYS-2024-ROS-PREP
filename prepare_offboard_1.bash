source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash
cd ~/PX4-Autopilot
DONT_RUN=1  make px4_sitl_default gazebo
cd home
cd ~/catkin_ws/src
catkin_create_pkg pkg_name rospy --rosdistro noetic
cd ..
catkin build
source devel/setup.bash
roscd pkg_name
cd ~/catkin_ws/src/pkg_name
mkdir scripts
cd scripts
mkdir launch
cd launch
touch start_pkg.launch
#STOP HERE. Copy start_pkg.launch. move to ~/catkin_ws/src/pkg_name/scripts/launch
#run: nano start_pkg.launch
#paste the data you copied
#move back to ~
