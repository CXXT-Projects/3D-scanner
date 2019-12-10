% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1592.911123206791217 ; 1589.132260534042643 ];

%-- Principal point:
cc = [ 582.946074626702625 ; 504.984693210246689 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.475754414758955 ; 0.648929975726245 ; -0.000271228981480 ; 0.000307287282733 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 11.426418882025757 ; 11.040210139210291 ];

%-- Principal point uncertainty:
cc_error = [ 10.689136846771291 ; 14.744175816636362 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.043315397778443 ; 0.470320083672846 ; 0.001440449145661 ; 0.001860433929469 ; 0.000000000000000 ];

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
omc_1 = [ 2.170344e+00 ; 2.218615e+00 ; -5.472669e-02 ];
Tc_1  = [ -5.129346e+01 ; -8.857270e+01 ; 4.938684e+02 ];
omc_error_1 = [ 7.111210e-03 ; 6.887830e-03 ; 1.496190e-02 ];
Tc_error_1  = [ 3.327751e+00 ; 4.598574e+00 ; 3.594009e+00 ];

%-- Image #2:
omc_2 = [ -2.043123e+00 ; -2.099342e+00 ; 3.697646e-01 ];
Tc_2  = [ -5.626147e+01 ; -8.862873e+01 ; 5.151045e+02 ];
omc_error_2 = [ 6.874231e-03 ; 5.341523e-03 ; 1.306764e-02 ];
Tc_error_2  = [ 3.453484e+00 ; 4.787900e+00 ; 3.603166e+00 ];

%-- Image #3:
omc_3 = [ -1.849678e+00 ; -1.925005e+00 ; 6.377974e-01 ];
Tc_3  = [ -5.357488e+01 ; -8.897905e+01 ; 5.370592e+02 ];
omc_error_3 = [ 7.295021e-03 ; 4.698136e-03 ; 1.174459e-02 ];
Tc_error_3  = [ 3.608497e+00 ; 4.994474e+00 ; 3.565097e+00 ];

%-- Image #4:
omc_4 = [ -1.659781e+00 ; -1.747598e+00 ; 8.481652e-01 ];
Tc_4  = [ -4.578619e+01 ; -8.913927e+01 ; 5.558762e+02 ];
omc_error_4 = [ 7.720468e-03 ; 5.020747e-03 ; 1.066473e-02 ];
Tc_error_4  = [ 3.739172e+00 ; 5.170391e+00 ; 3.560672e+00 ];

%-- Image #5:
omc_5 = [ 2.059341e+00 ; 2.062099e+00 ; 2.197954e-01 ];
Tc_5  = [ -4.540211e+01 ; -8.764320e+01 ; 4.745416e+02 ];
omc_error_5 = [ 7.194396e-03 ; 5.229923e-03 ; 1.283725e-02 ];
Tc_error_5  = [ 3.207263e+00 ; 4.416359e+00 ; 3.468694e+00 ];

%-- Image #6:
omc_6 = [ 1.882923e+00 ; 1.867480e+00 ; 5.176701e-01 ];
Tc_6  = [ -2.790083e+01 ; -8.729633e+01 ; 4.568331e+02 ];
omc_error_6 = [ 7.674824e-03 ; 4.438051e-03 ; 1.144627e-02 ];
Tc_error_6  = [ 3.082767e+00 ; 4.242033e+00 ; 3.466344e+00 ];

%-- Image #7:
omc_7 = [ 1.796923e+00 ; 1.774632e+00 ; 6.323968e-01 ];
Tc_7  = [ -1.875906e+01 ; -8.737642e+01 ; 4.514554e+02 ];
omc_error_7 = [ 7.892858e-03 ; 4.498945e-03 ; 1.090526e-02 ];
Tc_error_7  = [ 3.045741e+00 ; 4.189973e+00 ; 3.474820e+00 ];

%-- Image #8:
omc_8 = [ 2.178138e+00 ; 2.227831e+00 ; -5.581584e-02 ];
Tc_8  = [ -5.339053e+01 ; -8.850092e+01 ; 4.322782e+02 ];
omc_error_8 = [ 6.296031e-03 ; 6.162801e-03 ; 1.358713e-02 ];
Tc_error_8  = [ 2.915940e+00 ; 4.030814e+00 ; 3.148835e+00 ];

%-- Image #9:
omc_9 = [ 2.184391e+00 ; 2.234694e+00 ; -1.102774e-01 ];
Tc_9  = [ -4.998490e+01 ; -8.875618e+01 ; 5.813999e+02 ];
omc_error_9 = [ 8.261812e-03 ; 8.273876e-03 ; 1.782374e-02 ];
Tc_error_9  = [ 3.906132e+00 ; 5.405758e+00 ; 4.245264e+00 ];

