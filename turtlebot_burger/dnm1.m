
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
setenv("ROS_DOMAIN_ID","0");

lidarNode = ros2node('scanListener');
lidarSub = ros2subscriber(lidarNode,'/scan','sensor_msgs/LaserScan',"Reliability","besteffort","Durability","volatile","Depth",5);

myodomNode = ros2node('myodomListener');
myodomSub = ros2subscriber(myodomNode,'/odom','nav_msgs/Odometry',"Reliability","reliable","Durability","volatile","Depth",5);
receive(myodomSub,30);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=0;
for n=1:3000
    
    pause(0.1);
    
    p=evalin('base','dur');

    while p==1
        p=evalin('base','dur');
        pause(0.1);
    end

    fV=evalin('base','movingSpeed')*0.1;
    tV=evalin('base','turningSpeed')*0.1;
    wD=evalin('base','wallDistance')*0.1;
    pD=evalin('base','waypointDistance')*0.1;
    mode=evalin('base','mods');
    tgtX=evalin('base','heyX');
    tgtY=evalin('base','heyY');
    tgtT=evalin('base','heyT');

    scanMsg = receive(lidarSub);
    
    vRanges=(scanMsg.ranges)';
    vRanges(isinf(vRanges)) = 0;
    vRanges(isnan(vRanges)) = 0;
    for i=1:length(scanMsg.ranges)
        if vRanges(i)>2
            vRanges(i)=0;
        end
    end
    vAngles=[(0:length(scanMsg.ranges)-1)].*pi/(length(scanMsg.ranges)/2);
    nAngularSteps=length(scanMsg.ranges);
    if mod(nAngularSteps,2) ~= 0
        nAngularSteps=nAngularSteps-1;
    end
    rRstep=scanMsg.angle_increment;
    
    %only look to the left side of the robot
    vRanges=vRanges(1:floor(length(scanMsg.ranges)/2));
    vAngles=vAngles(1:floor(length(scanMsg.ranges)/2));

    if (vRanges(1)>0.00) & (vRanges(1)<1.00)
        vRanges=vRanges(1:30);
        vAngles=vAngles(1:30);
    end

    [C vThAxis vRAxis]=RWhough2(vAngles,vRanges,nAngularSteps,rRstep);
    index=find(C==max(max(C)));    %% find the index of the highest peak
    row=mod(index,length(vRAxis));  %% Row coordiante of peek
    col=index/length(vRAxis);       %% Col coordinate of peek
    rho=(row-1)*rRstep;             %% Compute radius
    theta=(col-1)*2*pi/nAngularSteps; %% Compute Angle

    rho=rho(1);
    theta=theta(1);
    
    rTimeStamp = double(scanMsg.header.stamp.sec);

    pose=readPose(myodomSub.LatestMessage);

    figure(1);
    clf
    x=cos(vAngles).*vRanges;
    y=sin(vAngles).*vRanges;
    subplot(1,1,1);
    plot(x,y,'k.');
    hold on
    PlotHoughLine(rho,theta,'r-')
    grid on
    axis equal
    title(sprintf('#%d Hough Line at time %.2f sec, Robot Heading: %.2f X/Y: %.2f/%.2f',n,rTimeStamp,getAng(pose(3)),pose(1),pose(2)));
    
    %Draw circle to represent the robot.
    x=0;
    y=0;
    r=0.2;
    th = 0:pi/50:2*pi;
    xunit = r * cos(th) + x;
    yunit = r * sin(th) + y;
    plot(xunit, yunit)

    %Draw direction line of the robot.
    rX = cos(0).*0.2;
    rY = sin(0).*0.2;
    plot([0 rX],[0 rY])
    
    %draw the route
    dist=wD; %final distance to the wall
    x2= pD*cos(theta-pi/2);
    y2= pD*sin(theta-pi/2);
    x1=(rho-dist)*cos(pi/2)+x2;
    y1=(rho-dist)*sin(pi/2)+y2;

    plot([x1 0],[y1 0],'b-','LineWidth',2.0);

    
    if mode==0
        myGo2(x1,y1,tV,fV);
    elseif mode==1
        vX=tgtX-pose(1);
        vY=tgtY-pose(2);
        vD=sqrt((vX^2)+(vY^2));
        vA=atan2(vY,vX);
        vX=vD*cos(-getAng(pose(3))+vA);
        vY=vD*sin(-getAng(pose(3))+vA);
        myGo2(vX,vY,tV,fV);
    else
        myGo3(tV,fV,tgtT);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function PlotHoughLine(rho, theta, sStr)
    x1=rho*cos(theta);
    y1=rho*sin(theta);
    plot([0 x1],[0 y1],'r--');
    % x2==...
    % y2=....
    % x3=....
    % y3=..
    % plot([x2 x3],[y2 y3],'r-');
    x2= 2*cos(theta+pi/2);
    y2= 2*sin(theta+pi/2);
    x3=x1-x2;
    y3=y1-y2;
    x2=x1+x2;
    y2=y1+y2;
    plot([x2 x3],[y2 y3],sStr,'LineWidth',2.0);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [C,ThAxis,RAxis]=RWhough2(Phi,D,NTh,Delta)
% function [C,ThAxis,RAxis]=RWhough(Phi,D,NTh,Delta);
%
% Calculate the Hough transform of the points given in D, Phi
%
% Input:
%  D     - A 1*N vector of distances to edge points.
%  Phi   - A 1*N vector of directions to edge points.
%  NTh   - The number of angular steps (angular resolution=360/NTh degrees)
%          Should be an even number.
%  Delta - The distance resolution
%
% Output:
%  C     - The Hough transform. A (max(D)/Delta)*NTh matrix.
%  ThAxis- The angles. A 1*NTh vector.
%  RAxis - The distances. A 1*(max(D)/Delta) vector.
%  

% Setup:

dTheta=2*pi/NTh; 
DMax=max(D);
%DMax=max(D(~isinf(D)));
NrOfMeas=length(D);
Nr=floor(DMax/Delta+1.5);        % Number of distance steps.
C=zeros(Nr,NTh);

ThAxis=dTheta*(0:(NTh-1)); 
RAxis=Delta*(1:Nr);

% Loop over all possible theta angles:
tres=0.1;
for i=1:(NTh/2);
  Theta=ThAxis(i);

  R=D.*cos(Phi-Theta);
  for j=1:length(R);
    if R(j)>0;
      Ri=floor(1.5+R(j)/Delta);
      C(Ri,i)=C(Ri,i)+R(j); %(abs(R(j))<tres)*R(j);
    else 
      Ri=floor(1.5-R(j)/Delta);
      C(Ri,i+NTh/2)=C(Ri,i+NTh/2)-R(j); %(abs(R(j))<tres)*R(j);
    end
  end
 % fprintf('Done with angle %g of %g\n',Theta,pi);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function myAng = getAng(a)
if a < 0
    a=pi+(pi+a);
end
while a > 2*pi
    a=a-(2*pi);
end
myAng=a;
end