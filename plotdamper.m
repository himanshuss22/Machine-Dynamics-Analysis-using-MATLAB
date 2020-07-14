function plotdamper(stroke_length_max,damper_foot,damper_head,y_offset_d,clr_d,lnwdth)

%% DESCRIPTION
%
% Function plots a damper
%
%
%% INPUT
%       stroke_length_max ... Maximum stroke length from foot to head
%       damper_foot ... position of damper foot
%       damper_head ... position of damper head
%       y_offset_d ... y offset of the damper
%       clr_d ... Color of the damper
%       lnwdth ... Linewidth of the faces
%
%% OUTPUT
%       Plot of a damper
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
x_d(1) = 0 + damper_foot;
x_d(2) = -stroke_length_max*0.02 + damper_foot;       
x_d(3) = -stroke_length_max*0.02 + damper_foot;       
x_d(4) = -stroke_length_max*0.02 + damper_foot;       
x_d(5) = -stroke_length_max*0.9 + damper_foot;        
x_d(6) = -stroke_length_max*0.9 + damper_foot;        
x_d(10) = damper_head;
x_d(7) = x_d(10) + stroke_length_max*0.1;                              
x_d(8) = x_d(10) + stroke_length_max*0.1;                             
x_d(9) = x_d(10) + stroke_length_max*0.1;                             

y_d(1) = 0 + y_offset_d;                                                    
y_d(2) = 0.1 + y_offset_d;                                                     
y_d(3) = -0.1 + y_offset_d;                                                
y_d(4) = 0 + y_offset_d;                                               
y_d(5) = -0.1 + y_offset_d;                                         
y_d(6) = 0.1 + y_offset_d;                                          
y_d(7) = -0.09 + y_offset_d;                                                
y_d(8) = 0.09 + y_offset_d;                                                     
y_d(9) = 0 + y_offset_d;                                                    
y_d(10) = 0 + y_offset_d;                                                    

z_d(1) = 0.1;                                                    
z_d(2) = -0.1;                                                    

vertices_d = [x_d(1) y_d(1) z_d(1);x_d(2) y_d(2) z_d(1);x_d(3) y_d(3) z_d(1);x_d(4) y_d(4) z_d(1);x_d(5) y_d(5) z_d(1);...
              x_d(6) y_d(6) z_d(1);x_d(7) y_d(7) z_d(1);x_d(8) y_d(8) z_d(1);x_d(9) y_d(9) z_d(1);x_d(10) y_d(10) z_d(1);...
              x_d(1) y_d(1) z_d(2);x_d(2) y_d(2) z_d(2);x_d(3) y_d(3) z_d(2);x_d(4) y_d(4) z_d(2);x_d(5) y_d(5) z_d(2);...
              x_d(6) y_d(6) z_d(2);x_d(7) y_d(7) z_d(2);x_d(8) y_d(8) z_d(2);x_d(9) y_d(9) z_d(2);x_d(10) y_d(10) z_d(2)]; 

faces = [1 4 14 11;2 3 13 12;3 5 15 13;2 6 16 12;7 8 18 17;9 10 20 19];

%% 3.) Plot
patch('Vertices', vertices_d, 'Faces', faces, 'FaceColor', clr_d,'EdgeColor', clr_d,'linewidth',lnwdth);
end
