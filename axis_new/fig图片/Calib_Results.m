% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1576.180148521129922 ; 1582.280651622153982 ];

%-- Principal point:
cc = [ 580.010408983562229 ; 512.100031021071118 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.603729973897310 ; 1.640698780249798 ; -0.001915919720781 ; 0.000278554120896 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 11.380489967744335 ; 10.913768511979475 ];

%-- Principal point uncertainty:
cc_error = [ 9.120332961847529 ; 14.054949780344616 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.062164118033909 ; 1.164016942726310 ; 0.001922581344025 ; 0.001882190943316 ; 0.000000000000000 ];

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
omc_1 = [ -2.205445e+00 ; -2.214973e+00 ; -2.482766e-02 ];
Tc_1  = [ -3.116333e+01 ; -6.700940e+01 ; 3.600108e+02 ];
omc_error_1 = [ 6.292158e-03 ; 6.383064e-03 ; 1.397211e-02 ];
Tc_error_1  = [ 2.098581e+00 ; 3.210476e+00 ; 2.560061e+00 ];

%-- Image #2:
omc_2 = [ -2.063003e+00 ; -2.086918e+00 ; 2.428608e-01 ];
Tc_2  = [ -3.526013e+01 ; -6.747169e+01 ; 3.714460e+02 ];
omc_error_2 = [ 6.457017e-03 ; 4.907636e-03 ; 1.216471e-02 ];
Tc_error_2  = [ 2.158834e+00 ; 3.308610e+00 ; 2.580812e+00 ];

%-- Image #3:
omc_3 = [ -1.904737e+00 ; -1.941795e+00 ; 4.828525e-01 ];
Tc_3  = [ -3.635836e+01 ; -6.793963e+01 ; 3.835052e+02 ];
omc_error_3 = [ 6.752933e-03 ; 4.051711e-03 ; 1.104374e-02 ];
Tc_error_3  = [ 2.231632e+00 ; 3.416675e+00 ; 2.563604e+00 ];

%-- Image #4:
omc_4 = [ -1.740090e+00 ; -1.787035e+00 ; 6.909520e-01 ];
Tc_4  = [ -3.449591e+01 ; -6.838571e+01 ; 3.954085e+02 ];
omc_error_4 = [ 7.109725e-03 ; 4.038868e-03 ; 1.020262e-02 ];
Tc_error_4  = [ 2.302430e+00 ; 3.523143e+00 ; 2.570846e+00 ];

%-- Image #5:
omc_5 = [ 2.121503e+00 ; 2.112101e+00 ; 2.525757e-01 ];
Tc_5  = [ -2.607003e+01 ; -6.656027e+01 ; 3.513633e+02 ];
omc_error_5 = [ 6.454620e-03 ; 4.856973e-03 ; 1.250407e-02 ];
Tc_error_5  = [ 2.050582e+00 ; 3.129602e+00 ; 2.477863e+00 ];

%-- Image #6:
omc_6 = [ 1.989953e+00 ; 1.965259e+00 ; 4.761405e-01 ];
Tc_6  = [ -1.814487e+01 ; -6.622645e+01 ; 3.436677e+02 ];
omc_error_6 = [ 6.762810e-03 ; 3.959345e-03 ; 1.138857e-02 ];
Tc_error_6  = [ 2.003365e+00 ; 3.056711e+00 ; 2.480412e+00 ];

%-- Image #7:
omc_7 = [ 1.846099e+00 ; 1.807354e+00 ; 6.768706e-01 ];
Tc_7  = [ -8.577578e+00 ; -6.599743e+01 ; 3.379254e+02 ];
omc_error_7 = [ 7.135885e-03 ; 3.901605e-03 ; 1.051873e-02 ];
Tc_error_7  = [ 1.969108e+00 ; 3.003779e+00 ; 2.490135e+00 ];

