#!/usr/bin/env python
from std_msgs.msg import Float64
import rospy
import sys

class double_motor_publisher:
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
      double_motor_publisher(sys.argv[1],sys.argv[2])

