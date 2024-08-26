#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Dec 15 23:14:21 2022

@author: Zeyu
"""

# Import the necessary Python modules
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import math

class WallFollower(Node):
    def __init__(self):
        # Initialize the ROS node
        super().__init__('wall_follower')

        qos_policy = rclpy.qos.QoSProfile(reliability=rclpy.qos.ReliabilityPolicy.BEST_EFFORT, history=rclpy.qos.HistoryPolicy.KEEP_LAST, depth=1)

        #Read lidar data.
        self.subscription = self.create_subscription(LaserScan, 'scan', self.scan_callback, qos_profile=qos_policy)

        # Publish velocity commands to the robot
        self.cmd_vel_pub = self.create_publisher(
            Twist,
            '/cmd_vel',
            10)

        self.range_left = 0
        self.range_front = 0

        self.timer = self.create_timer(1 / 100, self.time_callback)

    def time_callback(self):
        self.dontCrash()

    def scan_callback(self, msg):
        # Assign lidar readings to the variables.
        self.range_left = msg.ranges[60]
        self.range_front = msg.ranges[0]

    #Select operating mode.
    def dontCrash(self):
        msg = Twist()
        #First operational mode.
        if self.range_front <= 0.6:
           msg.linear.x = 0.1
           msg.angular.z = -90*0.0175
           self.cmd_vel_pub.publish(msg)
           print(1)
        #Second operational mode.
        elif self.range_left <=  0.8:
           msg.linear.x = 0.1
           msg.angular.z = (self.range_left-0.5)*60*0.0175
           self.cmd_vel_pub.publish(msg)
           print(2)
        #third operational mode.
        elif self.range_front > 0.6 and self.range_left > 0.8:
           msg.linear.x = 0.1
           msg.angular.z = 20*0.0175
           self.cmd_vel_pub.publish(msg)
           print(3)

def main(args=None):
    rclpy.init(args=args)

    wall_follower = WallFollower()

    rclpy.spin(wall_follower)

    wall_follower.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
