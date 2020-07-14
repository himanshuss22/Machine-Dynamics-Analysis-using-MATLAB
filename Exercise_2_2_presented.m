%% DESCRIPTION
%
% This is a Script to solve the differential equation of a single mass 
% system.
%
%% OUTPUT
%
% Formatted figure of the displacement of a single mass system and its
% animation.
%
%% VERSION
%             author: Martin Lankers (Martin.Lankers.de)
%      creation date: 25-April-2018
%     Matlab version: 2017a
%
%% REVISION
%
% V1.0 | 25-April-2018 | Martin Lankers | creation
%
%% Program
clear                                             % Delete Workspace
clc                                               % Clear Command Window
close all                                         % Close all figures

%% 1.) Definitions
%% 1.) -Parameter definition
mass                       = 750;                 % Mass of the body [kg]
stiffness                  = 50000;               % Stiffness Coefficient of spring [N/m]
damping                    = 0;                   % Damping coefficient of damper [Ns/m]
time                       = 0:0.01:1;            % Time [s]

x_0                        = 0.01;                % Initial Condition displacement
x_dot_0                    = 0;                   % Initial Condition velocity
    
%% 2.) Computing
%% 2.) -Parameter calculation
dampingcoefficient = damping/(2*mass);              % Calculate damping coefficient
angulareigenfrequency = sqrt(stiffness/mass);       % Calculate angular eigenfrequency

%% 2.) -Calculation of the characteristic polynomial
lambda = roots([1, 2*dampingcoefficient, angulareigenfrequency^2]); %Calculate roots

%% 2.) -Calculation of the constants
k1 = (x_dot_0 - lambda(2)*x_0) / (lambda(1) - lambda(2));           % Calculation of the constant 1
k2 = (lambda(1)*x_0 - x_dot_0) / (lambda(1) - lambda(2));           % Calculation of the constant 2

%% 2.) -Calculation of the solution
x_t_h = k1 * exp(lambda(1)*time) + k2 * exp(lambda(2)*time);                         % Evaluate function at points "time"
v_t_h = k1 * lambda(1) * exp(lambda(1)*time) + k2 * lambda(2) * exp(lambda(2)*time); % Evaluate function at points "time"

x_t = real(x_t_h);                                                  % Make sure only real part is considered
v_t = real(v_t_h);                                                  % Make sure only real part is considered
              
%% 3.) Plot
%% 3.) -Initialise figures
run('Exercise_2_3_initialize_figures.m')                       % Runs the script to initialise the figures

%% 3.) -Draw ground
hold on
run('Exercise_2_4_draw_ground.m')                              % Runs the script to draw the ground

%% 3.) -Draw mass
run('Exercise_2_4_draw_mass.m')                                % Runs the script to draw the mass

%% 3.) -Draw spring
run('Exercise_2_5_draw_spring.m')                              % Runs the script to draw the spring

%% 3.) -Draw damper
run('Exercise_2_6_draw_damper.m')                              % Runs the script to draw the damper

%% 3.) -Draw Coordinate System
run('Exercise_2_7_draw_cos.m')                                 % Runs the script to draw the Coordinate system