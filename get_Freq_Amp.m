function [Frequency, Amplitude, Amplitude2] = get_Freq_Amp(Time, x, y, A, B, C, D)



Theta = zeros(height(Time), 1);

for i = 1:height(Time)
    if x(i) > 0 && y(i) > 0
        Theta(i,1) = rad2deg(atan(x(i)/y(i)));
    elseif x(i) < 0 && y(i) > 0
        Theta(i,1) = -rad2deg(atan(x(i)/y(i)));
    elseif x(i) < 0 && y(i) < 0
        Theta(i,1) = 90 + rad2deg(atan(y(i)/x(i)));
    elseif x(i) > 0 && y(i) < 0
        Theta(i,1) = 90 + rad2deg(atan(abs(y(i))/x(i)));
    end
end

Theta = 2 * Theta;
pks = findpeaks(Theta);
Amplitude = mean(pks);



t_axis = linspace(min(Time), max(Time), height(Time));

if isempty(A)||isempty(B)||isempty(C)||isempty(D)
    [matlab_sine_wave,~] = fit(Time, x, 'sin1');
    final_sine_wave = matlab_sine_wave(t_axis);
else 
    final_sine_wave = A * sin(B * t_axis + C) + D;
end

%% Frequency from x - T sine  wave 
[~, peak_indices] = findpeaks(final_sine_wave, 1);
period = diff(t_axis(peak_indices([1, 2])));
Frequency = 1/period;

Amplitude2 = max(final_sine_wave)-min(final_sine_wave);


end