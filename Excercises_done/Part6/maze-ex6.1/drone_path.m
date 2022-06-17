% Plotting 3D
figure()
plot3(out.simout.data(1,:), out.simout.data(2,:), out.simout.data(3,:))
xlabel('x')
ylabel('y')
zlabel('z')
title('Position of UAV')
grid

% Plotting 2D
figure()
plot(out.simout.data(1,:), out.simout.data(2,:))
xlabel('x')
ylabel('y')
title('Position of UAV')
grid