function myGo3(vt, vf, tt)
%X and Y are the coordinates of the point related to the robot.

turnSpeed=vt;
forSpeed=vf;
theta=tt;

turtleBotVersion = 3; % Gazebo Office world uses TurtleBot3 Burger model

odomNode = ros2node('odomListener');
odomSub = ros2subscriber(odomNode,'/odom','nav_msgs/Odometry',"Reliability","reliable","Durability","volatile","Depth",5);
receive(odomSub,30);

if turtleBotVersion == 3
velTopic = "/cmd_vel";
else
velTopic = "/mobile_base/commands/velocity";
end
velNode = ros2node('velPublisher');
velPub = ros2publisher(velNode,velTopic,"geometry_msgs/Twist","Reliability","reliable","Durability","transientlocal");

%get pose data.
pose=readPose(odomSub.LatestMessage);

%Initialize linear and angular velocities
forwardV = 0;   
turnV = 0;

%angle range related to the robot
pAngle=0;
pDistance=0;

%Angle and Distance of the point related to the robot.
pAngle=theta;
pDistance=0.3;

%set parameters to rotate the robot towards the waypoint.
ang=getAng(pAngle);

finAng = getAng(getAng(pose(3))+ang);

%rotation direction 
s=1;

%rotate till robot heads towards the waypoint.
if (finAng>getAng(pose(3))) & (finAng>(getAng(pose(3))+pi))
    s=-1;
elseif (finAng<getAng(pose(3))) & (finAng>(getAng(pose(3))-pi))
    s=-1;
end

while ~((getAng(pose(3)) < finAng+0.05) & (getAng(pose(3)) > finAng-0.05))
    turnV = s*turnSpeed;
    publishVel(velPub, forwardV, turnV);
    pose=readPose(odomSub.LatestMessage);
end

%stop rotation
turnV = 0;
publishVel(velPub, forwardV, turnV);

%update pose
pose=readPose(odomSub.LatestMessage);
intX = pose(1);
intY = pose(2);

%move till distance between robot & waypoint covered
while (sqrt(((pose(1)-intX)^2)+((pose(2)-intY)^2)))<pDistance-0.01
    forwardV = forSpeed;
    publishVel(velPub, forwardV, turnV);
    pose=readPose(odomSub.LatestMessage);
end

%stop movement
forwardV = 0;
publishVel(velPub, forwardV, turnV);
end

function pose = readPose(odomMsg)
%readPose Extract the robot odometry reading as [x y theta] vector

% Extract the x, y, and theta coordinates
poseMsg = odomMsg.pose.pose;
xpos = poseMsg.position.x;
ypos = poseMsg.position.y;
quat = poseMsg.orientation;
angles = quat2eul([quat.w quat.x quat.y quat.z]);
theta = angles(1);
pose = [xpos, ypos, theta];
end

function myAng = getAng(a)
if a < 0
    a=pi+(pi+a);
end
while a > 2*pi
    a=a-(2*pi);
end
myAng=a;
end

function publishVel(velPub, vLin, vAng)
persistent velMsg

if isempty(velMsg)
    velMsg = ros2message(velPub);
end

    velMsg.linear.x = vLin;
    velMsg.angular.z = vAng;
    send(velPub,velMsg);
end