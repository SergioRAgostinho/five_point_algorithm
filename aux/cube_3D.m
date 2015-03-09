function cube_pts = cube_3D(centre_3D, size)
%CUBE_3D Auxiliary function that given a cube centre coordinates and the 
%   edge size returns the 3D coordenates of all vertices in a 3x8 matrix. 
%
%   Author: Sergio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
%   Date: Mar 2015
%   Version: 0.9
%   Repo: https://github.com/SergioRAgostinho/five_point_algorithm
%   Feel free to provide feedback or contribute.

if numel(centre_3D) ~= 3
     error('cube_3D:wrong_dimensions:centre_3D',['centre_3D needs to either be a 3x1 collum ' ...
         'vector or a 1x3 row vector']);
end

if numel(size) ~= 1
     error('cube_3D:wrong_dimensions:size', 'size is a scalar');
end

x = centre_3D(1);
y = centre_3D(2);
z = centre_3D(3);
hs = size/2;

cube_pts = [x + hs, x + hs, x - hs, x - hs, x + hs, x + hs, x - hs, x - hs; ...
            y + hs, y - hs, y + hs, y - hs, y + hs, y - hs, y + hs, y - hs; ...
            z + hs, z + hs, z + hs, z + hs, z - hs, z - hs, z - hs, z - hs];
end