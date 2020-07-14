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
time                       = 0:0.01:1;            % Time [s]

x_0                        = 0.01;                % Initial Condition displacement
x_dot_0                    = 0;                   % Initial Condition velocity
    
%% 1.) -Symbolic function definition
syms x(t)                                         % Define dependent variable
Dx = diff(x,1);                                   % Define first derivation
D2x = diff(x,2);                                  % Define second derivation

%% 2.) Computing
%% 2.) -Solve the equation
x = dsolve( mass*D2x + damping*Dx + stiffness*x == 0  ,x(0)==x_0  ,Dx(0) == x_dot_0,  't');  % Initial conditions units are [m] and [m/s] respectively
        
%% 2.) -Evaluate the equation
x_fun = matlabFunction(x);                        % Create function handle for x
x_dot_fun = matlabFunction(diff(x));              % Create function handle for x_dot

x_t = x_fun(time);                                % Evaluate function at points "time"
v_t = x_dot_fun(time);                            % Evaluate function at points "time"
              
%% 3.) Plot
%% 3.) -Initialise figures
run('Exercise_2_3_presented.m')                       % Runs the script to initialise the figures

%% 3.) -Draw ground
hold on
run('Exercise_2_4_ground_presented.m')                              % Runs the script to draw the ground

%% 3.) -Draw mass
run('Exercise_2_4_mass_presented.m')                                % Runs the script to draw the mass

%% 3.) -Draw spring
run('Exercise_2_5_presented.m')                              % Runs the script to draw the spring

%% 3.) -Draw damper
run('Exercise_2_6_presented.m')                              % Runs the script to draw the damper

%% 3.) -Draw Coordinate System
run('Exercise_2_7_presented.m')                                 % Runs the script to draw the Coordinate system

%% 3.) -Plot Animation and graph
% Initialise vectors
x_t_length = length(x_t);
t_plot = NaN(1,x_t_length);
x_t_plot = NaN(1,x_t_length);
v_t_plot = NaN(1,x_t_length);

u = 1;                                            % Counting variable
for k = 1 : x_t_length                            % Start Loop for Animation
    cla                                           % clear last picture
    
    % Plot Graph
    t_plot(k) = time(u);                          % Build up time vector
    x_t_plot(k) = x_t(u);                         % Build up displacement vector
    v_t_plot(k) = v_t(u);                         % Build up velocitity vector
    set(graph_plot(1),'Parent',axes_graph(1), 'XData', t_plot, 'YData', x_t_plot);      % Set new Values to displacement graph
    set(graph_plot(2),'Parent',axes_graph(2), 'XData', t_plot, 'YData', v_t_plot);      % Set new Values to velocity graph
    
    % Plot ground system
    plotcube(axes_ani,dimension_g,position_g,clr_g)  % Plot ground
      
    % Plot ground mass
    position_m = [x_t(u) 0 0];                       % Define new position of mass
    plotcube(axes_ani,dimension_m,position_m,clr_m)  % Plot mass at new position
    
    % Plot spring
    spring_head = x_t(u) + dimension_m(1)/2;         % Calculate new position of spring head
    x_pos_spring = phi_s/phi_max * (spring_head - spring_foot) + spring_foot;               % Calculate new x values for spring
    plot3(axes_ani,x_pos_spring,y_pos_spring,z_pos_spring,'b','linewidth',lnwdth)       % Use plot3 function to plot spring
    
    % Plot damper
    damper_head = x_t(u) + dimension_m(1)/2;         % Calculate new position of damper head
    plotdamper(stroke_length_max,damper_foot,damper_head,y_offset_d,clr_d,lnwdth)   % Plot damper    
    
    % Plot Cos 
    plotcos(x_ar,variable_cos,clr_cos,lnwdth,fntsz)
    
    
    % Set View Angle of Animation
    view(90,-90);                                 % Rotate Animation
    
    % Plot title and label of Animation
    title(title_ani,'fontsize',fntsz)             % Title of Animation
    xlabel(xlabel_ani,'fontsize',fntsz)           % Label x-axis of Animation
    
    drawnow                                       % Update figures
    
    u = u +1;                                     % Increase counting variable by 1
end