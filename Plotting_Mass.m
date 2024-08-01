%% Prep
clc
clear
close all force 

%% Loading Data
% F1
A_1 = load("0.1mm_A.txt");
F_1 = load("0.1mm_F.txt");
A2_1 = load("0.1mm_A2.txt");

% F2
A_05 = load("0.05mm_A.txt");
F_05 = load("0.05mm_F.txt");
A2_05 = load("0.05mm_A2.txt");

%% Formatting up data 
% 0.1 mm
a = [0,0; F_1(1,1), 0]; 
aa = [0,0; A_1(1,1), 0];  
F_1_Up = cat(1, a, F_1(1:3, :));
A_1_Up = cat(1, aa, A_1(1:3, :));
A2_1_Up = cat(1, aa, A2_1(1:3, :));

% 0.05 mm 
b = [0,0; F_05(1,1), 0]; 
bb = [0,0; A_05(1,1), 0];
F_05_Up = cat(1, b, F_05(1:3, :));
A_05_Up = cat(1, bb, A_05(1:3, :));
A2_05_Up = cat(1, bb, A2_05(1:3, :));

%% Formatting Down Data
F_1_Down = F_1(4:end, :);
A_1_Down = A_1(4:end, :);
A2_1_Down = A2_1(4:end, :);

F_05_Down = F_05(3:end, :);
A_05_Down = A_05(3:end, :);
A2_05_Down = A2_05(3:end, :);

%% Plotting 

figure(1)
tiledlayout(2,1, 'TileSpacing','tight')
nexttile 
hold all 
grid on
% Ups first
plot(F_1_Up(:,1), F_1_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(F_1_Down(:,1), F_1_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(F_05_Up(:,1), F_05_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(F_05_Down(:,1), F_05_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
legend
legend('Location','northwest')
legend('$\mu$ = 5.669 Increasing Velocity','$\mu$ = 5.669 Decreasing Velocity', '$\mu$ = 2.835 Increasing Velocity', '$\mu$ = 2.835 Decreasing Velocity')
set(groot,'DefaultTextInterpreter','latex','defaultAxesTickLabelInterpreter','latex','defaultLegendInterpreter','latex') 
set(gca,'fontname','times') 
set(gca,'FontWeight','bold')
ylabel('Frequency [Hz]')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
set(gca,'xticklabel',[])
box on
title('a) Frequency', 'FontWeight','bold')

nexttile

% figure(2)
hold all 
plot(A_1_Up(:,1), A_1_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(A_1_Down(:,1), A_1_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(A_05_Up(:,1), A_05_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(A_05_Down(:,1), A_05_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
grid on
xlabel('Windspeed [m/s]')
ylabel('Amplitude [$^{\circ}$]')
box on
set(groot,'DefaultTextInterpreter','latex','defaultAxesTickLabelInterpreter','latex','defaultLegendInterpreter','latex') 
set(gca,'fontname','times') 
set(gca,'FontWeight','bold')
title('b) Amplitude', 'FontWeight','bold')

%% Converting into and plotting dimensionless bending stiffness
E = 193e9; % Young's Modulus
rho_f = 1.225; % Air density 
v = 0.25; % Poissons ratio
h = 0.1e-3; % Thickness [0.1 mm]

% F1 = 1, F2 = 05

L_F1 = 0.13/(10^-3);
L_F2 = L_F1;

B = (E * h^3)/(12 * (1 - v^2)); % Flexural Rigidity (not dependent on flag geometry, only material and thickness

Beta_F1_Up = B./(rho_f .* F_1_Up(:,1).^2 * (L_F1*10^(-3))^3); 
Beta_F2_Up = B./(rho_f .* F_05_Up(:,1).^2 * (L_F2*10^(-3))^3);

Beta_F1_Down = B./(rho_f .* F_1_Down(:,1).^2 * (L_F1*10^(-3))^3);
Beta_F2_Down = B./(rho_f .* F_05_Down(:,1).^2 * (L_F2*10^(-3))^3);

AL_F1_Up = A2_1_Up(:,2)/L_F1;
AL_F2_Up = A2_05_Up(:,2)/L_F2;

AL_F1_Down = A2_1_Down(:,2)/L_F1;
AL_F2_Down = A2_05_Down(:,2)/L_F2;

figure(2)
hold all 
grid on
plot(Beta_F1_Up(:,1), AL_F1_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(Beta_F1_Down(:,1), AL_F1_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(Beta_F2_Up(:,1), AL_F2_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(Beta_F2_Down(:,1), AL_F2_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
legend
legend('Location','southeast')
legend('$\mu$ = 5.669 Increasing Velocity','$\mu$ = 5.669 Decreasing Velocity', '$\mu$ = 2.835 Increasing Velocity', '$\mu$ = 2.835 Decreasing Velocity')
set(groot,'DefaultTextInterpreter','latex','defaultAxesTickLabelInterpreter','latex','defaultLegendInterpreter','latex') 
set(gca,'fontname','times') 
set(gca,'FontWeight','bold')
ylabel('A/L')
xlabel('$\beta$')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
box on
title('A/L vs $\beta$', 'FontWeight','bold')











