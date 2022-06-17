clc;
close all;
len = linspace(0, length(out.p.Data(:,1)), length(out.p.Data(:,1)));

%% Thrust and PWM
figure
subplot(2,1,1)
plot(out.p.Time, out.thrust1.Data(1,:))
title('Thrust')
ylabel('Force [N]')
xlabel('Time [s]')

subplot(2,1,2)
plot(out.pwm.Time, out.pwm.Data(:,1))
title('PWM')
ylabel('Command')
xlabel('Time [s]')


%% Positions
trans = pagetranspose(out.reference.Data);


figure
subplot(3,1,1)
hold on
plot(out.p.Time, out.p.Data(:,1))
%yline(p0test(1) + 0.05)
plot(out.reference.Time, trans(1,:))
%yline(p0test(1) - 0.05)
hold off
title('X position')
xlabel('Time [s]')
ylabel('Meters')
%legend('Output value', 'Upper limit', 'Reference', 'Lower Limit') 
%ylim([1.1 1.5])

subplot(3,1,2)
hold on
plot(out.p.Time, out.p.Data(:,2))
plot(out.reference.Time, trans(2,:))
hold off
title('Y position')
ylabel('Meters')
xlabel('Time [s]')
legend('Output value', 'Reference') 
ylim([-3.2 -2.8])

subplot(3,1,3)
hold on
plot(out.p.Time, out.p.Data(:,3))
plot(out.reference.Time, trans(3,:))
hold off
title('Z position')
xlabel('Time [s]')
ylabel('Meters')
%legend('Output value', 'Upper limit', 'Reference', 'Lower Limit') 
ylim([.7 1.3])

%% X-Y / X-Y-Z plots
figure
plot(out.p.Data(:,1), out.p.Data(:,2))
title('X-Y plot of hovering drone')
xlabel('x [m]')
ylabel('y [m]')
axis equal

%% Errors
ref = squeeze(out.reference.Data);
% euc = sum((out.p.Data - ref').^2, 2).^0.5;
% figure
% hold on
% plot(out.p.Time, euc)
% yline(.1)
% hold off
% title('Euclidean error')
% xlabel('Time [s]')
% ylabel('Error [m]')
% %ylim([-0 0.2])


err = out.p.Data - ref';
figure
hold on
plot(out.p.Time, err(:,1))
plot(out.p.Time, err(:,2))
plot(out.p.Time, err(:,3))
yline(.3)
hold off
xlabel('Time [s]')
ylabel('Error [m]')
title('X-Y-Z errors')
legend('X - Error', 'Y - Error', 'Z - Error')
%ylim([-.2 .2])