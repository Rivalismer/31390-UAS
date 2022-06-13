
% This file contains parameters and calculations needed for running
% MatLab with rotorS ROS package for interfacing with a position controlled
% drone

%%
clc;
close all;
clear all;

%%

maze_1; %stores map variable
start = [0, 0];
end_ = [3,5];

fig_num = 1;

plot_map(map, fig_num);
plot_start_stop(start, end_, fig_num)

route = greedy_2d(rot90(rot90(rot90(map))), start+1, end_+1);
% save("route_ex61",'route_2d')

plot_route(route_2d, fig_num);

%%

fig_num = 2;

maze_1_3D; %stores map variable

start = [0 0 0];
end_ = [7 7 2];

plot_map(map, fig_num, 0);
plot_start_stop(start, end_, fig_num)

route = greedy_3d(rot90(rot90(rot90(map))), start+1, end_+1);
% save("route_ex61",'route_2d')

plot_route(route_3d, fig_num);

%%

fig_num = 3;

maze_1_3D; %stores map variable

start = [0 0 0];
end_ = [7 7 2];

plot_map(map, fig_num, 0);
plot_start_stop(start, end_, fig_num)

route = astar_3d(rot90(rot90(rot90(map))), start+1, end_+1);
% save("route_ex61",'route_2d')

plot_route(route_3d, fig_num);

