% Constants
m = 0.5;
k = 0.01;
L = 0.225;
b = 0.001;
D = diag([0.01, 0.01, 0.01]);
I = diag([3e-6, 3e-6, 1e-5]);
I_tf = diag([3e-6, 3e-6, 1e-5, 1]);
In = inv(I);
w0 = sqrt(9.81*m/(4*k));
g = [0,0,-9.81];
g2 = [0,0,0,-9.81];

% Controller
K_p = 1.9;
K_d = 2.5*(1/2.65);
K_i = 0.2*(1/2.65);

% Reference
phi = 10/180*pi;
theta = 0;
psi = 0;
z = 0;

u = [phi
    theta
    psi
    z];

% Transfer func
tf = [1
    1
    1
    1/(4*k)];

mvec = [1
    1
    1
    m];

TF = diag(tf);

tf2 = [L*k, 0, -L*k, 0
    0, L*k, 0, -L*k
    b, -b, b, -b
    1, 1, 1, 1];

TF2 = inv(tf2);

tf_34 = [L*k, 0, -L*k, 0
    0, L*k, 0, -L*k
    b, -b, b, -b];

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