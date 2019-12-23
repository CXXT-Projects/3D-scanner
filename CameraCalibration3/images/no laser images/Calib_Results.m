% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1571.493096049171982 ; 1572.072524190988588 ];

%-- Principal point:
cc = [ 585.391656195165183 ; 470.536677448108264 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.563970801491728 ; 0.911123558314508 ; 0.002157850497764 ; 0.004079987122872 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.465542613048283 ; 9.355137101560823 ];

%-- Principal point uncertainty:
cc_error = [ 7.583000817681667 ; 9.932919333024362 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.029078748315812 ; 0.290458069193640 ; 0.001387548143784 ; 0.001552627120865 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 1024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 13;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.186989e+00 ; -2.197830e+00 ; -3.211883e-03 ];
Tc_1  = [ -5.461619e+01 ; -8.444473e+01 ; 4.396334e+02 ];
omc_error_1 = [ 4.469496e-03 ; 4.761543e-03 ; 1.034335e-02 ];
Tc_error_1  = [ 2.135935e+00 ; 2.796283e+00 ; 2.713962e+00 ];

%-- Image #2:
omc_2 = [ -2.216171e+00 ; -2.222465e+00 ; 5.118240e-02 ];
Tc_2  = [ -5.146395e+01 ; -8.366688e+01 ; 5.030038e+02 ];
omc_error_2 = [ 5.216575e-03 ; 5.552024e-03 ; 1.186466e-02 ];
Tc_error_2  = [ 2.436895e+00 ; 3.190181e+00 ; 3.110956e+00 ];

%-- Image #3:
omc_3 = [ -2.205217e+00 ; -2.217925e+00 ; 1.678068e-02 ];
Tc_3  = [ -5.435497e+01 ; -8.352824e+01 ; 5.262809e+02 ];
omc_error_3 = [ 5.529646e-03 ; 5.884496e-03 ; 1.246586e-02 ];
Tc_error_3  = [ 2.551113e+00 ; 3.339213e+00 ; 3.273459e+00 ];

%-- Image #4:
omc_4 = [ -2.204497e+00 ; -2.215205e+00 ; 2.616181e-02 ];
Tc_4  = [ -5.416780e+01 ; -8.302785e+01 ; 5.484928e+02 ];
omc_error_4 = [ 5.851363e-03 ; 6.192310e-03 ; 1.312938e-02 ];
Tc_error_4  = [ 2.656927e+00 ; 3.478484e+00 ; 3.417800e+00 ];

%-- Image #5:
omc_5 = [ -2.066811e+00 ; -2.015435e+00 ; -2.286780e-01 ];
Tc_5  = [ -6.157274e+01 ; -7.032365e+01 ; 4.608601e+02 ];
omc_error_5 = [ 4.435897e-03 ; 4.812996e-03 ; 8.705695e-03 ];
Tc_error_5  = [ 2.232317e+00 ; 2.931832e+00 ; 2.855638e+00 ];

%-- Image #6:
omc_6 = [ 2.133275e+00 ; 2.106536e+00 ; -3.022012e-01 ];
Tc_6  = [ -6.282648e+01 ; -9.141741e+01 ; 5.272069e+02 ];
omc_error_6 = [ 4.780055e-03 ; 5.127430e-03 ; 9.958054e-03 ];
Tc_error_6  = [ 2.545633e+00 ; 3.338767e+00 ; 3.066233e+00 ];

%-- Image #7:
omc_7 = [ -1.867345e+00 ; -1.878572e+00 ; 6.333961e-01 ];
Tc_7  = [ -4.752307e+01 ; -8.331676e+01 ; 5.478228e+02 ];
omc_error_7 = [ 5.206897e-03 ; 3.410421e-03 ; 8.143998e-03 ];
Tc_error_7  = [ 2.643982e+00 ; 3.466983e+00 ; 2.978802e+00 ];

%-- Image #8:
omc_8 = [ -2.050538e+00 ; -2.061067e+00 ; 3.661784e-01 ];
Tc_8  = [ -5.167081e+01 ; -8.349928e+01 ; 5.304258e+02 ];
omc_error_8 = [ 5.036454e-03 ; 4.042757e-03 ; 9.427216e-03 ];
Tc_error_8  = [ 2.555598e+00 ; 3.354862e+00 ; 3.046560e+00 ];

%-- Image #9:
omc_9 = [ -2.187479e+00 ; -2.195952e+00 ; 1.234405e-01 ];
Tc_9  = [ -5.091529e+01 ; -8.358571e+01 ; 5.138947e+02 ];
omc_error_9 = [ 5.364376e-03 ; 5.472395e-03 ; 1.175650e-02 ];
Tc_error_9  = [ 2.481657e+00 ; 3.255361e+00 ; 3.152186e+00 ];

%-- Image #10:
omc_10 = [ 2.119227e+00 ; 2.125840e+00 ; 1.269501e-01 ];
Tc_10  = [ -4.619408e+01 ; -8.384319e+01 ; 4.991311e+02 ];
omc_error_10 = [ 5.330556e-03 ; 4.354383e-03 ; 1.016671e-02 ];
Tc_error_10  = [ 2.425300e+00 ; 3.166807e+00 ; 3.065646e+00 ];

%-- Image #11:
omc_11 = [ 1.965767e+00 ; 1.970410e+00 ; 3.964011e-01 ];
Tc_11  = [ -3.665287e+01 ; -8.406769e+01 ; 4.834945e+02 ];
omc_error_11 = [ 5.277078e-03 ; 3.461608e-03 ; 8.509804e-03 ];
Tc_error_11  = [ 2.346008e+00 ; 3.063206e+00 ; 3.021297e+00 ];

%-- Image #12:
omc_12 = [ 1.847350e+00 ; 1.847370e+00 ; 5.712395e-01 ];
Tc_12  = [ -2.728951e+01 ; -8.411832e+01 ; 4.737870e+02 ];
omc_error_12 = [ 5.446768e-03 ; 3.322075e-03 ; 7.861123e-03 ];
Tc_error_12  = [ 2.297393e+00 ; 2.998920e+00 ; 3.019921e+00 ];

%-- Image #13:
omc_13 = [ 1.696859e+00 ; 1.692884e+00 ; 7.575765e-01 ];
Tc_13  = [ -1.409154e+01 ; -8.414085e+01 ; 4.653448e+02 ];
omc_error_13 = [ 5.659585e-03 ; 3.495187e-03 ; 7.186134e-03 ];
Tc_error_13  = [ 2.255604e+00 ; 2.943656e+00 ; 3.031430e+00 ];

