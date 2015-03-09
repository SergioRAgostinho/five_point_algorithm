function out = cross_vec3(u, v)
%CROSS_VEC3 Function to compute the cross product of two 3D vectors. The
%   function disregards if they're row or collumn vectors. The default 
%   MATLAB implementation is simply too slow. 
%
%   Author: Sergio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
%   Date: Mar 2015
%   Version: 0.9
%   Repo: https://github.com/SergioRAgostinho/five_point_algorithm
%   Feel free to provide feedback or contribute.

if numel(u) ~= 3
    error('cross_vec3:wrong_dimensions','u must be either 1x3 ou 3x1');
end

if numel(v) ~= 3
    error('cross_vec3:wrong_dimensions','v must be either 1x3 ou 3x1');
end

out = [ u(2)*v(3) - u(3)*v(2);
        u(3)*v(1) - u(1)*v(3);
        u(1)*v(2) - u(2)*v(1)];
end