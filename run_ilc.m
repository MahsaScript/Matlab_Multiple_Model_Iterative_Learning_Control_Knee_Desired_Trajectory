Ts = 0.01;
mgl = [7.56 9.05 8.81 10.02 8.50 9.01];     % Mass Gravitational Length [Nm/rad]  A B C D E F
lambda =[ 2.72 2.20 1.98 3.01 2.52 3.60];   % Elastic Coefficient [Nm/rad]        A B C D E F
Theta0= [0.30 0.30 0.02 -0.05 -0.02 0.09];  % Angualr Velocity [rad]              A B C D E F
Mu =[ 0.27 0.18 0.19 0.23 0.19 0.26]; % Viscosity  [Nms/rad]               A B C D E F
J =[0.265 0.298 0.274 0.360 0.291 0.277]; %[kgm2] Inertia of shank  ساق پا
pw_saturation=[500 500 500 500 500 500];
ILC(Ts, mgl, lambda, Theta0, Mu, J, pw_threshold, pw_saturation);
ILC_IndividualA(Ts, 7.56, 2.72, 0.30, 0.27, 0.265, 200, 500);