%% Prep
clc
clear
close all force 

%% Data Import
header = 2;
delimiter = '\t';

for i = 2401:1:2401
    filename = [num2str(i),'.txt'];
    dat = importdata(filename,delimiter,header);
    Data = dat.data;

    Time = Data(:,1);
    x = Data(:,2);
    y = Data(:,3);

    [Frequency(i - 2400,2), Amplitude(i - 2400,2), Amplitude2(i - 2400,2)] = get_Freq_Amp(Time, x, y, [], [], [], []);
end

for i = 2402
    filename = [num2str(i),'.txt'];
    dat = importdata(filename,delimiter,header);
    Data = dat.data;

    Time = Data(:,1);
    x = Data(:,2);
    y = Data(:,3);

    [Frequency(i - 2400,2), Amplitude(i - 2400,2), Amplitude2(i - 2400,2)] = get_Freq_Amp(Time, x, y, 3.9e1, 2.55e1, 1, 7.1e1);
end

for i = 2403
    filename = [num2str(i),'.txt'];
    dat = importdata(filename,delimiter,header);
    Data = dat.data;

    Time = Data(:,1);
    x = Data(:,2);
    y = Data(:,3);

    [Frequency(i - 2400,2), Amplitude(i - 2400,2), Amplitude2(i - 2400,2)] = get_Freq_Amp(Time, x, y, 9.5, 2.79e1, -2.8e-1, 1.4e2);
end



for i = 2404:1:2409
    filename = [num2str(i),'.txt'];
    dat = importdata(filename,delimiter,header);
    Data = dat.data;

    Time = Data(:,1);
    x = Data(:,2);
    y = Data(:,3);

    [Frequency(i - 2400,2), Amplitude(i - 2400,2), Amplitude2(i - 2400,2)] = get_Freq_Amp(Time, x, y, [], [], [], []);
end

Frequency(:,1) = [9.39
9.79
10.10
9.63
9.22
8.34
7.36
6.81
5.96];

Amplitude(:,1) = [9.39
9.79
10.10
9.63
9.22
8.34
7.36
6.81
5.96];

save("0.1mm_F.txt", "Frequency","-ascii")
save("0.1mm_A.txt", "Amplitude","-ascii")
save("0.1mm_A2.txt", "Amplitude2","-ascii")