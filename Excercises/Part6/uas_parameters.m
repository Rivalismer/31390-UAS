%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% MIT License
% 
% Copyright (c) 2021 David Wuthier (dwuthier@gmail.com)
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% INITIALIZATION

%clear
close all
clc

%% SIMULATION PARAMETERS
% Full test
route = [
    0 0 1
    7 0 1
    7 3 1
    5 3 1
    5 2 1
    3 2 1
    3 3 1
    1 3 1
    1 4 1
    0 4 1
    0 6 1
    3 6 1
    3 5 1
];
%% Non-full test
%route = load('route_ex61.mat').route_2d-1; %path from ex 6.1

%OPTION 1 - TEST ROUTE
%route = [0 0 1 ; 9 0 1 ; 9 9 1]; %test route

%OPTINOA 2 - EX6.1 ROUTE
%run desired section in maze-ex6.4/maze_plotting script and comment
%the route above to r
%route = [route ones(size(route,1),1)];

% 6.2 test routes
%route = [0 0 1; 1 0 1];
%route = [0 0 1; 5 0 1];
%route = [0 0 1; 9 0 1];


wall_color = [0.8 0.2 0.2];
sample_time = 4e-2;
publish_rate = 1 * sample_time;
x0 = 36;
y0 = 80;
z0 = 1;
g = 9.80665 ;
mass_drone = 0.68 ;
mass_rod = 0.0;
mass_tip = 0;
mass_total = mass_drone + mass_rod + mass_tip;
stiffness_rod = 100 ;
critical_damping_rod = 2 * sqrt(mass_total * stiffness_rod) ;
stiffness_wall = 100 ;
critical_damping_wall = 2 * sqrt(mass_total * stiffness_wall) ;
inertia_xx = 0.007 ;
inertia_yy = 0.007 ;
inertia_zz = 0.012 ;
arm_length = 0.17 ;
rotor_offset_top = 0.01 ; 
motor_constant = 8.54858e-06 ;
moment_constant = 0.016 ;
max_rot_velocity = 838 ;
allocation_matrix = ...
    [1 1 1 1
     0 arm_length 0 -arm_length
     -arm_length 0 arm_length 0
     -moment_constant moment_constant -moment_constant moment_constant] ;
mix_matrix = inv(motor_constant * allocation_matrix) ;
air_density = 1.2041;
drag_coefficient = 0.47;
reference_area = pi * 75e-3^2;


% Position Controller values
tf_xy = [0 -1 0
    1 0 0];
K_pxy = diag([5 5 2]);
K_dxy = diag([3.5 3.5 1.8]);
K_ixy = diag([0 0 0]);

% Attitude Controller values
I_xyz = diag([inertia_xx inertia_yy inertia_zz]);
K_p = diag([5 5 1]);
K_d = diag([1.5 1.5 1.5]);
K_i = diag([0 0 0]);

%% Plotting 6.2
close all
lim = 20;
fp = linspace(0,lim,length(out.x(1,:)));
figure
plot(fp, out.x(1,:));
title('X - position with input 9')
xlabel('Time(s)')
ylabel('Position')
xlim([0 lim])

figure
plot(fp, out.x(2,:));
title('Y - position')
xlabel('Time(s)')
ylabel('Position')
xlim([0 lim])

figure
plot(out.x(1,:), out.x(2,:))
title('Trajectory of drone in maze')

%% Plotting 6.3
%close all
%lim = 25;
limy = 0.6;
fp = linspace(0,lim, length(out.theta(1,:)));
figure
subplot(3,1,1)
plot(fp, out.theta(1,:))
xlim([0 lim])
ylim([-limy limy])
xlabel('Time(s)')
ylabel('Value in radians')
title('\phi - Angle')

subplot(3,1,2)
plot(fp, out.theta(2,:))
xlim([0 lim])
ylim([-limy limy])
xlabel('Time(s)')
ylabel('Value in radians')
title('\theta - Angle')

subplot(3,1,3)
plot(fp, out.theta(3,:))
xlim([0 lim])
ylim([-limy limy])
xlabel('Time(s)')
ylabel('Value in radians')
title('\psi - Angle')