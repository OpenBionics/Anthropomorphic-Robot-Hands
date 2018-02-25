#!/usr/bin/env python
from std_msgs.msg import Float64
import rospy
import sys

class double_motor_publisher_sequence:
        def __init__(self, mot1, mot2):
            mot1 = float(mot1)
            mot2 = float(mot2)
            self.motor1_pub = rospy.Publisher('/flex_controller/command', Float64, queue_size=1)
            self.motor2_pub = rospy.Publisher('/adduction_controller/command', Float64, queue_size=1)
            ct = 0
            while ct < 5:
                self.motor1_pub.publish(mot1)
                self.motor2_pub.publish(mot2)
                rospy.sleep(.1)
                ct = ct+1

                        
if __name__ == '__main__':
      rospy.init_node('joint_position_tester')
	  double_motor_publisher_sequence(3, 0)
      rospy.sleep(2.0)
      double_motor_publisher_sequence(2.5, 0.3)
      rospy.sleep(3.0)
      double_motor_publisher_sequence(1.2, 1.6)
      rospy.sleep(3)
      double_motor_publisher_sequence(0.9, 1.3)
      rospy.sleep(3)
      double_motor_publisher_sequence(1.5, 1.9)
      rospy.sleep(3)
      double_motor_publisher_sequence(.7, 1.1)
      rospy.sleep(3)
      double_motor_publisher_sequence(1.7, 2.1)
      rospy.sleep(5)
      double_motor_publisher_sequence(.7, 1.1)
      rospy.sleep(5)
      double_motor_publisher_sequence(1.2, 1.6)
      rospy.sleep(5)
      double_motor_publisher_sequence(3, 0)
      rospy.sleep(2.0)

