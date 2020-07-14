function plotcube(axis,dimension,position,clr_c)

%% DESCRIPTION
%
% Function plots a defined cube into the selected axis
%
%
%% INPUT
%       axis ... axis where you want the plot to appear
%       dimension ... length (x),width (y) ,height (z) of the cube
%       position ... position of the center of the cube
%       rotate ... rotate the cube around an axis
%       color ... Color of the cube
%       transparency ... Define transparencs of the cube
%
%% OUTPUT
%       Plot of a cube in a desired axis
%
%% EXAMPLE
%
% plotcube(axis_object,[1 1 1],[0.5 0.5 0.5,'r')
%
%% VERSION
%             author: Lankers (Martin Lankers)
%          copyright: 2017 IGM RWTH
%      creation date: 28-Mar-2017
%     Matlab version: 2016b
%            version: 1.0
%
%% REVISION
%
% V1.0 | 28-Mar-2017 | Lankers | creation
%
%
%
%% Programm
%% 1.) Definitions
% No definitions needed

%% 2.) Computing
%% 2.) -Calculate vertices and faces
x_c(1) = -dimension(1)/2;                 % x-coordinate of the cube is half the length
x_c(2) = dimension(1)/2;                % x-coordinate of the cube is half the length
x_c(3) = dimension(1)/2;                 % x-coordinate of the cube is half the length
x_c(4) = -dimension(1)/2;                % x-coordinate of the cube is half the length
x_c(5) = -dimension(1)/2;                 % x-coordinate of the cube is half the length
x_c(6) = dimension(1)/2;                % x-coordinate of the cube is half the length
x_c(7) = dimension(1)/2;                 % x-coordinate of the cube is half the length
x_c(8) = -dimension(1)/2;                % x-coordinate of the cube is half the length

y_c(1) = dimension(2)/2;                 % x-coordinate of the cube is half the length
y_c(2) = dimension(2)/2;                % x-coordinate of the cube is half the length
y_c(3) = -dimension(2)/2;                 % x-coordinate of the cube is half the length
y_c(4) = -dimension(2)/2;                % x-coordinate of the cube is half the length
y_c(5) = dimension(2)/2;                 % x-coordinate of the cube is half the length
y_c(6) = dimension(2)/2;                % x-coordinate of the cube is half the length
y_c(7) = -dimension(2)/2;                 % x-coordinate of the cube is half the length
y_c(8) = -dimension(2)/2;                % x-coordinate of the cube is half the length

z_c(1) = -dimension(3)/2;                 % x-coordinate of the cube is half the length
z_c(2) = -dimension(3)/2;                % x-coordinate of the cube is half the length
z_c(3) = -dimension(3)/2;                 % x-coordinate of the cube is half the length
z_c(4) = -dimension(3)/2;                % x-coordinate of the cube is half the length
z_c(5) = dimension(3)/2;                 % x-coordinate of the cube is half the length
z_c(6) = dimension(3)/2;                % x-coordinate of the cube is half the length
z_c(7) = dimension(3)/2;                 % x-coordinate of the cube is half the length
z_c(8) = dimension(3)/2;                % x-coordinate of the cube is half the length

vertices_c = [x_c(1) y_c(1) z_c(1);x_c(2) y_c(2) z_c(2);x_c(3) y_c(3) z_c(3);x_c(4) y_c(4) z_c(4);...
              x_c(5) y_c(5) z_c(5);x_c(6) y_c(6) z_c(6);x_c(7) y_c(7) z_c(7);x_c(8) y_c(8) z_c(8)];   % Define the eight corners of the cube

faces_c = [4 3 2 1;2 3 7 6;3 4 8 7;1 2 6 5;2 3 7 6;1 4 8 5];               % Define the faces of the cube by four corner for each face

%% 2.) -Translate vertices
vertices_translated = [vertices_c(:,1)+position(1) vertices_c(:,2)+position(2) vertices_c(:,3)+position(3)];

%% 3.) Plot
patch(axis,'Vertices', vertices_translated, 'Faces', faces_c, 'FaceColor', clr_c,'EdgeColor', clr_c);
end
