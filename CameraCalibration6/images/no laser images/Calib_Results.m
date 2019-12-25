% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 1557.107664653738539 ; 1563.095336430994166 ];

%-- Principal point:
cc = [ 577.638620935973904 ; 511.494983434130745 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.593252355488714 ; 1.689137915776125 ; -0.001364526628120 ; 0.000645713788306 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.181760991613993 ; 9.286645922059581 ];

%-- Principal point uncertainty:
cc_error = [ 9.485027390520033 ; 12.698421681856571 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.050893042532284 ; 0.849024521944445 ; 0.001755729503093 ; 0.002005142058609 ; 0.000000000000000 ];

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
omc_1 = [ 2.217466e+00 ; 2.211363e+00 ; -5.729943e-02 ];
Tc_1  = [ -2.769803e+01 ; -6.512391e+01 ; 3.273435e+02 ];
omc_error_1 = [ 5.561627e-03 ; 5.562679e-03 ; 1.171811e-02 ];
Tc_error_1  = [ 2.005812e+00 ; 2.666939e+00 ; 2.012933e+00 ];

%-- Image #2:
omc_2 = [ -2.212922e+00 ; -2.209804e+00 ; 1.246220e-02 ];
Tc_2  = [ -3.026126e+01 ; -6.695383e+01 ; 3.578860e+02 ];
omc_error_2 = [ 6.010607e-03 ; 5.963633e-03 ; 1.325707e-02 ];
Tc_error_2  = [ 2.193944e+00 ; 2.917908e+00 ; 2.207642e+00 ];

%-- Image #3:
omc_3 = [ -2.208357e+00 ; -2.214992e+00 ; 7.123118e-02 ];
Tc_3  = [ -2.636861e+01 ; -6.840479e+01 ; 3.918541e+02 ];
omc_error_3 = [ 6.506720e-03 ; 6.367306e-03 ; 1.419999e-02 ];
Tc_error_3  = [ 2.397744e+00 ; 3.190393e+00 ; 2.399273e+00 ];

%-- Image #4:
omc_4 = [ 1.946118e+00 ; 1.937265e+00 ; -5.274084e-01 ];
Tc_4  = [ -2.634303e+01 ; -6.484658e+01 ; 3.844106e+02 ];
omc_error_4 = [ 5.301919e-03 ; 6.287608e-03 ; 9.757303e-03 ];
Tc_error_4  = [ 2.351386e+00 ; 3.123567e+00 ; 2.133474e+00 ];

%-- Image #5:
omc_5 = [ -2.004401e+00 ; -1.993538e+00 ; -3.981944e-01 ];
Tc_5  = [ -2.930805e+01 ; -5.429934e+01 ; 3.318651e+02 ];
omc_error_5 = [ 5.113468e-03 ; 6.144707e-03 ; 1.058280e-02 ];
Tc_error_5  = [ 2.030911e+00 ; 2.704207e+00 ; 2.081802e+00 ];

%-- Image #6:
omc_6 = [ -1.789045e+00 ; -1.858154e+00 ; 6.803870e-01 ];
Tc_6  = [ -1.591247e+01 ; -6.784828e+01 ; 3.796090e+02 ];
omc_error_6 = [ 6.409109e-03 ; 4.013044e-03 ; 9.905595e-03 ];
Tc_error_6  = [ 2.322477e+00 ; 3.086559e+00 ; 2.149156e+00 ];

%-- Image #7:
omc_7 = [ 1.908027e+00 ; 1.881582e+00 ; 6.429826e-01 ];
Tc_7  = [ -1.931187e+01 ; -6.525520e+01 ; 3.234952e+02 ];
omc_error_7 = [ 6.538025e-03 ; 3.884750e-03 ; 1.026727e-02 ];
Tc_error_7  = [ 1.985255e+00 ; 2.632317e+00 ; 2.112518e+00 ];

