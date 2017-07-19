%% #### -------------------------------------------------------------- #### 
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com              
%% Virginia Tech, Department of Mechanical Engineering                               
%% A Bio-Inspired Actuation Design for Adaptive Robot Hands
%% IEEE/RAS International Conference on Humanoid Robots (Humanoids 2017)
%% Nonlinear Equality Constraint Optimization for Whiffletree Configuration
%% #### -------------------------------------------------------------- #### 
clear all;
close all;
clc;
%% Differential Mechanism Parameters
da=10; % Displacement
rm=30; % Main bar radius
ri=20; % Index bar radius
rir=31.27783; % Index bar length from the center point to the right edge
lm=25; % Length of tendon from actuator to main bar
li=35; % Length of tendon from main bar to index bar and ring bar
xc=rm-ri; % X coordinate of constrained middle finger
yc=lm+li; % Y coordinate of constrained middle finger
xf=0; % X coordinate of main bar center
yf=lm-da; % Y coordinate of main bar center

%% Solution of Optimzation 
x0=[rm; yf-rm; xc-ri;  yc-ri;]'; % Initial points
options = optimset('LargeScale','off');
[x, fval] = fmincon(@distance,x0,[],[],[],[],[],[],@constraints,options); 
[c,ceq] = constraints(x);

%% Whiffletree configuration 
% Main bar's left edge Y-coordiante
dymc=x(2)-yf; % Y-distance of main bar's right edge to center
yml=yf-dymc; 

% Ring bar's Y-coordinate 
yr=yml+li; 

% Index bar's Y-coordinate
phi=acosd((yc-x(4))/ri); % Y-axis and index bar angle
dyir=(ri+rir)*cosd(phi); % Perpendicular distance from yc to yi
yir=yc-dyir; 

% Differential motion 
dy=(yir-yr)  

%% Displacement (da) vs Differential motion (dy) plots

% Import data
filename ='src/displDist_rii10.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);

filename ='src/displDist_rii15.txt';
delimiterIn = ' ';
headerlinesIn = 1;
B = importdata(filename,delimiterIn,headerlinesIn);

filename ='src/displDist_rii20.txt';
delimiterIn = ' ';
headerlinesIn = 1;
C = importdata(filename,delimiterIn,headerlinesIn);

filename ='src/displDist_rii25.txt';
delimiterIn = ' ';
headerlinesIn = 1;
D = importdata(filename,delimiterIn,headerlinesIn);

filename ='src/displDist_rii30.txt';
delimiterIn = ' ';
headerlinesIn = 1;
E = importdata(filename,delimiterIn,headerlinesIn);

%% Plots

DDif=(A.data(:,2)-B.data(:,2))/5; % Equivalent motion Ratio \delta d
DifRat=(C.data(:,2)./DDif);
DifRatV=[0;DifRat(2:end,:)]; % Differential Constant Rate \alpha [mm]

figure (1)
plot(A.data(:,1), A.data(:,2), '-or', ...
     B.data(:,1), B.data(:,2), '-*b', ...
     C.data(:,1), C.data(:,2), '-+c', ...
     D.data(:,1), D.data(:,2), '-sg', ... 
     E.data(:,1), E.data(:,2), '-dm', ...
     'LineWidth',2);
grid on
xlabel('Linear Displacement d_a [mm]')
ylabel('Differential Motion \delta y [mm]')
legend('r_{it}=30mm','r_{it}=35mm','r_{it}=40mm','r_{it}=45mm', ...
       'r_{it}=50mm','Location','northwest');
set(gca,'fontsize',14.5,'FontName','Times New Roman')

fig=figure;
left_color = [0 0 1];
right_color = [1 0 0];
set(fig,'defaultAxesColorOrder',[left_color; right_color]);
yyaxis 'left'
plot(A.data(:,1),DDif, '-*', 'LineWidth',2);
xlabel('Actuator Displacement d_a [mm]')
ylabel('Equivalent Motion Ratio \delta d')

yyaxis 'right'
plot(A.data(2:end,1),DifRatV(2:end,:), '-d','LineWidth',2);
ylabel('Differential Constant Rate \alpha [mm]')
grid on
set(gca,'fontsize',14.5,'FontName','Times New Roman')
