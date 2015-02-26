% FIVE_POINT_ALGORITHM - 
% Example 1: minimal example
%
%   The point matches were extracted from two pictures taken with the same
%   camera

[path, ~, ~] = fileparts(which('ex_01_minimal'));
addpath([path '/..']);
clear path

pts1 = [288.8398   12.1534  317.5059   74.5754   44.1327;
        77.2382  163.7803   82.8476  220.5643  192.9634];

pts2 = [286.1892    6.9846  312.5673   70.0283   40.2131;
        76.7289  164.3921   81.3119  220.4840  194.1166];

K = [602.5277   0           177.3328;
     0          562.9129    102.8893;
     0          0           1.0000];
 
[E, Eo] = five_point_algorithm(pts1, pts2, K, K);