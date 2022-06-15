clc
close all

ts = squeeze(out.thrust.time);
data = squeeze(out.thrust.data);

plot(ts,data)
xlabel("t [s]")
ylabel("Thrust [N]")
