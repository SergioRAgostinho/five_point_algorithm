function pts = triangulate(pts1, pts2, K1, K2, E, R, t)
%TRIANGULATE Given 2D point matches between two images and the
% transformatiom between them in terms of the rotation matrix R and the
% translation vector t, such a point in camera 1 reference frame, can be
% transformed to camera 2 reference frame through, P_2 = [R t; zeros(1,3) 1]
% This triangulation method assumes ideal point correspondence and it is
% presented in "An Efficient Solution to the Five-Point Relative Pose 
% Problem" by David Nister. 
% DOI: http://dx.doi.org/10.1109/TPAMI.2004.17
%
% Known Issues:
% - There's no need to request E and R|t
%
% TODO:
% - Fix the required arguments. 
%
% Author: Sergio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
% Date: Mar 2015
% Version: 0.9
% Repo: https://github.com/SergioRAgostinho/five_point_algorithm
% Feel free to provide feedback or contribute.

if size(pts1,1) ~= 2 || size(pts2,1) ~= 2
    error('triangulate:wrong_dimensions','pts1 and pts2 must be of size 2xn');
end

if size(pts1,2) ~= size(pts2,2)
    error('triangulate:wrong_dimensions','pts1 and pts2 must have the same number of points');
end

if ~all(size(R) == [3, 3])
    error('triangulate:wrong_dimensions','R must be of size 3x3');
end

if ~all(size(t) == [3, 1])
    error('triangulate:wrong_dimensions','t must be of size 3x1');
end

n = size(pts1,2);
pts = zeros(4,n);
q_1 = K1 \ [pts1; ones(1,n)];
q_2 = K2 \ [pts2; ones(1,n)];

for m = 1:n
    a = E'*q_2(:,m);
    b = cross_vec3(q_1(:,m), [a(1:2); 0]);
    c = cross_vec3(q_2(:,m), diag([1 1 0])*E*q_1(:,m));
    d = cross_vec3(a, b);

    P = [R t];
    C = P'*c;
    Q = [d*C(4); -d(1:3)'*C(1:3)]; 
    
    pts(:,m) = Q;
end

end