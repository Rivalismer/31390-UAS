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

w0 = sqrt(9.81*m/(4*k));
% Vector of angular speeds
Omega = [w0
    w0
    w0
    w0];

omg_vec = [0
    0
    sum(Omega.^2)];

tau = 2*w0*[L*k*(Omega(1) - Omega(3))
    L*k*(Omega(2) - Omega(4))
    b*(Omega(1) - Omega(2) + Omega(3) - Omega(4))];
