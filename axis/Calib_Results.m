% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1578.747005773893534 ; 1577.363986649882690 ];

%-- Principal point:
cc = [ 582.319140073274070 ; 510.722926156829885 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.470145418634216 ; 0.530063998004169 ; -0.000897397927368 ; 0.000937772501413 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 15.688626795934898 ; 15.109105992218284 ];

%-- Principal point uncertainty:
cc_error = [ 12.638767776327452 ; 19.786614716563022 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.045128336145844 ; 0.358802084487863 ; 0.001689907472705 ; 0.002479350366485 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 1024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 9;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.172938e+00 ; 2.220786e+00 ; -5.282345e-02 ];
Tc_1  = [ -5.050676e+01 ; -1.183012e+02 ; 4.911777e+02 ];
omc_error_1 = [ 9.249802e-03 ; 8.893869e-03 ; 1.952133e-02 ];
Tc_error_1  = [ 3.952508e+00 ; 6.189557e+00 ; 5.021408e+00 ];

%-- Image #2:
omc_2 = [ -2.044186e+00 ; -2.101015e+00 ; 3.671715e-01 ];
Tc_2  = [ -5.521524e+01 ; -1.184005e+02 ; 5.123418e+02 ];
omc_error_2 = [ 9.053539e-03 ; 6.868693e-03 ; 1.740203e-02 ];
Tc_error_2  = [ 4.091329e+00 ; 6.443159e+00 ; 5.057649e+00 ];

%-- Image #3:
omc_3 = [ -1.849133e+00 ; -1.925943e+00 ; 6.346322e-01 ];
Tc_3  = [ -5.215309e+01 ; -1.188126e+02 ; 5.340333e+02 ];
omc_error_3 = [ 9.551878e-03 ; 5.773729e-03 ; 1.563393e-02 ];
Tc_error_3  = [ 4.279353e+00 ; 6.717725e+00 ; 4.997643e+00 ];

%-- Image #4:
omc_4 = [ -1.658360e+00 ; -1.748395e+00 ; 8.450407e-01 ];
Tc_4  = [ -4.411956e+01 ; -1.190395e+02 ; 5.525093e+02 ];
omc_error_4 = [ 1.009471e-02 ; 6.139955e-03 ; 1.421725e-02 ];
Tc_error_4  = [ 4.436041e+00 ; 6.952162e+00 ; 4.986042e+00 ];

%-- Image #5:
omc_5 = [ 2.064647e+00 ; 2.065585e+00 ; 2.211766e-01 ];
Tc_5  = [ -4.537504e+01 ; -1.172861e+02 ; 4.718936e+02 ];
omc_error_5 = [ 9.492017e-03 ; 6.678840e-03 ; 1.688162e-02 ];
Tc_error_5  = [ 3.819332e+00 ; 5.945962e+00 ; 4.851245e+00 ];

%-- Image #6:
omc_6 = [ 1.887771e+00 ; 1.869377e+00 ; 5.192734e-01 ];
Tc_6  = [ -2.827219e+01 ; -1.168868e+02 ; 4.540289e+02 ];
omc_error_6 = [ 1.008705e-02 ; 5.404074e-03 ; 1.507610e-02 ];
Tc_error_6  = [ 3.668235e+00 ; 5.705693e+00 ; 4.850774e+00 ];

%-- Image #7:
omc_7 = [ 1.801723e+00 ; 1.776081e+00 ; 6.340106e-01 ];
Tc_7  = [ -1.930548e+01 ; -1.169493e+02 ; 4.486246e+02 ];
omc_error_7 = [ 1.037010e-02 ; 5.445541e-03 ; 1.438322e-02 ];
Tc_error_7  = [ 3.623471e+00 ; 5.633486e+00 ; 4.863904e+00 ];

%-- Image #8:
omc_8 = [ 2.175675e+00 ; 2.224827e+00 ; -4.419092e-02 ];
Tc_8  = [ -5.268161e+01 ; -1.180492e+02 ; 4.297935e+02 ];
omc_error_8 = [ 8.196874e-03 ; 7.897186e-03 ; 1.754343e-02 ];
Tc_error_8  = [ 3.465087e+00 ; 5.425676e+00 ; 4.408937e+00 ];

%-- Image #9:
omc_9 = [ 2.185736e+00 ; 2.235797e+00 ; -1.110004e-01 ];
Tc_9  = [ -4.909497e+01 ; -1.187838e+02 ; 5.785545e+02 ];
omc_error_9 = [ 1.070585e-02 ; 1.067309e-02 ; 2.326393e-02 ];
Tc_error_9  = [ 4.637240e+00 ; 7.278802e+00 ; 5.910232e+00 ];

