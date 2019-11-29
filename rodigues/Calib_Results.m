% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1539.507220880817613 ; 1542.610876967637296 ];

%-- Principal point:
cc = [ 592.108291032051739 ; 510.456295008789709 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.556170909986847 ; 0.351031887190688 ; 0.001294498177812 ; 0.004223203283867 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 46.081126241877158 ; 46.267963410440430 ];

%-- Principal point uncertainty:
cc_error = [ 21.682571803759348 ; 25.949955466882646 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.072867741025921 ; 0.659768167059793 ; 0.004431960070978 ; 0.005603321423281 ; 0.000000000000000 ];

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
omc_1 = [ -2.203479e+00 ; -2.209852e+00 ; 6.771078e-02 ];
Tc_1  = [ -4.603096e+01 ; -9.736220e+01 ; 5.731826e+02 ];
omc_error_1 = [ 1.306286e-02 ; 1.322877e-02 ; 2.908951e-02 ];
Tc_error_1  = [ 8.092189e+00 ; 9.654971e+00 ; 1.742361e+01 ];

%-- Image #2:
omc_2 = [ 2.070614e+00 ; 2.077462e+00 ; 2.576455e-01 ];
Tc_2  = [ -4.470944e+01 ; -9.766145e+01 ; 5.479415e+02 ];
omc_error_2 = [ 1.309500e-02 ; 9.877687e-03 ; 2.346656e-02 ];
Tc_error_2  = [ 7.761185e+00 ; 9.238330e+00 ; 1.693921e+01 ];

%-- Image #3:
omc_3 = [ -1.998408e+00 ; -2.010705e+00 ; 4.344942e-01 ];
Tc_3  = [ -3.953558e+01 ; -9.778105e+01 ; 5.958432e+02 ];
omc_error_3 = [ 1.303280e-02 ; 9.485169e-03 ; 2.347762e-02 ];
Tc_error_3  = [ 8.403745e+00 ; 1.001411e+01 ; 1.722138e+01 ];

%-- Image #4:
omc_4 = [ 2.167377e+00 ; 2.170644e+00 ; -2.273602e-01 ];
Tc_4  = [ -4.461426e+01 ; -1.484457e+02 ; 5.369808e+02 ];
omc_error_4 = [ 1.242065e-02 ; 1.388264e-02 ; 2.669644e-02 ];
Tc_error_4  = [ 7.638316e+00 ; 9.040826e+00 ; 1.613296e+01 ];

%-- Image #5:
omc_5 = [ -2.065352e+00 ; -2.059215e+00 ; -1.912854e-01 ];
Tc_5  = [ -4.292018e+01 ; -8.134121e+01 ; 5.852825e+02 ];
omc_error_5 = [ 1.171597e-02 ; 1.324576e-02 ; 2.428725e-02 ];
Tc_error_5  = [ 8.263156e+00 ; 9.859877e+00 ; 1.799342e+01 ];

%-- Image #6:
omc_6 = [ -2.193801e+00 ; -2.203166e+00 ; 7.787935e-02 ];
Tc_6  = [ -5.565438e+01 ; -9.858057e+01 ; 4.891056e+02 ];
omc_error_6 = [ 1.170863e-02 ; 1.145254e-02 ; 2.588220e-02 ];
Tc_error_6  = [ 6.907988e+00 ; 8.249043e+00 ; 1.489141e+01 ];

%-- Image #7:
omc_7 = [ -2.198781e+00 ; -2.206996e+00 ; 7.104868e-02 ];
Tc_7  = [ -4.065128e+01 ; -9.686512e+01 ; 6.647222e+02 ];
omc_error_7 = [ 1.525775e-02 ; 1.557503e-02 ; 3.391134e-02 ];
Tc_error_7  = [ 9.377345e+00 ; 1.118962e+01 ; 2.019996e+01 ];

