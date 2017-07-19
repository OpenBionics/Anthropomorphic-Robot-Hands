function D = distance(x)
% Objective function - Distance
D=sqrt((x(1)-x(3))^2+(x(2)-x(4))^2);
% x(1) is X coordiante at middle bar's edge
% x(2) is Y coordiante at middle bar's edge
% x(3) is X coordiante at index bar's center
% x(4) is Y coordiante at index bar's center
end