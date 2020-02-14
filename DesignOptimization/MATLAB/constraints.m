function [c, ceq] = constraints(x)
global rm rrl lr xc yc yf
% Equality constraints
c=[ ];
% Nonlinear equality constraints
ceq = [x(1)^2+(x(2)-yf)^2-rm^2; ... % Main bar circle constraint
      (x(3)-xc)^2+(x(4)-yc)^2-rrl^2;... % Index bar circle constraint
       x(1)-x(3); ... % Vertical tendon constraint
       x(4)-x(2)-lr]; % Tendon length constraint
end


