% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1578.106242687788608 ; 1578.786069885738925 ];

%-- Principal point:
cc = [ 594.106203274454970 ; 468.573549484484204 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.534219387643239 ; 0.586687980836028 ; 0.000850488881511 ; 0.003213261183462 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 5.913090819245598 ; 5.847550385419124 ];

%-- Principal point uncertainty:
cc_error = [ 5.893529152842810 ; 8.267849410094422 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.019510132828488 ; 0.156335266011015 ; 0.001117141992520 ; 0.001138760424208 ; 0.000000000000000 ];

%-- Image size:
nx = 1280;
ny = 1024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 11;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.207504e+00 ; 2.203866e+00 ; -1.487183e-02 ];
Tc_1  = [ -6.006678e+01 ; -7.565581e+01 ; 4.678271e+02 ];
omc_error_1 = [ 4.249042e-03 ; 3.949408e-03 ; 8.928467e-03 ];
Tc_error_1  = [ 1.755959e+00 ; 2.461797e+00 ; 1.836294e+00 ];

%-- Image #2:
omc_2 = [ -2.075606e+00 ; -2.070180e+00 ; 3.235870e-01 ];
Tc_2  = [ -6.897961e+01 ; -7.543357e+01 ; 4.921829e+02 ];
omc_error_2 = [ 4.079687e-03 ; 3.195420e-03 ; 7.610703e-03 ];
Tc_error_2  = [ 1.834622e+00 ; 2.586047e+00 ; 1.836647e+00 ];

%-- Image #3:
omc_3 = [ -1.888556e+00 ; -1.881863e+00 ; 6.115557e-01 ];
Tc_3  = [ -6.973329e+01 ; -7.506858e+01 ; 5.202731e+02 ];
omc_error_3 = [ 4.276371e-03 ; 2.674997e-03 ; 6.672376e-03 ];
Tc_error_3  = [ 1.944052e+00 ; 2.736943e+00 ; 1.836679e+00 ];

%-- Image #4:
omc_4 = [ -1.693292e+00 ; -1.684377e+00 ; 8.480823e-01 ];
Tc_4  = [ -6.251138e+01 ; -7.454145e+01 ; 5.463802e+02 ];
omc_error_4 = [ 4.501900e-03 ; 2.833462e-03 ; 5.950883e-03 ];
Tc_error_4  = [ 2.044586e+00 ; 2.874441e+00 ; 1.850336e+00 ];

%-- Image #5:
omc_5 = [ 2.057998e+00 ; 2.060374e+00 ; 2.681820e-01 ];
Tc_5  = [ -4.564929e+01 ; -7.599751e+01 ; 4.483228e+02 ];
omc_error_5 = [ 4.109015e-03 ; 2.870008e-03 ; 7.330102e-03 ];
Tc_error_5  = [ 1.685144e+00 ; 2.357304e+00 ; 1.772707e+00 ];

%-- Image #6:
omc_6 = [ 1.858727e+00 ; 1.867716e+00 ; 5.760215e-01 ];
Tc_6  = [ -2.133089e+01 ; -7.611330e+01 ; 4.304570e+02 ];
omc_error_6 = [ 4.372283e-03 ; 2.469243e-03 ; 6.446743e-03 ];
Tc_error_6  = [ 1.614466e+00 ; 2.256694e+00 ; 1.761013e+00 ];

%-- Image #7:
omc_7 = [ 1.644448e+00 ; 1.658570e+00 ; 8.336363e-01 ];
Tc_7  = [ 7.008131e+00 ; -7.593700e+01 ; 4.214784e+02 ];
omc_error_7 = [ 4.638433e-03 ; 2.765573e-03 ; 5.712594e-03 ];
Tc_error_7  = [ 1.581373e+00 ; 2.208779e+00 ; 1.772633e+00 ];

%-- Image #8:
omc_8 = [ 1.952152e+00 ; 1.936628e+00 ; -5.482938e-01 ];
Tc_8  = [ -5.802243e+01 ; -8.383567e+01 ; 5.103317e+02 ];
omc_error_8 = [ 3.543218e-03 ; 4.164417e-03 ; 6.415719e-03 ];
Tc_error_8  = [ 1.907713e+00 ; 2.682302e+00 ; 1.769045e+00 ];

%-- Image #9:
omc_9 = [ -2.064315e+00 ; -2.085642e+00 ; -2.232437e-01 ];
Tc_9  = [ -5.158416e+01 ; -6.749389e+01 ; 4.755696e+02 ];
omc_error_9 = [ 3.547263e-03 ; 4.049563e-03 ; 7.472844e-03 ];
Tc_error_9  = [ 1.780885e+00 ; 2.503490e+00 ; 1.895027e+00 ];

%-- Image #10:
omc_10 = [ 2.205170e+00 ; 2.211074e+00 ; -9.426984e-02 ];
Tc_10  = [ -5.557483e+01 ; -6.440407e+01 ; 6.473669e+02 ];
omc_error_10 = [ 6.308283e-03 ; 5.938536e-03 ; 1.353233e-02 ];
Tc_error_10  = [ 2.418038e+00 ; 3.395917e+00 ; 2.593573e+00 ];

%-- Image #11:
omc_11 = [ 2.225851e+00 ; 2.208683e+00 ; -3.682572e-02 ];
Tc_11  = [ -5.358428e+01 ; -7.657555e+01 ; 3.950998e+02 ];
omc_error_11 = [ 3.666605e-03 ; 3.372305e-03 ; 8.017810e-03 ];
Tc_error_11  = [ 1.484211e+00 ; 2.081091e+00 ; 1.537277e+00 ];

