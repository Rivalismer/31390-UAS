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
K_p = 1.5;
K_d = 0.8; %Tc / 8
K_i = 0.1; %1.4925....

ref = 10/180*pi;
% Reference
phi = 0;
theta = 0;
psi = 0;
z = 0;

u0 = [phi
    theta
    psi
    z];

u1 = [phi
    theta
    ref
    1];

% Transfer func
tf = [1 
    1
    1
    1/k];

mvec = [1
    1
    1
    m];

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

%% Plotting
l = ceil(length(out.Theta(1,:))/2);
lp = ceil(length(out.p(:,1))/2);
fp = 5000;

close all;
figure
subplot(3,1,1)
plot(out.Theta(1, l:(l + fp)))
xlabel('Time (ms)')
ylabel('Value')
title('\phi - Angle')
xlim([0 fp])

subplot(3,1,2)
plot(out.Theta(2, l:(l + fp)))
xlabel('Time (ms)')
ylabel('Value')
title('\Theta - Angle')
xlim([0 fp])

subplot(3,1,3)
plot(out.Theta(3, l:(l + fp)))
xlabel('Time (ms)')
ylabel('Value')
title('\psi - Angle')
xlim([0 fp])

figure
subplot(3,1,1)
plot(out.p(lp:(lp+fp),3))
xlabel('Time (ms)')
ylabel('Value')
title('z - Value')
xlim([0 fp])
ylim([-1 2])

subplot(3,1,2)
plot(out.p(lp:(lp+fp),2))
xlabel('Time (ms)')
ylabel('Value')
title('y - Value')
xlim([0 fp])

subplot(3,1,3)
plot(out.p(lp:(lp+fp),1))
xlabel('Time (ms)')
ylabel('Value')
title('x - Value')
xlim([0 fp])