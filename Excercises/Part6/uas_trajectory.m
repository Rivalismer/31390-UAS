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

knots = [0 5]; %time
waypoints = cell(1,2);
waypoints{1} = [0 ; 0 ; 2];
waypoints{2} = [9 ; 9 ; 2];

% Fix this...
order = 7;
corridors.times = [0 1.15 1.84 2.99];
corridors.x_lower = [-0.5 3.5 7.65 8.6];
corridors.x_upper = [0.5 4.5 7.85 9.25];
corridors.y_lower = [-0.5 -0.6 0.7 6.85];
corridors.y_upper = [0.5 -0.48 0.9  7.25];
corridors.z_lower = [0 0 0 0];
corridors.z_upper = [2 2 2 2];
% % ...until here

make_plots = true;
poly_traj = uas_minimum_snap(knots, order, waypoints, corridors, make_plots);
