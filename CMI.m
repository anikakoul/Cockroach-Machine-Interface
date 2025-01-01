% dq1 is for pwm signal, which goes to motor
dq1 = daq("ni");
addinput(dq1,"myDAQ1", "ai0", "Voltage");
pwm = addoutput(dq1,"myDAQ1", "ctr0", "PulseGeneration");

% dq2 is for analog signal, which makes leg move. this is 1 V.
dq2 = daq("ni");
dq2.Rate = 1000000;
addoutput(dq2, "myDAQ1", "ao0", "Voltage");

% start the motor all the way CCW, start the leg in a resting state 
% pwm parameters (RESET)
pwm.Frequency = 50;
pwm.InitialDelay = 0;
pwm.DutyCycle = 0.1;
start(dq1, "Duration", seconds(1)); 
stop(dq1);

%-----------starting the B here--------------%

% motion 1: upwards (straight part of B)
% pwm parameters
% moves motor slightly from reset to start drawing B
pwm.Frequency = 50;
pwm.InitialDelay = 0;
pwm.DutyCycle = 0.095;
start(dq1, "Duration", seconds(1));
stop(dq1);

% parameters for the sine wave signal
% extension for straight left line in B
frequency = 10; % keep frequency low for extension 
amplitude = 1; % keep a low amplitude for extension  
duration = 4;  
samples = dq2.Rate * duration; % total number of samples
t = linspace(0, duration, samples); % time vector
% generate the full sine wave signal using the time vector
outputSignal = amplitude * sin(2 * pi * frequency * t); 
start(dq2);
write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)
pause(duration);
stop(dq2); 

% moves motor starting top of first hump of B
% Define the PWM frequency
pwm.Frequency = 50;
%pwm.InitialDelay = 0;
% Define the duty cycles to iterate through - 0.1 is CCW, 0.05 is fully CW
% split up duty cycles in chunks so that it draws slowly
dutyCycles = [0.093, 0.09, 0.087, 0.085, 0.083, 0.08, 0.077, 0.075];

% Loop through the duty cycles
for i = 1:length(dutyCycles)
    % Set the current duty cycle
    pwm.DutyCycle = dutyCycles(i);
    
    % Start the PWM signal for 1 second
    start(dq1, "Duration", seconds(0.5));
    
    % Stop the PWM signal
    stop(dq1);
end

% contracts to finish bottom of first hump of B
% parameters for the sine wave signal
frequency = 400; % contraction frequency
amplitude = 2; % keep a lower amplitude for contraction  
duration = 1;  
samples = dq2.Rate * duration; % total number of samples
t = linspace(0, duration, samples); % time vector
% generate the full sine wave signal using the time vector
outputSignal = amplitude * sin(2 * pi * frequency * t); 
start(dq2);
write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)
pause(duration);
stop(dq2); 


% contracts back to y axis
% parameters for the sine wave signal
frequency = 400; % contraction frequency
amplitude = 2; % keep a higher amplitude for contraction  
duration = 1;  
samples = dq2.Rate * duration; % total number of samples
t = linspace(0, duration, samples); % time vector
% generate the full sine wave signal using the time vector
outputSignal = amplitude * sin(2 * pi * frequency * t); 

% moves motor for bottom line of E
% Define the PWM frequency
pwm.Frequency = 50;
pwm.InitialDelay = 0;
% Define the duty cycles to iterate through
dutyCycles1 = [0.093, 0.09, 0.087, 0.085, 0.083, 0.08, 0.077, 0.075];
start(dq2);
write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)

% Loop through the duty cycles
for i = 1:length(dutyCycles1)
    % Set the current duty cycle
    pwm.DutyCycle = dutyCycles1(i);

    % Start the PWM signal for 1 second
    start(dq1, "Duration", seconds(0.5));

    % Stop the PWM signal
    stop(dq1);
end
pause(duration);
stop(dq2); 

% moves motor starting top of first hump of B
% Define the PWM frequency
pwm.Frequency = 50;
%pwm.InitialDelay = 0;
% Define the duty cycles to iterate through - 0.1 is CCW, 0.05 is fully CW
% split up duty cycles in chunks so that it draws slowly
dutyCycles6 = [0.075, 0.077, 0.08, 0.083, 0.085, 0.087, 0.09, 0.093];

% Loop through the duty cycles
for i = 1:length(dutyCycles6)
    % Set the current duty cycle
    pwm.DutyCycle = dutyCycles6(i);
    
    % Start the PWM signal for 1 second
    start(dq1, "Duration", seconds(0.5));
    
    % Stop the PWM signal
    stop(dq1);
end

