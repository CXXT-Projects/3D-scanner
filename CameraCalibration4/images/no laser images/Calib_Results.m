% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1563.990489411675981 ; 1564.692645371775370 ];

%-- Principal point:
cc = [ 592.526695977754571 ; 470.445256927638468 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.561097367505693 ; 0.922578867786286 ; 0.002047989956483 ; 0.003226470731764 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 17.122023519007364 ; 17.192307560195850 ];

%-- Principal point uncertainty:
cc_error = [ 9.389872625601418 ; 11.857342061091243 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.036873242595539 ; 0.347252229594233 ; 0.001719591520322 ; 0.001879103995265 ; 0.000000000000000 ];

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
omc_1 = [ -2.188667e+00 ; -2.199820e+00 ; -6.448875e-03 ];
Tc_1  = [ -5.662561e+01 ; -8.442382e+01 ; 4.373507e+02 ];
omc_error_1 = [ 4.914405e-03 ; 5.239146e-03 ; 1.132012e-02 ];
Tc_error_1  = [ 2.644152e+00 ; 3.337715e+00 ; 4.836652e+00 ];

%-- Image #2:
omc_2 = [ 2.218049e+00 ; 2.224383e+00 ; -4.778981e-02 ];
Tc_2  = [ -5.375718e+01 ; -8.363950e+01 ; 5.004358e+02 ];
omc_error_2 = [ 5.908018e-03 ; 5.627143e-03 ; 1.263530e-02 ];
Tc_error_2  = [ 3.016992e+00 ; 3.807426e+00 ; 5.543252e+00 ];

%-- Image #3:
omc_3 = [ -2.206354e+00 ; -2.217213e+00 ; 2.269048e-02 ];
Tc_3  = [ -5.666725e+01 ; -8.299919e+01 ; 5.456846e+02 ];
omc_error_3 = [ 6.149677e-03 ; 6.479992e-03 ; 1.378140e-02 ];
Tc_error_3  = [ 3.289080e+00 ; 4.151532e+00 ; 6.054719e+00 ];

%-- Image #4:
omc_4 = [ -2.068275e+00 ; -2.018337e+00 ; -2.326479e-01 ];
Tc_4  = [ -6.367394e+01 ; -7.030824e+01 ; 4.583293e+02 ];
omc_error_4 = [ 5.094978e-03 ; 5.669235e-03 ; 1.005091e-02 ];
Tc_error_4  = [ 2.762017e+00 ; 3.498204e+00 ; 5.092844e+00 ];

%-- Image #5:
omc_5 = [ 2.132117e+00 ; 2.104349e+00 ; -2.972927e-01 ];
Tc_5  = [ -6.522702e+01 ; -9.139573e+01 ; 5.245153e+02 ];
omc_error_5 = [ 5.312133e-03 ; 5.866439e-03 ; 1.119866e-02 ];
Tc_error_5  = [ 3.151556e+00 ; 3.982867e+00 ; 5.550880e+00 ];

%-- Image #6:
omc_6 = [ -2.053399e+00 ; -2.063917e+00 ; 3.619779e-01 ];
Tc_6  = [ -5.409302e+01 ; -8.346871e+01 ; 5.277531e+02 ];
omc_error_6 = [ 5.794845e-03 ; 4.526813e-03 ; 1.069782e-02 ];
Tc_error_6  = [ 3.164111e+00 ; 4.003102e+00 ; 5.538468e+00 ];

%-- Image #7:
omc_7 = [ 1.963368e+00 ; 1.968096e+00 ; 3.996087e-01 ];
Tc_7  = [ -3.886587e+01 ; -8.404569e+01 ; 4.809516e+02 ];
omc_error_7 = [ 6.209280e-03 ; 4.066417e-03 ; 9.998925e-03 ];
Tc_error_7  = [ 2.902478e+00 ; 3.654388e+00 ; 5.478381e+00 ];

