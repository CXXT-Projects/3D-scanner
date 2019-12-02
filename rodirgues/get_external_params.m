function [external_matrix]  = get_external_params()

mat = load('Calib_Results.mat');

length = 7;
external_matrix = zeros(3, 4, 7);

for i = 1:length
    % load data from the Calib_Results.mat
    omc = mat.(strcat('omc_', num2str(i)));
    t = mat.(strcat('Tc_', num2str(i)));
    % rodirgues transform vec to matrix 
    rotVecToMat = rotationVectorToMatrix(omc);
    out = [rotVecToMat, t];
    external_matrix(:, :, i) = out;
end
end
