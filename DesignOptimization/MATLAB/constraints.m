function [c, ceq] = constraints(x)
% Parameters
da=10; % Displacement
rm=30; % Main bar radius
ri=20; % Index bar radius
lm=25; % Length of tendon from actuator to main bar
li=35; % Length of tendon from main bar to index bar
xc=rm-ri; % X coordinate at constrained middle finger
yc=lm+li; % Y coordinate at constrained middle finger
xf=0; % X coordinate at the center of main bar 
yf=lm-da; % Y coordinate at the center of main bar 

% Equality constraints
c=[];
% Nonlinear equality constraints
ceq = [x(1)^2+(x(2)-yf)^2-rm^2; ... % Main bar circle constraint
      (x(3)-xc)^2+(x(4)-yc)^2-ri^2; ... % Index bar circle constraint
       x(1)-x(3); ... % Vertical tendon constraint
       x(4)-x(2)-li]; % Tendon length constraint
end


