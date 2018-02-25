## Introduction

The OpenBionics hand_controller ROS package. With this package you 2 [Dynamixel RX-28](http://support.robotis.com/en/product/actuator/dynamixel/rx_series/rx-28.htm) servo motors can be controlled concurrenlty in ROS, along with an [external power supply](http://www.trossenrobotics.com/p/power-supply-12vdc-5a.aspx), a [power supply adapter](http://www.robotis.us/smps2dynamixel/), and a [USB2Dynamixel adapter](http://support.robotis.com/en/product/auxdevice/interface/usb2dxl_manual.htm). Note that there are various ways to implement the control of the 2 Dynamixel, but our suggestion is similar with our tested experimental procedure.

## Installation
This package has been developed and tested in ROS Indigo on Ubuntu 14.04.5 LTS. After ROS installation, create a workspace.

```
$ mkdir -p ~/hand_ws/src
$ cd ~/hand_ws/src
$ catkin_init_workspace
```

Next, clone the hand_controller package and the dependencies in the src directory.
```
$ cd ~/hand_ws/src 
$ git clone https://github.com/OpenBionics/Anthropomorphic-Robot-Hands.git
$ git clone https://github.com/vanadiumlabs/arbotix_ros.git
$ git clone https://github.com/arebgun/dynamixel_motor
```

Then, compile the code and source the workspace.
```
$ cd ~/hand_ws/ 
$ catkin_make
$ . devel/setup.bash
```

Make all the files executable.
```
$ cd ~/hand_ws/src/hand_controller/src/ 
$ chmod +x hand_controller_flex.py && chmod +x hand_controller_adduction.py && chmod +x double_motor_publisher.py && chmod +x double_motor_publisher_sequence.py
```

## Working Example
Connect the servo motors, the USB2Dynamixel, and the power supply as shown [here](http://support.robotis.com/en/product/auxdevice/interface/usb2dxl_manual.htm). Then, check that the USB2Dynamixel adapter is properly connected.
```
$ ls /dev/ttyUSB*
```
If you get ```/dev/ttyUSB0``` continue the procudre, if not check the list bellow.
* If you get  ```/dev/ttyUSB1```, unplug all your USB devices and plug only the USB2Dynamixel adapter. An alternative solution is to navigate to the main controller launch file and change the port name.
```
$ cd ~/hand_ws/src/hand_controller/hand_controller/launch
$ gedit controller_hand_manager.launch
```
Then source the workspace again.
```
$ . devel/setup.bash
```
* If you get permission denied error, change the permissions of the user from the home directory.
```
$ sudo chmod 777 /dev/ttyUSB0
```

In a new terminal run a roscore.
```
$ roscore
```
Set the servo motors IDs through the arbotix_terminal application. 
```
$ arbotix_terminal /dev/ttyUSB0 57142 # The baud rate of Dynamixel AX-12  is 1000000
```
From the arbotix_terminal application list the motors.
```
>> ls
```
To rearrange the IDs, connect only the first servo motor and move its ID.
```
>> mv 1 2
```
Then connect both servo motors and list them.
```
>> ls
```
You should get.
```
   1    2 .... .... .... .... .... .... ....
.... .... .... .... .... .... .... .... ....
```
Exit the arbotix_terminal application (Ctrl-C) and the roscore. Start the controller manager.
```
$ roslaunch hand_controller controller_hand_manager.launch
```
Then, start the controllers for each servo motor.
```
$ roslaunch hand_controller start_flex_controller.launch
$ roslaunch hand_controller start_adduction_controller.launch
```

Next, get feedback from the flexion and the abduction servo motor.
```
$ rosrun hand_controller hand_controller_flex.py
$ rosrun hand_controller hand_controller_adduction.py
```

To control the servo motors.
```
$ rosrun hand_controller double_motor_publisher.py 1.5 1.0 
```
The last numbers represent the servo motor positions for the flexion and the abduction respectively. Note that the desired servo motor positions are absolute and in radians. Since the servo motors can rotate from 0-300<sup>o</sup>, the equivalent radian angles are 0-5.235 rad. In our working example the flexion motor desired position is 57.3<sup>o</sup> and the abduction motor desired position is 85.9<sup>o</sup>.

In case you want to control the motors sequenceally.
```
$ rosrun hand_controller double_motor_publisher_sequence.py
```
You can watch the manipulation of a cylindrical object with this sequence [here](https://youtu.be/w6tnvIsw6BY).

## Notes
Please open a [GitHub issue](https://github.com/OpenBionics/Anthropomorphic-Robot-Hands/issues) if you encounter any problem.
