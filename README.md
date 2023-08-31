Hello New members of Control Systems!
Before proceeding any further, ensure you have git installed on the machine you will be installing ROS on. (For linux, run: sudo apt-get install git -y)
The set of scripts in this repository are inteded to assit you with your setup of the MAVROS enviroment as well as the px4 autopilot.
These scripts are for use with ROS noetic running on ubuntu 20.04 only.
This project is a work in progress, and more scripts will be added as libraries are used.
To begin, ensure you are in the home directory (run: cd ~)

Then, for each of the .bash files, repeat the following process:
1. touch $FILENAME (creates the file, replace $FILENAME with the name of the bash script to be created)
2. chmod +x (this will grant the script execute permissions)
3. nano $FILENAME (will open the file in a text editor, from there, copy paste the scripts into the files you created)

After this process has been complete, run the files in the following order:
1. prepare_ws
2. prepare_px4_repo (this will reboot your ubuntu instance)
3. prepare_offboard_1
Run the scripts using the command: bash $FILENAME

After running prepare_offboard_1, run: cd ~/catkin_ws/src/pkg_name/scripts/launch
Then, paste the start_pkg.launch template into the corresponding file.
Next, return to ~.
edit .bashrc, pasting the following lines at the end of the file:

source /opt/ros/noetic/setup.bash
source ~/catkin_ws/devel/setup.bash
source ~/PX4-Autopilot/Tools/simulation/gazebo-classic/setup_gazebo.bash ~/PX4-Autopilot ~/PX4-Autopilot/build/px4_sitl_default

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/PX4-Autopilot
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/PX4-Autopilot/Tools/simulation/gazebo-classic/sitl_gazebo-classic
export PATH="usr/bin/python3.8:$PATH"
export GAZEBO_PLUGIN_PATH=$GAZEBO_PLUGIN_PATH:/usr/lib/x86_64-linux-gnu/gazebo-9/plugins

Next, open a new terminal instance, and run: roslaunch pkg_name start_pkg.launch
This should start the simulator provided the installation process has been follow correctly

NOTE: You may also clone this repository to your linux instance. Simply chmod +x the bash files and run them in order. Then, return to the guide provided.
