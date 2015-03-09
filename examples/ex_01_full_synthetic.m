% FIVE_POINT_ALGORITHM - 
% Example 1: Full synthetic
%
%   Draw a fictional cube whose vertices are seen by two camera. Project
%   these points into the camera image plain, run the five_point_method on
%   top of them and verify the final result. 
%
% Author: Sergio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
% Date: Mar 2015
% Version: 0.9
% Repo: https://github.com/SergioRAgostinho/five_point_algorithm
% Feel free to provide feedback or contribute.

[path, ~, ~] = fileparts(which('ex_01_full_synthetic'));
addpath([path '/..']);
addpath([path '/../aux']);
clear path

cube_pts = cube_3D([0 0 10]', 0.2);
cube_pts_homo = [cube_pts; ones(1,size(cube_pts,2))];

K1 = [602.5277   0           177.3328;
      0          562.9129    102.8893;
      0          0           1.0000];
 
K2 = [562.9129   0           102.8893;
     0           602.5277    177.3328;
     0           0           1.0000];

%The first camera will be placed at the origin
P_1 = [eye(3), zeros(3,1)];
cam1_pts = K1*P_1*cube_pts_homo;
pts1 = cam1_pts(1:2,:)./(ones(2,1)*cam1_pts(3,:));

%The second camera will be displaced 1 unit (to match our algorithm
%assumption) in the +x direction of the first camera reference frame and
%rotated -10 degrees in y.
t_o = [1; 0; 0];
R_o = [ cosd(-10)   0   sind(-10);
        0           1   0;
        -sind(-10)  0   cosd(-10)];
P_2 = [R_o', -R_o'*t_o];
cam2_pts = K2*P_2*cube_pts_homo;
pts2 = cam2_pts(1:2,:)./(ones(2,1)*cam2_pts(3,:));

[E, R, t, Eo] = five_point_algorithm(pts1(:,1:5), pts2(:,1:5), K1, K2);

%In this case the first solution is the correct one.
pts3Dhomo = triangulate(pts1, pts2, K1, K2, E{1}, R{1}, t{1});
pts3D = pts3Dhomo(1:3,:)./(ones(3,1)*pts3Dhomo(4,:));

%Display results
cube_pts
pts3D
