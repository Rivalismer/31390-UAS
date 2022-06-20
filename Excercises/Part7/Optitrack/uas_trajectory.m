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

% Initialization
close all
% clear
% clc

% Trajectory generation OPTION 1

knots = [0 1 2 3 4 5 6 7 8]; %time
waypoints = cell(1,8);
waypoints{1} = [0 ; 0 ; 1];
waypoints{2} = [0.8 ; 0.4 ; 1];
waypoints{3} = [1 ; 1 ; 1];
waypoints{4} = [0.6 ; 1.8 ; 1];
waypoints{5} = [0 ; 2 ; 1];
waypoints{6} = [-0.6 ; 1.8 ; 1];
waypoints{7} = [-1 ; 1 ; 1];
waypoints{8} = [-0.8 ; 0.4 ; 1];
waypoints{9} = [0 ; 0 ; 1];

%Fix this...
order = 7;
corridors.times = [0 4]; %time to hit the corridors
corridors.x_lower = [-0.25 -0.25]; 
corridors.x_upper = [0.25 0.25]; 
corridors.y_lower = [-0.25 1.75]; 
corridors.y_upper = [0.25 2.25]; 
corridors.z_lower = [0 0];
corridors.z_upper = [2 2];
% ...until here

% % Fix this...
% order = 7;
% corridors.times = [0 2 4 5.8]; %time to hit the corridors
% corridors.x_lower = [-0.25 1.75 -0.25 -2.25]; 
% corridors.x_upper = [0.25 2.25 0.25 -1.75]; 
% corridors.y_lower = [-0.25 0.75 1.75 0.75]; 
% corridors.y_upper = [0.25 1.25 2.25 1.25]; 
% corridors.z_lower = [1 1 1 1];
% corridors.z_upper = [3 3 3 3];
% % ...until here

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Trajectory generation OPTION 2

% knots = [0 5]; %time
% waypoints = cell(1,2);
% waypoints{1} = [0 ; 0 ; 2];
% waypoints{2} = [9 ; 9 ; 2];

% % Fix this...
% order = 7;
% corridors.times = [0 1.15 1.84 2.99];
% corridors.x_lower = [-0.5 3.5 7.65 8.6];
% corridors.x_upper = [0.5 4.5 7.85 9.25];
% corridors.y_lower = [-0.5 -0.6 0.7 6.85];
% corridors.y_upper = [0.5 -0.48 0.9  7.25];
% corridors.z_lower = [0 0 0 0];
% corridors.z_upper = [2 2 2 2];
% % ...until here

make_plots = true;
poly_traj = uas_minimum_snap(knots, order, waypoints, corridors, make_plots);
