function h_out = frustrum(R,t,h)
%   Work in progress
%
%   Author: Sergio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
%   Date: Mar 2015
%   Version: 0.9
%   Repo: https://github.com/SergioRAgostinho/five_point_algorithm
%   Feel free to provide feedback or contribute.

T = [R t; zeros(1,3) 1];
R_view = [0 0 1 0; -1 0 0 0 ; 0 -1 0 0; 0 0 0 1];
frame = [1 0 0 0; 
         0 1 0 0;
         0 0 1 0;
         1 1 1 1];
        

pts = R_view *(T \ frame);


if nargin > 2 && ishandle(h)
    next_plot = get(h, 'NextPlot');
    set(h, 'NextPlot', 'add');

    h_p = plot3(h, [pts(1,4) pts(1,1)], [pts(2,4) pts(2,1)], [pts(3,4) pts(3,1)], 'r', ...
               [pts(1,4) pts(1,2)], [pts(2,4) pts(2,2)], [pts(3,4) pts(3,2)], 'g', ...
               [pts(1,4) pts(1,3)], [pts(2,4) pts(2,3)], [pts(3,4) pts(3,3)], 'b');
    set(h, 'NextPlot', next_plot);
else
    h_p = plot3([pts(1,4) pts(1,1)], [pts(2,4) pts(2,1)], [pts(3,4) pts(3,1)], 'r', ...
               [pts(1,4) pts(1,2)], [pts(2,4) pts(2,2)], [pts(3,4) pts(3,2)], 'g', ...
               [pts(1,4) pts(1,3)], [pts(2,4) pts(2,3)], [pts(3,4) pts(3,3)], 'b');
end

h_out = get(h_p(1), 'Parent');

end