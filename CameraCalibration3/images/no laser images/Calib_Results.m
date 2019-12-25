% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1571.493103821524073 ; 1572.072539349667068 ];

%-- Principal point:
cc = [ 585.391583372690093 ; 470.536502749687145 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.563970978118060 ; 0.911123482249008 ; 0.002157875683009 ; 0.004080013907080 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.465546244644392 ; 9.355140621843701 ];

%-- Principal point uncertainty:
cc_error = [ 7.583003530816233 ; 9.932922924843584 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.029078733454084 ; 0.290457654921210 ; 0.001387549845123 ; 0.001552627929675 ; 0.000000000000000 ];

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
omc_1 = [ -2.186989e+00 ; -2.197830e+00 ; -3.211814e-03 ];
Tc_1  = [ -5.461617e+01 ; -8.444468e+01 ; 4.396335e+02 ];
omc_error_1 = [ 4.469498e-03 ; 4.761545e-03 ; 1.034336e-02 ];
Tc_error_1  = [ 2.135936e+00 ; 2.796284e+00 ; 2.713963e+00 ];

%-- Image #2:
omc_2 = [ -2.216171e+00 ; -2.222465e+00 ; 5.118243e-02 ];
Tc_2  = [ -5.146393e+01 ; -8.366682e+01 ; 5.030038e+02 ];
omc_error_2 = [ 5.216577e-03 ; 5.552027e-03 ; 1.186467e-02 ];
Tc_error_2  = [ 2.436896e+00 ; 3.190182e+00 ; 3.110957e+00 ];

%-- Image #3:
omc_3 = [ -2.205217e+00 ; -2.217926e+00 ; 1.678074e-02 ];
Tc_3  = [ -5.435494e+01 ; -8.352819e+01 ; 5.262810e+02 ];
omc_error_3 = [ 5.529647e-03 ; 5.884499e-03 ; 1.246587e-02 ];
Tc_error_3  = [ 2.551114e+00 ; 3.339214e+00 ; 3.273461e+00 ];

%-- Image #4:
omc_4 = [ -2.204497e+00 ; -2.215205e+00 ; 2.616192e-02 ];
Tc_4  = [ -5.416777e+01 ; -8.302779e+01 ; 5.484928e+02 ];
omc_error_4 = [ 5.851364e-03 ; 6.192313e-03 ; 1.312938e-02 ];
Tc_error_4  = [ 2.656928e+00 ; 3.478485e+00 ; 3.417801e+00 ];

%-- Image #5:
omc_5 = [ -2.066811e+00 ; -2.015435e+00 ; -2.286779e-01 ];
Tc_5  = [ -6.157272e+01 ; -7.032360e+01 ; 4.608601e+02 ];
omc_error_5 = [ 4.435899e-03 ; 4.812998e-03 ; 8.705697e-03 ];
Tc_error_5  = [ 2.232318e+00 ; 2.931833e+00 ; 2.855639e+00 ];

%-- Image #6:
omc_6 = [ 2.133274e+00 ; 2.106536e+00 ; -3.022014e-01 ];
Tc_6  = [ -6.282646e+01 ; -9.141735e+01 ; 5.272069e+02 ];
omc_error_6 = [ 4.780057e-03 ; 5.127432e-03 ; 9.958059e-03 ];
Tc_error_6  = [ 2.545634e+00 ; 3.338769e+00 ; 3.066234e+00 ];

%-- Image #7:
omc_7 = [ -1.867345e+00 ; -1.878572e+00 ; 6.333962e-01 ];
Tc_7  = [ -4.752304e+01 ; -8.331670e+01 ; 5.478228e+02 ];
omc_error_7 = [ 5.206899e-03 ; 3.410423e-03 ; 8.144002e-03 ];
Tc_error_7  = [ 2.643983e+00 ; 3.466984e+00 ; 2.978803e+00 ];

%-- Image #8:
omc_8 = [ -2.050538e+00 ; -2.061067e+00 ; 3.661785e-01 ];
Tc_8  = [ -5.167079e+01 ; -8.349923e+01 ; 5.304258e+02 ];
omc_error_8 = [ 5.036456e-03 ; 4.042759e-03 ; 9.427221e-03 ];
Tc_error_8  = [ 2.555599e+00 ; 3.354863e+00 ; 3.046561e+00 ];

%-- Image #9:
omc_9 = [ -2.187479e+00 ; -2.195952e+00 ; 1.234406e-01 ];
Tc_9  = [ -5.091527e+01 ; -8.358566e+01 ; 5.138947e+02 ];
omc_error_9 = [ 5.364378e-03 ; 5.472397e-03 ; 1.175651e-02 ];
Tc_error_9  = [ 2.481658e+00 ; 3.255363e+00 ; 3.152187e+00 ];

%-- Image #10:
omc_10 = [ 2.119227e+00 ; 2.125840e+00 ; 1.269500e-01 ];
Tc_10  = [ -4.619406e+01 ; -8.384313e+01 ; 4.991311e+02 ];
omc_error_10 = [ 5.330558e-03 ; 4.354385e-03 ; 1.016671e-02 ];
Tc_error_10  = [ 2.425301e+00 ; 3.166808e+00 ; 3.065647e+00 ];

%-- Image #11:
omc_11 = [ 1.965767e+00 ; 1.970410e+00 ; 3.964009e-01 ];
Tc_11  = [ -3.665285e+01 ; -8.406764e+01 ; 4.834945e+02 ];
omc_error_11 = [ 5.277080e-03 ; 3.461609e-03 ; 8.509805e-03 ];
Tc_error_11  = [ 2.346008e+00 ; 3.063208e+00 ; 3.021298e+00 ];

%-- Image #12:
omc_12 = [ 1.847350e+00 ; 1.847370e+00 ; 5.712394e-01 ];
Tc_12  = [ -2.728948e+01 ; -8.411826e+01 ; 4.737870e+02 ];
omc_error_12 = [ 5.446771e-03 ; 3.322077e-03 ; 7.861124e-03 ];
Tc_error_12  = [ 2.297393e+00 ; 2.998921e+00 ; 3.019922e+00 ];

%-- Image #13:
omc_13 = [ 1.696859e+00 ; 1.692884e+00 ; 7.575764e-01 ];
Tc_13  = [ -1.409152e+01 ; -8.414080e+01 ; 4.653448e+02 ];
omc_error_13 = [ 5.659587e-03 ; 3.495188e-03 ; 7.186135e-03 ];
Tc_error_13  = [ 2.255605e+00 ; 2.943657e+00 ; 3.031431e+00 ];

