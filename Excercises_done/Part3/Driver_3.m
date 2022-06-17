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
Km = 1;
Tc = 1.34;

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

u1 = [ref
    theta
    psi
    z];

% Transfer func
tf = [1
    1
    1
    1/k];

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

%% Plotting
fp = 10;
Ta = linspace(0,fp,length(out.Theta(:,1)));
Tp = linspace(0,fp,length(out.p(:,1)));
Tpl = ceil(length(Tp)/2);

close all;
figure
subplot(3,1,1)
%plot(out.Theta(l:(l + fp),1))
plot(Ta,out.Theta(:,1))
xlabel('Time (s)')
ylabel('Value')
title('\phi - Angle')
%xlim([0 fp])

subplot(3,1,2)
%plot(out.Theta(l:(l + fp),2))
plot(Ta,out.Theta(:,2))
xlabel('Time (s)')
ylabel('Value')
title('\Theta - Angle')
%xlim([0 fp])

subplot(3,1,3)
%plot(out.Theta(l:(l + fp),3))
plot(Ta,out.Theta(:,3))
xlabel('Time (s)')
ylabel('Value')
title('\psi - Angle')
%xlim([0 fp])

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