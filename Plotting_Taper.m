%% Prep
clc
clear
close all force 

%% Loading Data
% F1
A_2353 = load("2.353_A.txt");
F_2353 = load("2.353_F.txt");
A2_2353 = load("2.353_A2.txt");
Fluid_Energy_2353 = load("2.353_FE.txt");

% F2
A_1667 = load("1.667_A.txt");
F_1667 = load("1.667_F.txt");
A2_1667 = load("1.667_A2.txt");
Fluid_Energy_1667 = load("1.667_FE.txt");

% F3
A_1 = load("1.0_A.txt");
F_1 = load("1.0_F.txt");
A2_1 = load("1.0_A2.txt");
Fluid_Energy_1 = load("1.0_FE.txt");

% F4
A_078 = load("0.78_A.txt"); 
F_078 = load("0.78_F.txt");
A2_078 = load("0.78_A2.txt");
Fluid_Energy_078 = load("0.78_FE.txt");

% F5
A_425 = load("0.425_A.txt");
F_425 = load("0.425_F.txt");
A2_425 = load("0.425_A2.txt");
Fluid_Energy_425 = load("0.425_FE.txt");

%% Formatting up data 
% 0.78 
a = [0,0; F_078(1,1), 0]; 
aa = [0,0; A_078(1,1), 0];  
F_078_Up = cat(1, a, F_078(1:6, :));
A_078_Up = cat(1, aa, A_078(1:6, :));
A2_078_Up = cat(1, aa, A2_078(1:6, :));

% 0.425
b = [0,0; F_425(1,1), 0]; 
bb = [0,0; A_425(1,1), 0];
F_425_Up = cat(1, b, F_425(1:3, :));
A_425_Up = cat(1, bb, A_425(1:3, :));
A2_425_Up = cat(1, bb, A2_425(1:3, :));

% 1.667 
c = [0,0; F_1667(1,1), 0]; 
cc = [0,0; A_1667(1,1), 0];
F_1667_Up = cat(1, c, F_1667(1:7, :));
A_1667_Up = cat(1, cc, A_1667(1:7, :));
A2_1667_Up = cat(1, cc, A2_1667(1:7, :));

% 2.353 
d = [0,0; F_2353(1,1), 0]; 
dd = [0,0; A_2353(1,1), 0];
F_2353_Up = cat(1, d, F_2353(1:10, :));
A_2353_Up = cat(1, dd, A_2353(1:10, :));
A2_2352_Up = cat(1, dd, A2_2353(1:10, :));

%% Formatting Down Data
F_078_Down = F_078(7:end, :);
A_078_Down = A_078(7:end, :);
A2_078_Down = A2_078(7:end, :);

F_425_Down = F_425(4:end, :);
A_425_Down = A_425(4:end, :);
A2_425_Down = A2_425(4:end, :);

F_1667_Down = F_1667(8:end, :);
A_1667_Down = A_1667(8:end, :);
A2_1667_Down = A2_1667(8:end, :);

F_2353_Down = F_2353(11:end, :);
A_2353_Down = A_2353(11:end, :);
A2_2353_Down = A2_2353(11:end, :);

F_1_Down = F_1(3:end, :);
A_1_Down = A_1(3:end, :);
A2_1_Down = A2_1(3:end, :);


%% Plotting 

