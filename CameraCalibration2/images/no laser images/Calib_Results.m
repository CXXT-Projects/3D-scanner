% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1580.279418040357541 ; 1583.831648800001631 ];

%-- Principal point:
cc = [ 594.164927753021857 ; 472.871768921444470 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.581485895658822 ; 1.348879256943099 ; 0.000634819642111 ; 0.004005530033598 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 41.772322813451389 ; 42.177875824146660 ];

%-- Principal point uncertainty:
cc_error = [ 22.562124054056948 ; 24.821554299670385 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.074024386516808 ; 0.548879645242154 ; 0.003402453756629 ; 0.004239548875349 ; 0.000000000000000 ];

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
omc_1 = [ -2.201498e+00 ; -2.213383e+00 ; 3.226029e-02 ];
Tc_1  = [ -6.227221e+01 ; -8.791366e+01 ; 4.824156e+02 ];
omc_error_1 = [ 1.333736e-02 ; 1.381417e-02 ; 2.931060e-02 ];
Tc_error_1  = [ 6.929492e+00 ; 7.611787e+00 ; 1.294867e+01 ];

%-- Image #2:
omc_2 = [ -2.022955e+00 ; -2.072655e+00 ; 3.461398e-01 ];
Tc_2  = [ -5.699162e+01 ; -9.045781e+01 ; 5.135989e+02 ];
omc_error_2 = [ 1.341821e-02 ; 1.112565e-02 ; 2.418426e-02 ];
Tc_error_2  = [ 7.344796e+00 ; 8.076866e+00 ; 1.307547e+01 ];

%-- Image #3:
omc_3 = [ 2.063791e+00 ; 2.075260e+00 ; 2.842197e-01 ];
Tc_3  = [ -4.587088e+01 ; -8.803898e+01 ; 4.600068e+02 ];
omc_error_3 = [ 1.332203e-02 ; 1.003222e-02 ; 2.360540e-02 ];
Tc_error_3  = [ 6.630908e+00 ; 7.257268e+00 ; 1.253408e+01 ];

%-- Image #4:
omc_4 = [ 2.054659e+00 ; 2.023563e+00 ; -3.183805e-01 ];
Tc_4  = [ -6.120803e+01 ; -9.934872e+01 ; 5.257420e+02 ];
omc_error_4 = [ 1.179162e-02 ; 1.307023e-02 ; 2.388750e-02 ];
Tc_error_4  = [ 7.533657e+00 ; 8.268569e+00 ; 1.314402e+01 ];

%-- Image #5:
omc_5 = [ -1.981361e+00 ; -2.019776e+00 ; -2.522967e-01 ];
Tc_5  = [ -5.491891e+01 ; -7.595276e+01 ; 4.260209e+02 ];
omc_error_5 = [ 1.096347e-02 ; 1.312351e-02 ; 2.197262e-02 ];
Tc_error_5  = [ 6.113888e+00 ; 6.740522e+00 ; 1.147766e+01 ];

%-- Image #6:
omc_6 = [ 2.216793e+00 ; 2.214685e+00 ; -4.072889e-03 ];
Tc_6  = [ -5.414389e+01 ; -9.774249e+01 ; 3.715477e+02 ];
omc_error_6 = [ 1.000159e-02 ; 9.374142e-03 ; 2.215120e-02 ];
Tc_error_6  = [ 5.377991e+00 ; 5.895260e+00 ; 9.953730e+00 ];

%-- Image #7:
omc_7 = [ 2.196992e+00 ; 2.189365e+00 ; -5.286067e-02 ];
Tc_7  = [ -5.496841e+01 ; -8.150648e+01 ; 6.049908e+02 ];
omc_error_7 = [ 1.832894e-02 ; 1.710148e-02 ; 3.810708e-02 ];
Tc_error_7  = [ 8.667865e+00 ; 9.515774e+00 ; 1.626475e+01 ];

