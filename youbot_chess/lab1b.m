clear all
close all

addpath(genpath('../robot-9.6/rvctools')) % Add the path to the toolbox code



L(1)=Link([ 0 0 0 0]);
L(2)=Link([ 0 0 0 0]);
L(3)=Link([ 0 0 0 0]);
L(4)=Link([ 0 0 0 0]);
L(5)=Link([ 0 0 0 0]);
AngleOffset=[0 0 0 0 0];
r=SerialLink(L,'name','YouBot Manipulator Arm','offset',AngleOffset);


r.plot([0 0 0 0 0])
