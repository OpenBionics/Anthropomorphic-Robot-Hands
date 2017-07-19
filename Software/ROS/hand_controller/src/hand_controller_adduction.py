#!/usr/bin/env python

import rospy
from math import fabs
from dynamixel_msgs.msg import JointState
from std_msgs.msg import Float64

goal_pos = 0;
pub = rospy.Publisher('/adduction_controller/corosmmand', Float64)

def transform_callback(data):
    global goal_pos
    rospy.loginfo(': Flexion current motor angle {0}'.format(data.current_pos))
    rospy.loginfo(': Current error angle {0}'.format(data.error))
    rospy.loginfo(': Current load {0}'.format(data.load))
    rospy.loginfo(': Current temperature {0}'.format(data.motor_temps))



def dxl_control():
    rospy.init_node('dxl_control', anonymous=True)
    rospy.Subscriber('/adduction_controller/state', JointState, transform_callback)
    # Initial movement.
    pub.publish(Float64(goal_pos))
    rospy.spin()


if __name__ == '__main__':
    try:
        dxl_control()
    except rospy.ROSInterruptException:
        pass


