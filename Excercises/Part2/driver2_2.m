% Init
close all

% Constants
m = 0.5;
k = 0.01;
L = 0.225;
b = 0.001;
D = diag([0.01, 0.01, 0.01]);
I = diag([3e-6, 3e-6, 1e-5]);
In = inv(I);
g = [0,0,-9.81];


% Initial conditions
Theta = [0
    0
    0];

dtheta = [0
    0
    0];

p = [0
    0
    0];

dp = [0
    0
    0];

%s = sqrt(9.81*m/(4*k));
% Vector of angular speeds
Omega = [0
        10000
        0
        10000];

omg_vec = [0
    0
    0
    sum(Omega.^2)];

tau = [L*k*(Omega(1)^2 - Omega(3)^2)
    L*k*(Omega(2)^2 - Omega(4)^2)
    b*(Omega(1)^2 - Omega(2)^2 + Omega(3)^2 - Omega(4)^2)];

% Plotting
out = sim('Part2_2.slx', 0:0.05:10);
figure()
plot3(out.simout.data(1,:), out.simout.data(2,:), out.simout.data(3,:))
xlabel('x')
ylabel('y')
zlabel('z')
title('Position of UAV')
grid

% Roll
figure()
subplot(1, 3, 1)
plot(out.tout, out.simout1.data(1,:)*180/pi)
xlabel('time [s]')
ylabel('phi [degree]')
title('Roll')
grid

% Pitch
subplot(1, 3, 2)
plot(out.tout, out.simout1.data(2,:)*180/pi)
xlabel('time [s]')
ylabel('theta [degree]')
title('Pitch')
grid

% Yaw
subplot(1, 3, 3)
plot(out.tout, out.simout1.data(3,:)*180/pi)
xlabel('time [s]')
ylabel('psi [degree]')
title('Yaw')
grid
sgtitle('Angles') 

% Rotors rotation
% figure()
% b=0.2; % Radius of the helicopter motors
% x = (b.*sin(out.p.data(3,:))); % elementwise mult
% y = (-b.*cos(out.p.data(3,:))); % elementwise mult;
% z = out.theta.data(3,:);
% plot3(x, y, z)
% xlabel('x')
% ylabel('y')
% zlabel('z')
% title('Position of UAV')
% grid
