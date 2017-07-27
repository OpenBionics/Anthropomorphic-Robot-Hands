## Introduction

The OpenBionics hand_controller ROS package. With this package you can control 2 [Dynamixel RX-28](http://support.robotis.com/en/product/actuator/dynamixel/rx_series/rx-28.htm) servo motors concurrenlty in ROS, along with an [external power supply](http://www.trossenrobotics.com/p/power-supply-12vdc-5a.aspx), a [power supply adapter](http://www.robotis.us/smps2dynamixel/), and a [USB2Dynamixel adapter](http://support.robotis.com/en/product/auxdevice/interface/usb2dxl_manual.htm). Note that there are various ways to implement the control of the 2 Dynamixel, but our suggestion is similar with our experiments.

## Installation
This package has been developed and tested in ROS Indigo on Ubuntu 14.04.5 LTS. After ROS installation, create a workspace:

```
$ mkdir -p ~/hand_ws/src
$ cd ~/hand_ws/src
$ catkin_init_workspace
```

Next, clone the hand_controller package and the dependencies in the src directory:
```
$ cd ~/hand_ws/src 
$ git clone https://github.com/OpenBionics/Anthropomorphic-Robot-Hands.git
$ git clone https://github.com/vanadiumlabs/arbotix_ros.git
$ git clone https://github.com/arebgun/dynamixel_motor
```

Then, compile the code and source the workspace:
```
$ cd ~/hand_ws/ 
$ catkin_make
$ . devel/setup.bash
```

Make all the files executable:
```
$ cd ~/hand_ws/src/hand_controller/src/ 
$ chmod +x hand_controller_flex.py && chmod +x hand_controller_adduction.py && chmod +x double_motor_publisher.py
```

## Working Example


