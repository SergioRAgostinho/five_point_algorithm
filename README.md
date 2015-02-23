# Five-Point Algorithm
A MATLAB implementation of the Five-Point Algorithm by David Nistér

Given five points matches between two images, and the intrinsic parameters of each camera. Estimate the essential matrix `E`, the rotation matrix `R` and translation vector `t`, between both images. This algorithm is based on the method described by David Nistér in ["An Efficient Solution to the Five-Point Relative Pose Problem"](http://dx.doi.org/10.1109/TPAMI.2004.17)

#### Arguments:

`pts1`, `pts2` - assumed to have dimension 2x5 and of equal size. 

`K1`, `K2` - 3x3 intrinsic parameters of cameras 1 and 2 respectively

#### Known Issues:

The algorithm is still incomplete. I'm releasing it at this early stage because it already provides proper estimates of the essential matrix. Although there is more than one solution, I'm currently only returning the first. I still need to figure out how to select the "best" if such exists. 

#### TODO:
- [ ] Extract `R` and `t` from `E`
- [ ] Provide example cases.
- [ ] Implement the variant with 5 points over 3 images
- [ ] Handle more than 5 points

#### Other Info
* Author: Sérgio Agostinho - sergio(dot)r(dot)agostinho(at)gmail(dot)com 
* Date: Feb 2015
* Version: 0.8

Feel free to provide feedback or aid in the development. 
