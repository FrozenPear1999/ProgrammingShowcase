#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float32MultiArray
import numpy as np

class LidarHoughNode(Node):
    def __init__(self):
        super().__init__('lidar_hough_node')
        self.subscription = self.create_subscription(
            LaserScan,
            '/scan',
            self.lidar_callback,
            10)
        self.publisher = self.create_publisher(
            Float32MultiArray,
            '/hough_lines',
            10)
        self.get_logger().info('Lidar Hough Node has been started.')

    def lidar_callback(self, msg):
        vAngles = np.arange(0, 360) * np.pi / 180
        vRanges = np.array(msg.ranges)
        vRanges[np.isinf(vRanges)] = 0

        C, vThAxis, vRAxis = self.rwhough(vAngles, vRanges, 360, msg.angle_increment)

        peak = np.unravel_index(np.argmax(C, axis=None), C.shape)
        rho = (peak[0]) * msg.angle_increment
        theta = (peak[1]) * 2 * np.pi / 360

        # Publish detected line
        line_msg = Float32MultiArray()
        line_msg.data = [rho, theta]
        self.publisher.publish(line_msg)

    def rwhough(self, Phi, D, NTh, Delta):
        dTheta = 2 * np.pi / NTh
        DMax = np.max(D)
        Nr = int(np.floor(DMax / Delta + 1.5))
        C = np.zeros((Nr, NTh))

        ThAxis = dTheta * np.arange(NTh)
        RAxis = Delta * np.arange(1, Nr + 1)

        for i in range(int(NTh / 2)):
            Theta = ThAxis[i]
            R = D * np.cos(Phi - Theta)
            for j, r in enumerate(R):
                if r > 0:
                    Ri = int(np.floor(1.5 + r / Delta))
                    if Ri < Nr:
                        C[Ri, i] += r
                else:
                    Ri = int(np.floor(1.5 - r / Delta))
                    angle_index = i + int(NTh / 2)
                    if Ri < Nr and angle_index < NTh:
                        C[Ri, angle_index] -= r
        return C, ThAxis, RAxis

def main(args=None):
    rclpy.init(args=args)
    lidar_hough_node = LidarHoughNode()
    rclpy.spin(lidar_hough_node)
    lidar_hough_node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()


