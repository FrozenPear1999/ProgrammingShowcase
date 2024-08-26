clear all
close all
%rosinit('http://10.211.55.8');
setenv('ROS_DOMAIN_ID','25')
%setenv('AMENT_PREFIX_PATH','')
ros2('topic','list')
lidarNode = ros2node('scanListener')
%pause(1)
%lidarSub = ros2message('sensor_msgs/LaserScan');
lidarSub = ros2subscriber(lidarNode,'/scan','sensor_msgs/LaserScan')

vAngles = [0:359]*2*pi/360;
r = 1.0;
%r = ros2rate(lidarNode,1);
%reset(r);
for n = 1:3000
    % Receive LIDAR data using the naming convention from your second section
    receive(lidarSub);
    oScan = lidarSub.LatestMessage;
    vRanges = oScan.ranges';
    vRanges(isinf(vRanges)) = 0; % Handle infinite values
    vAngles = [(0:359)] .* pi / 180;

    % Process for Hough Transform
    nAngularSteps = 360;
    rRstep = oScan.angle_increment; % Using the property from oScan
    [C, vThAxis, vRAxis] = RWhough2(vAngles, vRanges, nAngularSteps, rRstep); 
    index = find(C == max(max(C))); % Find the index of the highest peak
    row = mod(index, length(vRAxis)); % Row coordinate of peak
    col = index / length(vRAxis); % Column coordinate of peak
    rho = (row - 1) * rRstep; % Compute radius
    theta = (col - 1) * 2 * pi / nAngularSteps; % Compute Angle
    
    % Timestamp for plots
    rTimeStamp = double(oScan.header.stamp.sec) + double(oScan.header.stamp.nanosec) * 1E-9;
    
    % Plotting LIDAR data and Hough Transform
    x = cos(vAngles) .* vRanges;
    y = sin(vAngles) .* vRanges;
    
    % Figure 1: LIDAR data with Hough Line
    figure(1);
    clf;
    subplot(1,1,1);
    plot(x, y, 'b.');
    hold on;
    PlotHoughLine(rho, theta, 'r-'); % Plot the detected line
    grid on;
    axis equal;
    title(sprintf('#%d Hough Line at time %.2f sec', n, rTimeStamp));

    % Figure 2: Hough Transform
    figure(2);
    surf(vThAxis * 180 / pi, vRAxis, C); % Plot Hough Space
    xlabel('\theta (degrees)');
    ylabel('Range (m)');
    title(sprintf('#%d Hough Transform at time %.2f sec', n, rTimeStamp));
    print('-dpng', sprintf('lab2_HoughTransform.png'));

    drawnow;
end


  