figure(1)
tiledlayout(2,1, 'TileSpacing','tight')
nexttile 
hold all 
grid on
% Ups first
plot(F_2353_Up(:,1), F_2353_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(F_2353_Down(:,1), F_2353_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(F_1667_Up(:,1), F_1667_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
plot(F_1667_Down(:,1), F_1667_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
plot(F_1_Down(:, 1), F_1_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
plot(F_078_Up(:,1), F_078_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
plot(F_078_Down(:,1), F_078_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
plot(F_425_Up(:,1), F_425_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(F_425_Down(:,1), F_425_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
legend
legend('Location','northwest')
legend('F1 Increasing Velocity', 'F1 Decreasing Velocity', 'F2 Increasing Velocity', 'F2 Decreasing Velocity',...
   'F3 Decreasing Velocity', 'F4 Increasing Velocity', 'F4 Decreasing Velocity', 'F5 Increasing Velocity', 'F5 Decreasing Velocity')
set(groot,'DefaultTextInterpreter','latex','defaultAxesTickLabelInterpreter','latex','defaultLegendInterpreter','latex') 
set(gca,'fontname','times') 
set(gca,'FontWeight','bold')
ylabel('Frequency [Hz]')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
set(gca,'xticklabel',[])
box on
ylim([0 20])
title('a) Frequency', 'FontWeight','bold')

nexttile

% figure(2)
hold all 
plot(A_2353_Up(:,1), A_2353_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(A_2353_Down(:,1), A_2353_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(A_1667_Up(:,1), A_1667_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
plot(A_1667_Down(:,1), A_1667_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
plot(A_1_Down(:, 1), A_1_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
plot(A_078_Up(:,1), A_078_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
plot(A_078_Down(:,1), A_078_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
plot(A_425_Up(:,1), A_425_Up(:, 2), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(A_425_Down(:,1), A_425_Down(:, 2), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
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


%% Converting and plotting in dimensionless bending stiffness 
E = 193e9; % Young's Modulus
rho_f = 1.225; % Air density 
v = 0.25; % Poissons ratio
h = 0.1e-3; % Thickness [0.1 mm]

L_F1 = 0.0760/(10^-3);
L_F2 = 0.0960/(10^-3);
L_F3 = 0.1333/(10^-3);
L_F4 = 0.1187/(10^-3);
L_F5 = 0.0760/(10^-3); % Flag Lengths ^^

B = (E * h^3)/(12 * (1 - v^2)); % Flexural Rigidity (not dependent on flag geometry, only material and thickness

Beta_F1_Up = B./(rho_f .* F_2353_Up(:,1).^2 * (L_F1*10^(-3))^3); 
Beta_F2_Up = B./(rho_f .* F_1667_Up(:,1).^2 * (L_F2*10^(-3))^3);
Beta_F4_Up = B./(rho_f .* F_078_Up(:,1).^2 * (L_F4*10^(-3))^3);
Beta_F5_Up = B./(rho_f .* F_425_Up(:,1).^2 * (L_F5*10^(-3))^3); % Bending stiffness increasing velocity ^^

Beta_F1_Down = B./(rho_f .* F_2353_Down(:,1).^2 * (L_F1*10^(-3))^3);
Beta_F2_Down = B./(rho_f .* F_1667_Down(:,1).^2 * (L_F2*10^(-3))^3);
Beta_F3_Down = B./(rho_f .* F_1_Down(:,1).^2 * (L_F3*10^(-3))^3);
Beta_F4_Down = B./(rho_f .* F_078_Down(:,1).^2 * (L_F4*10^(-3))^3);
Beta_F5_Down = B./(rho_f .* F_425_Down(:,1).^2 * (L_F5*10^(-3))^3);% Bending stiffness decreasing velocity ^^

AL_F1_Up = A2_2352_Up(:,2)/L_F1;
AL_F2_Up = A2_1667_Up(:,2)/L_F2;
AL_F4_Up = A2_078_Up(:,2)/L_F4;
AL_F5_Up = A2_425_Up(:,2)/L_F5;


AL_F1_Down = A2_2353_Down(:,2)/L_F1;
AL_F2_Down = A2_1667_Down(:,2)/L_F2;
AL_F3_Down = A2_1_Down(:,2)/L_F3;
AL_F4_Down = A2_078_Down(:,2)/L_F4;
AL_F5_Down = A2_425_Down(:,2)/L_F5;
AL_F5_Down(8,:) = [];

figure(2)
hold all 
grid on
plot(Beta_F1_Up(:,1), AL_F1_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(Beta_F1_Down(:,1), AL_F1_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(Beta_F2_Up(:,1), AL_F2_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
plot(Beta_F2_Down(:,1), AL_F2_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
plot(Beta_F3_Down(:, 1), AL_F3_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
plot(Beta_F4_Up(:,1), AL_F4_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
plot(Beta_F4_Down(:,1), AL_F4_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
plot(Beta_F5_Up(:,1), AL_F5_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(Beta_F5_Down(:,1), AL_F5_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
legend
legend('Location','southeast')
legend('F1 Increasing Velocity', 'F1 Decreasing Velocity', 'F2 Increasing Velocity', 'F2 Decreasing Velocity',...
   'F3 Decreasing Velocity', 'F4 Increasing Velocity', 'F4 Decreasing Velocity', 'F5 Increasing Velocity', 'F5 Decreasing Velocity')
set(groot,'DefaultTextInterpreter','latex','defaultAxesTickLabelInterpreter','latex','defaultLegendInterpreter','latex') 
set(gca,'fontname','times') 
set(gca,'FontWeight','bold')
ylabel('A/L')
xlabel('$\beta$')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
box on
title('A/L vs $\beta$', 'FontWeight','bold')

%% Plotting A/L Vs Beta Vs Windspeed (top x-axis)

% t = tiledlayout(1,1);
% 
% ax1 = axes(t);
% l_F1 = plot(ax1, Beta_F1_Up(:,1), AL_F1_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r');
% l_F2 = plot(ax1, Beta_F1_Down(:,1), AL_F1_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r');
% ax1.Color = 'none';
% ylabel('A/L')
% xlabel('$\beta$')
% grid on
% 
% ax2 = axes(t);
% l2_F1 = plot(ax2, Beta_F1_Up(:,1), F_2353_Up(:,1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r');
% ax2.XAxisLocation = 'origin';
% ax2.YAxisLocation = 'right';
% ax2.Color = 'none';
% set(gca,'xtick',[])
% grid on
% 
% figure(3)
% yyaxis left
% hold on
% plot(Beta_F1_Up(:,1), AL_F1_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
% plot(Beta_F1_Down(:,1), AL_F1_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
% plot(Beta_F2_Up(:,1), AL_F2_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
% plot(Beta_F2_Down(:,1), AL_F2_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
% plot(Beta_F3_Down(:, 1), AL_F3_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
% plot(Beta_F4_Up(:,1), AL_F4_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
% plot(Beta_F4_Down(:,1), AL_F4_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
% plot(Beta_F5_Up(:,1), AL_F5_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
% plot(Beta_F5_Down(:,1), AL_F5_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
% yyaxis right
% plot(Beta_F1_Up(:,1), F_2353_Up(:,1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r');
% plot(Beta_F1_Down(:,1), F_2353_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
% plot(Beta_F2_Up(:,1), F_1667_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
% plot(Beta_F2_Down(:,1), F_1667_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
% plot(Beta_F3_Down(:, 1), F_1_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
% plot(Beta_F4_Up(:,1), F_078_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
% plot(Beta_F4_Down(:,1), F_078_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
% plot(Beta_F5_Up(:,1), F_425_Up(:, 1), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
% plot(Beta_F5_Down(:,1), F_425_Down(:, 1), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
% grid on
% legend('F1 Increasing Velocity', 'F1 Decreasing Velocity', 'F2 Increasing Velocity', 'F2 Decreasing Velocity',...
%    'F3 Decreasing Velocity', 'F4 Increasing Velocity', 'F4 Decreasing Velocity', 'F5 Increasing Velocity', 'F5 Decreasing Velocity')


%% Plotting Taper vs Different Peaks


figure(3)
hold on 
plot(F_2353(1:10,1), Fluid_Energy_2353(1:10), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(F_2353(10:end,1), Fluid_Energy_2353(10:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(F_1667(1:7,1), Fluid_Energy_1667(1:7), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
plot(F_1667(8:end,1), Fluid_Energy_1667(8:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
plot(F_1(3:end,1), Fluid_Energy_1(3:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
plot(F_078(1:6,1), Fluid_Energy_078(1:6), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
plot(F_078(7:end,1), Fluid_Energy_078(7:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
plot(F_425(1:3,1), Fluid_Energy_425(1:3), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(F_425(4:13,1), Fluid_Energy_425(4:13), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
legend('F1 Increasing Velocity', 'F1 Decreasing Velocity', 'F2 Increasing Velocity', 'F2 Decreasing Velocity',...
   'F3 Decreasing Velocity', 'F4 Increasing Velocity', 'F4 Decreasing Velocity', 'F5 Increasing Velocity', 'F5 Decreasing Velocity')
legend('location', 'northwest')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
grid on
ylabel('Fluid Energy [J]')
xlabel('Windspeed [m/s]')
title('Fluid energy imparted onto each flag to achieve max deflection at a given windspeed')

figure(4)
hold on 
plot(F_2353(1:10,1), 0.17 * Fluid_Energy_2353(1:10), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'r')
plot(F_2353(10:end,1), 0.17 * Fluid_Energy_2353(10:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'r')
plot(F_1667(1:7,1), 0.17 * Fluid_Energy_1667(1:7), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'g')
plot(F_1667(8:end,1), 0.17 * Fluid_Energy_1667(8:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'g')
plot(F_1(3:end,1), 0.17 * Fluid_Energy_1(3:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', "#7E2F8E")
plot(F_078(1:6,1), 0.17 * Fluid_Energy_078(1:6), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'm')
plot(F_078(7:end,1), 0.17 * Fluid_Energy_078(7:end), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'm')
plot(F_425(1:3,1), 0.17 * Fluid_Energy_425(1:3), 'LineStyle', '-', 'Marker', '.', 'MarkerSize', 16, 'Color', 'b')
plot(F_425(4:13,1), 0.17 * Fluid_Energy_425(4:13), 'LineStyle', '--', 'Marker', 'diamond', 'MarkerSize', 5, 'Color', 'b')
legend('F1 Increasing Velocity', 'F1 Decreasing Velocity', 'F2 Increasing Velocity', 'F2 Decreasing Velocity',...
   'F3 Decreasing Velocity', 'F4 Increasing Velocity', 'F4 Decreasing Velocity', 'F5 Increasing Velocity', 'F5 Decreasing Velocity')
legend('location', 'northwest')
set(gca, 'XMinorTick', 'on')
set(gca, 'YMinorTick', 'on')
grid on
ylabel('Bending Energy [J]')
xlabel('Windspeed [m/s]')
title('Theoretical bending energy in each flag at maximum delflection for corresponding wind speeds')

%% Calculating Fluid Energy and Plotting Estimated Mechanical Power





