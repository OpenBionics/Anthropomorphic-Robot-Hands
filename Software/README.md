## Introduction

The OpenBionics hand_controller package in ROS.


## Installation
This package has been developed and tested in ROS Indigo on Ubuntu 14.04.5 LTS. After ROS installation, create a workspace:

```
mkdir -p ~/hand_ws/src
cd ~/hand_ws/src
catkin_init_workspace
```

Next, clone the package in the src directory:
```
cd ~/hand_ws/src 
git clone https://github.com/OpenBionics/Anthropomorphic-Robot-Hands.git
```

Then, compile the code and source the workspace:
```
cd ~/hand_ws/ 
catkin_make
. devel/setup.bash
```

Make all the files executable:
```
cd ~/hand_ws/src/hand_controller/src/ 
chmod +x hand_controller_flex.py && chmod +x hand_controller_adduction.py && chmod +x double_motor_publisher.py
```


## How this package is usefull


