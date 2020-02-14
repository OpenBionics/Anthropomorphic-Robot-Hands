%% #### -------------------------------------------------------------- ####
%% George Kontoudis, Ph.D. Student, gpkont@vt.edu, www.georgekontoudis.com
%% Nonlinear Equality Constraint Optimization for Whiffletree Configuration
%% #### -------------------------------------------------------------- ####
clear all;
close all;
clc;
%% Differential Mechanism Parameters
global rm rrl lr xc yc yf

%  Differential mechanism dimensions
rm=25; % Main bar radius
rrl=10; % Index bar radius up to the anchor 
rll=rrl; % Ring-pinky bar radius up to the anchor
rrr=15; % Index bar length from the anchor to the right edge
rrt = rrl+rrr; % Total radius of index bar
lm=25; % Length of tendon from actuator to main bar
lr=30; % Length of tendon from main bar to index bar 
ll=30; % Length of tendon from main bar to ring-pinky bar
xf=0; % X coordinate of main bar center
x_vec = []; % vector of optimization solutions
yf_vec = []; % vector of Y coordinate of main bar center

% Finger tendon lengths
index_tendon = 30;
ring_tendon = 30;
pinky_tendon = 30;

% Blocked bar center
xc=rm-rrl; % X coordinate of constrained middle finger
yc=lm+lr; % Y coordinate of constrained middle finger

% Figure
figure (1)
scatter(xc,yc,'m', 'filled')
hold on
x(1) = rm; % X coordiante at middle bar edge (initial condition)
x(3) = xc+rrl; % X coordiante at index bar center (initial condition)
x(4) = yc; % Y coordiante at index bar center (initial condition)
for da=1:2:11 % Displacement
yf=lm-da; % Y coordinate of main bar center

scatter(xf,yf,'b')
hold on

yf_vec = [yf_vec yf];
% Optimzation
x0=[x(1); yf; x(3); x(4)]'; % Initial conditions of optimization
options = optimset('LargeScale','off');
[x, fval] = fmincon(@distance,x0,[],[],[],[],[],[],@constraints,options);
[c,ceq] = constraints(x); % constraints

% figure
scatter(x(1),x(2), 'b')
hold on
scatter(x(3),x(4),'m')
hold on
plot([x(1),xf], [x(2),yf], 'b')
hold on
plot([x(3),xc], [x(4),yc], 'm')
hold on
plot([x(1),x(3)], [x(2),x(4)], 'k')
hold on
x_vec = [x_vec; x da];

% Kinematics for index bar configuration
phi = atan( abs(x(3)-xc)/abs(x(4)-yc));
dyrr = rrt*cos(phi);
yrr = yc - dyrr;
xrr = sin(phi)*rrt + xc;
% figure for index bar configuration
scatter(xrr,yrr,'m')
hold on
plot([x(3) xrr],[x(4) yrr],'m')
hold on
plot([xrr, xrr],[yrr, yrr+index_tendon],'k')
hold on
plot([xf, xf],[yf, yf-ll],'k')
hold on

% Kinematics for middle bar configuration
yl = 2*lm+ll+lr-x(4)-2*da;
delta_y = yrr -yl
xml = -x(1);
yml = -x(2)+2*yf;
% figure for middle bar configuration
scatter(xml,yml,'b')
hold on
plot([x(1) xml],[x(2) yml], 'b')
hold on

% Kinematics for ring-pinky bar configuration
xl = xml;
yl = yml+ll;
xlr = xl + rll;
ylr=yl;
xll = xl - rll;
yll=yl;
% figure for ring-pinky bar configuration
scatter(xl,yl,'m')
hold on
plot([xl, xml],[yl, yml],'k')
hold on
scatter(xlr,ylr,'m')
hold on
scatter(xll,yll,'m')
hold on
plot([xlr,xll],[ylr,yll],'m')
hold on
plot([xlr xlr],[ylr,ylr+ring_tendon],'k')
hold on
plot([xll xll],[yll,yll+pinky_tendon],'k')
hold on

% figure characteristics
xlim ([-60 60])
ylim ([-25 95])
hold on 
% pause
   
end
%% Appendix - Previous design optimization
% %% Whiffletree configuration
% % Main bar's left edge Y-coordiante
% dymc=x(2)-yf; % Y-distance of main bar's right edge to center
% yml=yf-dymc;
%
% % Ring bar's Y-coordinate
% yr=yml+lr;
%
% % Index bar's Y-coordinate
% phi=acosd((yc-x(4))/rrl); % Y-axis and index bar angle
% dyir=(rrl+rir)*cosd(phi); % Perpendicular distance from yc to yi
% yir=yc-dyir;
%
% % Differential motion
% dy=(yir-yr)
%
% %% Displacement (da) vs Differential motion (dy) plots
%
% % Import data
% filename ='src/displDist_rii10.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% A = importdata(filename,delimiterIn,headerlinesIn);
%
% filename ='src/displDist_rii15.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% B = importdata(filename,delimiterIn,headerlinesIn);
%
% filename ='src/displDist_rii20.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% C = importdata(filename,delimiterIn,headerlinesIn);
%
% filename ='src/displDist_rii25.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% D = importdata(filename,delimiterIn,headerlinesIn);
%
% filename ='src/displDist_rii30.txt';
% delimiterIn = ' ';
% headerlinesIn = 1;
% E = importdata(filename,delimiterIn,headerlinesIn);
%
% %% Plots
%
% DDif=(A.data(:,2)-B.data(:,2))/5; % Equivalent motion Ratio \delta d
% DifRat=(C.data(:,2)./DDif);
% DifRatV=[0;DifRat(2:end,:)]; % Differential Constant Rate \alpha [mm]
%
% figure (1)
% plot(A.data(:,1), A.data(:,2), '-or', ...
%      B.data(:,1), B.data(:,2), '-*b', ...
%      C.data(:,1), C.data(:,2), '-+c', ...
%      D.data(:,1), D.data(:,2), '-sg', ...
%      E.data(:,1), E.data(:,2), '-dm', ...
%      'LineWidth',2);
% grid on
% xlabel('Linear Displacement d_a [mm]')
% ylabel('Differential Motion \delta y [mm]')
% legend('r_{it}=30mm','r_{it}=35mm','r_{it}=40mm','r_{it}=45mm', ...
%        'r_{it}=50mm','Location','northwest');
% set(gca,'fontsize',14.5,'FontName','Times New Roman')
%
% fig=figure;
% left_color = [0 0 1];
% right_color = [1 0 0];
% set(fig,'defaultAxesColorOrder',[left_color; right_color]);
% yyaxis 'left'
% plot(A.data(:,1),DDif, '-*', 'LineWidth',2);
% xlabel('Actuator Displacement d_a [mm]')
% ylabel('Equivalent Motion Ratio \delta d')
%
% yyaxis 'right'
% plot(A.data(2:end,1),DifRatV(2:end,:), '-d','LineWidth',2);
% ylabel('Differential Constant Rate \alpha [mm]')
% grid on
% set(gca,'fontsize',14.5,'FontName','Times New Roman')