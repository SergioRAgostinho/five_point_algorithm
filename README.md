# Five-Point Algorithm
A MATLAB implementation of the Five-Point Algorithm by David Nistér

Given five points matches between two images, and the intrinsic parameters of each camera. Estimate the essential matrix `E`, the rotation matrix `R` and translation vector `t`, between both images. This algorithm is based on the method described by David Nistér in ["An Efficient Solution to the Five-Point Relative Pose Problem"](http://dx.doi.org/10.1109/TPAMI.2004.17)

`E_all = FIVE_POINT_ALGORITHM(pts1, pts2, K1, K2)` returns in `E` all the valid essential matrix solutions for the five point correspondence. If you don't need `R` and `t`, use this version as it avoids computing unnecessary results.

`[E_all, R_all, t_all, Eo_all] = FIVE_POINT_ALGORITHM(pts1, pts2, K1, K2)` also returns in `R_all` and `t_all` all the rotation matrices and translation vectors of camera 2 for the different essential matrices, such that a 3D point in camera 1 reference frame can be transformed into the camera 2 reference frame through `p_2 = R{n}*p_1 + t{n}`. `Eo_all` is the essential matrix before the imposing the structure `U*diag([1 1 0])*V'`. It should help get a better feeling on the accuracy of the solution. All these return values a nx1 cell arrays.

#### Arguments:

`pts1`, `pts2` - assumed to have dimension 2x5 and of equal size. 

`K1`, `K2` - 3x3 intrinsic parameters of cameras 1 and 2 respectively

#### Known Issues:

- R and t computation is done assuming perfect point correspondence.

#### TODO:
- [x]  Extract `R` and `t` from `E`
- [x]  Provide example cases.
- [ ]  Extract `R` and `t` without perfect point correspondence
- [ ]  Augment example cases.
- [ ]  Implement the variant with 5 points over 3 images
- [ ]  Handle more than 5 points

#### Other Info
* Author: Sérgio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
* Date: Feb 2015
* Last modified: Mar 2015
* Version: 0.9

Feel free to provide feedback or contribute.
