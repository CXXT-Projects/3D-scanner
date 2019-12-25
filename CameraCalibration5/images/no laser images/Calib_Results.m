% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1574.003399148921062 ; 1573.709754741643565 ];

%-- Principal point:
cc = [ 599.695034620137108 ; 477.338951110454900 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.538419775076450 ; 0.791255285982061 ; 0.000841878961766 ; 0.001518094565979 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.984350092221165 ; 10.049235413560014 ];

%-- Principal point uncertainty:
cc_error = [ 9.206828107875980 ; 12.053470843512931 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.042414572165565 ; 0.482313728670666 ; 0.001573753984819 ; 0.001734209856035 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 1024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 7;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.212614e+00 ; -2.200281e+00 ; 6.037377e-02 ];
Tc_1  = [ -6.986560e+01 ; -8.585522e+01 ; 4.715319e+02 ];
omc_error_1 = [ 5.301904e-03 ; 5.224806e-03 ; 1.167378e-02 ];
Tc_error_1  = [ 2.768559e+00 ; 3.632534e+00 ; 3.101636e+00 ];

%-- Image #2:
omc_2 = [ -2.213847e+00 ; -2.200754e+00 ; 6.520300e-02 ];
Tc_2  = [ -6.791717e+01 ; -8.505981e+01 ; 5.064643e+02 ];
omc_error_2 = [ 5.624053e-03 ; 5.573023e-03 ; 1.235715e-02 ];
Tc_error_2  = [ 2.971476e+00 ; 3.897792e+00 ; 3.329900e+00 ];

%-- Image #3:
omc_3 = [ -2.192928e+00 ; -2.182694e+00 ; 1.189950e-02 ];
Tc_3  = [ -6.314001e+01 ; -8.457562e+01 ; 5.353013e+02 ];
omc_error_3 = [ 5.864360e-03 ; 5.942322e-03 ; 1.288061e-02 ];
Tc_error_3  = [ 3.143159e+00 ; 4.119892e+00 ; 3.525542e+00 ];

%-- Image #4:
omc_4 = [ 2.031263e+00 ; 1.962100e+00 ; -4.219165e-01 ];
Tc_4  = [ -7.884932e+01 ; -9.749850e+01 ; 5.452122e+02 ];
omc_error_4 = [ 5.080706e-03 ; 5.892711e-03 ; 1.006504e-02 ];
Tc_error_4  = [ 3.197772e+00 ; 4.197069e+00 ; 3.327357e+00 ];

%-- Image #5:
omc_5 = [ -2.050843e+00 ; -2.004987e+00 ; -2.766379e-01 ];
Tc_5  = [ -7.346020e+01 ; -6.922868e+01 ; 4.637180e+02 ];
omc_error_5 = [ 5.082876e-03 ; 5.630903e-03 ; 9.886875e-03 ];
Tc_error_5  = [ 2.720239e+00 ; 3.579801e+00 ; 3.093339e+00 ];

%-- Image #6:
omc_6 = [ 1.922728e+00 ; 1.923803e+00 ; 5.178258e-01 ];
Tc_6  = [ -5.297104e+01 ; -8.552431e+01 ; 4.629216e+02 ];
omc_error_6 = [ 6.139485e-03 ; 3.806855e-03 ; 9.801397e-03 ];
Tc_error_6  = [ 2.721092e+00 ; 3.561717e+00 ; 3.224019e+00 ];

%-- Image #7:
omc_7 = [ -1.794507e+00 ; -1.787002e+00 ; 7.518352e-01 ];
Tc_7  = [ -4.426386e+01 ; -8.440767e+01 ; 5.605101e+02 ];
omc_error_7 = [ 6.290661e-03 ; 3.941941e-03 ; 9.170781e-03 ];
Tc_error_7  = [ 3.278824e+00 ; 4.298267e+00 ; 3.269939e+00 ];

