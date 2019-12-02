function [internal_matrix]  = get_internal_params()

mat = load('Calib_Results.mat');

cc = mat.('cc');
fc = mat.('fc');

u_0 = cc(1);
v_0 = cc(2);
f0 = fc(1);
f1 = fc(2);

internal_matrix = [f0, 0, u_0; 0, f1, v_0; 0, 0, 1];

end
