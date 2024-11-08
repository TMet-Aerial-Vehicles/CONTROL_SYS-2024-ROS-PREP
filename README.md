# ROS and PX4 Installation Guide

## Introduction to ROS
ROS (Robot Operating System) is a powerful tool for robotics software development. To get started with understanding the basics of ROS, refer to this introductory video:
[Intro to ROS - The Basics](https://www.youtube.com/watch?v=8QfI5a7lTKU).

### ROS Distributions
ROS has various distributions, each tailored for specific development needs and compatibility. A comprehensive explanation of ROS distributions can be found here: [ROS Distributions](http://wiki.ros.org/Distributions).

For this installation, we will be using **ROS (1) Noetic**, which is compatible only with **Ubuntu 20.04 (Focal Fossa)**. You can download Ubuntu 20.04 from this link: [Download Ubuntu 20.04](https://releases.ubuntu.com/focal/).

If you prefer to run it on a virtual machine (VM), you can use VMware. Download VMware Player from the following link: [VMware Player 17.6.1](https://softwareupdate.vmware.com/cds/vmw-desktop/player/17.6.1/24319023/windows/core/VMware-player-17.6.1-24319023.exe.tar).

## PX4 Installation
PX4 is an open-source flight control software for drones and other unmanned vehicles. It is widely used for UAV development and simulation.

### Installation Commands
To install ROS Noetic and PX4, you will need to run two commands. They will both reboot your machine. After running the first script, you will need to run the second installation command. <br>
Run this command in your ubuntu terminal. Make sure you have curl installed `sudo apt install curl -y`:
```bash
sudo curl -S https://raw.githubusercontent.com/CerfMetal/ROS-Install/refs/heads/main/install_1.sh | sudo bash
```
<br>
Then run the second command: <br>

```bash
sudo curl -S https://raw.githubusercontent.com/CerfMetal/ROS-Install/refs/heads/main/install_2.sh | sudo bash
```
<br>
If everything installed properly, you should be able to run this command without any problems and get a simulation running:

```bash
roslaunch pkg_name start_pkg.launch
```
You can then open a new terminal window (keep the one above running) and run:

```bash
chmod +x ./QGroundControl.AppImage
```

## Sample Codes
*Sample code sections will be provided in the future once installation is complete.*

Ensure your ROS and PX4 environments are correctly set up before running any scripts to avoid compatibility issues.

