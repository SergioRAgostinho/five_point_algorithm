% FIVE_POINT_ALGORITHM - 
% Example 2: minimal example
%
%   Work in Progress - may have bugs
%
%   Given point matches extracted from two pictures and taken with the 
%   same camere with known intrinsic parameters, exemplify the use of
%   five_point_algorithm
%
% Author: Sergio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
% Date: Feb 2015
% Last modified: Mar 2015
% Version: 0.9
% Repo: https://github.com/SergioRAgostinho/five_point_algorithm
% Feel free to provide feedback or contribute.

[path, ~, ~] = fileparts(which('ex_02_minimal'));
addpath([path '/..']);
addpath([path '/../aux']);
clear path

pts1 = [288.8398   12.1534  317.5059   74.5754   44.1327;
        77.2382  163.7803   82.8476  220.5643  192.9634];

pts2 = [286.1892    6.9846  312.5673   70.0283   40.2131;
        76.7289  164.3921   81.3119  220.4840  194.1166];

K = [602.5277   0           177.3328;
     0          562.9129    102.8893;
     0          0           1.0000];
 

[E, R, t, Eo] = five_point_algorithm(pts1, pts2, K, K);

pts3Dhomo = triangulate(pts1, pts2, K, K, E{1}, R{1}, t{1});
pts3D = pts3Dhomo(1:3,:)./(ones(3,1)*pts3Dhomo(4,:));