% % contracts to finish bottom hump of B
% % parameters for the sine wave signal
% frequency = 2000; % contraction frequency
% amplitude = 2; % keep a lower amplitude for contraction  
% duration = 1;  
% samples = dq2.Rate * duration; % total number of samples
% t = linspace(0, duration, samples); % time vector
% % generate the full sine wave signal using the time vector
% outputSignal = amplitude * sin(2 * pi * frequency * t); 
% start(dq2);
% write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)
% pause(duration);
% stop(dq2); 

%-----------starting the E here--------------%

% moves motor to start E
pwm.Frequency = 50;
pwm.InitialDelay = 0;
pwm.DutyCycle = 0.073;
start(dq1, "Duration", seconds(1)); 
stop(dq1);

% slight extension to start E
% parameters for the sine wave signal
frequency = 10; % keep frequency low for extension 
amplitude = 1; % keep a low amplitude for extension  
duration = 3;  
samples = dq2.Rate * duration; % total number of samples
t = linspace(0, duration, samples); % time vector

% generate the full sine wave signal using the time vector
outputSignal = amplitude * sin(2 * pi * frequency * t); 
start(dq2);
write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)
pause(duration);
stop(dq2); 

% moves motor to do top line of E
% Define the PWM frequency
pwm.Frequency = 50;
pwm.InitialDelay = 0;
% Define the duty cycles to iterate through
dutyCycles2 = [0.073, 0.071, 0.069, 0.067, 0.65, 0.063, 0.06, 0.058, 0.056, 0.054, 0.052, 0.05];

% Loop through the duty cycles
for i = 1:length(dutyCycles2)
    % Set the current duty cycle
    pwm.DutyCycle = dutyCycles2(i);

    % Start the PWM signal for 1 second
    start(dq1, "Duration", seconds(0.5));

    % Stop the PWM signal
    stop(dq1);
end

% moves motor back to y axis for E
pwm.Frequency = 50;
pwm.InitialDelay = 0;
pwm.DutyCycle = 0.073;
start(dq1, "Duration", seconds(1)); 
stop(dq1);

% MIDDLE OF E
% parameters for the sine wave signal
frequency = 400; % contraction frequency
amplitude = 2; % keep a higher amplitude for contraction  
duration = 1;  
samples = dq2.Rate * duration; % total number of samples
t = linspace(0, duration, samples); % time vector
% generate the full sine wave signal using the time vector
outputSignal = amplitude * sin(2 * pi * frequency * t); 

% moves motor for bottom line of E
% Define the PWM frequency
pwm.Frequency = 50;
pwm.InitialDelay = 0;
% Define the duty cycles to iterate through
dutyCycles3 = [0.073, 0.071, 0.069, 0.067, 0.65, 0.063, 0.06, 0.058, 0.056, 0.054, 0.052, 0.05];
start(dq2);
write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)

% Loop through the duty cycles
for i = 1:length(dutyCycles3)
    % Set the current duty cycle
    pwm.DutyCycle = dutyCycles3(i);

    % Start the PWM signal for 1 second
    start(dq1, "Duration", seconds(0.5));

    % Stop the PWM signal
    stop(dq1);
end
pause(duration);
stop(dq2); 


% moves motor back to y axis
pwm.Frequency = 50;
pwm.InitialDelay = 0;
pwm.DutyCycle = 0.073;
start(dq1, "Duration", seconds(1)); 
stop(dq1);

% BOTTOM OF E
% contracts back to y axis
% parameters for the sine wave signal
frequency = 2000; % contraction frequency
amplitude = 2; % keep a higher amplitude for contraction  
duration = 3;  
samples = dq2.Rate * duration; % total number of samples
t = linspace(0, duration, samples); % time vector
% generate the full sine wave signal using the time vector
outputSignal = amplitude * sin(2 * pi * frequency * t); 

% moves motor for bottom line of E
% Define the PWM frequency
pwm.Frequency = 50;
pwm.InitialDelay = 0;
% Define the duty cycles to iterate through
dutyCycles4 = [0.073, 0.071, 0.069, 0.067, 0.65, 0.063, 0.06, 0.058, 0.056, 0.054, 0.052, 0.05];
start(dq2);
write(dq2, outputSignal'); % transpose to ensure correct shape (column vector)

% Loop through the duty cycles
for i = 1:length(dutyCycles4)
    % Set the current duty cycle
    pwm.DutyCycle = dutyCycles4(i);

    % Start the PWM signal for 1 second
    start(dq1, "Duration", seconds(0.5));

    % Stop the PWM signal
    stop(dq1);
end
pause(duration);
stop(dq2); 
