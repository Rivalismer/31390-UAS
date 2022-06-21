%% 3-D example 

rosshutdown
rosinit
msg = rostopic("echo", '/vrpn_client_node/hoop1/pose');
hoop1 = [msg.Pose.Position.X msg.Pose.Position.Y, msg.Pose.Position.Z]';
msg = rostopic("echo", '/vrpn_client_node/hoop2/pose');
hoop2 = [msg.Pose.Position.X msg.Pose.Position.Y, msg.Pose.Position.Z]';
msg = rostopic("echo", '/vrpn_client_node/hoop3/pose');
hoop3 = [msg.Pose.Position.X msg.Pose.Position.Y, msg.Pose.Position.Z]';
msg = rostopic("echo", '/vrpn_client_node/hoop4/pose');
hoop4 = [msg.Pose.Position.X msg.Pose.Position.Y, msg.Pose.Position.Z]';
rosshutdown
clc

waypoints = cell(1,6);
waypoints{1} = [0 ; -2 ; 0];
waypoints{2} = [0 ; -2 ; 1];
waypoints{3} = hoop1;
waypoints{4} = hoop2;
waypoints{5} = hoop3;
waypoints{6} = hoop4;
% waypoints{6} = [0 ; -2 ; 0];
wp = cell2mat(waypoints);
wp = wp';

corridors.x_lower = [wp(1,1)-0.25 wp(2,1)-0.25 wp(5,1)-0.25 wp(4,1)-0.25 wp(3,1)-0.25]; 
corridors.x_upper = [wp(1,1)+0.25 wp(2,1)+0.25 wp(5,1)+0.25 wp(4,1)+0.25 wp(3,1)+0.25]; 
corridors.y_lower = [wp(1,2)-0.25 wp(2,2)-0.25 wp(5,2)-0.25 wp(4,2)-0.25 wp(3,2)-0.25];
corridors.y_upper = [wp(1,2)+0.25 wp(2,2)+0.25 wp(5,2)+0.25 wp(4,2)+0.25 wp(3,2)+0.25]; 
corridors.z_lower = [1.3124-0.05 1.3124-0.05 1.3124-0.05 1.3124-0.05 1.3124-0.05];
corridors.z_upper = [1.3124+0.05 1.3124+0.05 1.3124+0.05 1.3124+0.05 1.3124+0.05];

wp = wp';

% 1. Prameter setting
dim = 3;
knots = [0 2 4 7 10 13]; % knots
order = 8; % polynomial order 
% optimTarget = 'poly-coeff'; % 'poly-coeff' or 'end-derivative'
optimTarget = 'end-derivative'; % 'poly-coeff' or 'end-derivative'
maxConti = 4; % maximally imposed continuity between segment 
objWeights = [0 1];  % 1 2 3 th order derivative
pTraj = PolyTrajGen(knots,order,optimTarget,dim,maxConti);

% 2. Pin 
% 2.1 FixPin 
ts = [0 2 4 7 10 13]; % knots
Xs = [0 2 5 7 ; ...
        0 -1 3 -5 ; ...
        0 2 4 5]; % waypoints
Xs = wp;
    
Xdot = [ 0 ;
            0 ; 
            0]; % initial velocity

Xddot = [ 0 ;
              0 ; 
              0]; % initial acceleration

% Order 0 pin (waypoints)
for m = 1:size(Xs,2)
    pin = struct('t',ts(m),'d',0,'X',Xs(:,m));
    pTraj.addPin(pin);
end   
% Order 1 pin 
pin = struct('t',ts(1),'d',1,'X',Xdot);
pTraj.addPin(pin);
% Order 2 pin 
pin = struct('t',ts(1),'d',2,'X',Xddot);
pTraj.addPin(pin);

% 2.2 LoosePin
for i = 2:3
    if i == 3
        break
    end
    passCube = [corridors.x_lower(i) corridors.x_upper(i);
                corridors.y_lower(i) corridors.y_upper(i);
                corridors.z_lower(i) corridors.z_upper(i);];
    pin = struct('t',3,'d',0,'X',passCube);
    pTraj.addPin(pin);
end

% 3. Solve 
pTraj.setDerivativeObj(objWeights); % set the objective function for penalizing the derivatives 
tic
pTraj.solve;
toc

figh3 = figure(3); clf
figh4 = figure(4); clf
titleStr1 = sprintf('poly order : %d / max continuity: %d / ',order,maxConti);
titleStr2 = [' minimzed derivatives order: ', num2str(find(objWeights > 0))];
sgtitle(strcat(titleStr1,titleStr2))
set(figh3,'Position',[193 294 1473 610]);
plotOrder = 3; % Until 3rd order derivatives 
pTraj.showTraj(plotOrder,figh3) % plot element-wise trajectory 
pTraj.showPath(figh4)
view([-41 33])    
axis([-1 11 -6 10 0 8])    



%% Plot 
figuretitle = '7';
figh3 = figure(3); clf
figh4 = figure(4); clf
titleStr1 = sprintf('poly order : %d / max continuity: %d / ',order,maxConti);
titleStr2 = [' minimzed derivatives order: ', num2str(find(objWeights > 0))];
sgtitle(strcat(titleStr1,titleStr2))
set(figh3,'Position',[193 294 1473 610]);
plotOrder = 3; % Until 3rd order derivatives 
pTraj.showTraj(plotOrder,figh3) % plot element-wise trajectory 
pTraj.showPath(figh4)
view([-41 33])    
axis([-1 11 -6 10 0 8])    
figure(figh3); print(['test_img/traj_' figuretitle],'-dpng','-r200')
figure(figh4); print(['test_img/path_' figuretitle],'-dpng','-r200')
