function [Fluid_Energy] = Get_Fluid_Energy(Frequency, Ct, U, x) 

pks = findpeaks(x);
Disp = mean(pks);

rho = 1.225; % Fluid density
period = (1/Frequency)*0.25;

Fluid_Energy = 0.5 * rho * U^3 * abs(Disp) * Ct * period;

end