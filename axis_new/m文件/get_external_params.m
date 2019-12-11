% 获取外参矩阵

% external_matrix 3 * 4 [R, t]
% calib_file_path： Calib_Results.mat 文件路径

function [external_matrix]  = get_external_params(calib_file_path)

% load data from the Calib_Results.mat
calib_result = load(calib_file_path);

length = 7;
external_matrix = zeros(3, 4, 7);

for i = 1:length
    omc = calib_result.(strcat('omc_', num2str(i)));
    t = calib_result.(strcat('Tc_', num2str(i)));
    % rodirgues transform vec to matrix 
    R = rotationVectorToMatrix(omc);
    out = [R, t];
    external_matrix(:, :, i) = out;
end
end
