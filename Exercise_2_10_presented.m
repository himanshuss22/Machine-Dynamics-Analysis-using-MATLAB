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
%      creation date: 03-May-2016
%     Matlab version: 2016b
%
%% REVISION
%
% V1.0 | 03-May-2016 | Martin Lankers | creation
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
time                       = 1;                   % Time [s]

x_0                        = 0.01;                % Initial Condition displacement
x_dot_0                    = 0;                   % Initial Condition velocity

%% 2.) Computing
%open_system('Exercise_2_10_solve_equation_with_simulink_modell')
sim('Exercise_2_10_simulink_modell_presented') 

time = simout.time';                        % Rename
x_t = simout.data(:,2)';                    % Rename         
v_t = simout.data(:,1)';                    % Rename
