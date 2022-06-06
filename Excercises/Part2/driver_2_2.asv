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
