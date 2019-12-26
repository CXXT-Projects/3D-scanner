% 获取外参矩阵

% external_matrix 3 * 4 [R, t]
% calib_file_path： Calib_Results.mat 文件路径

function [external_matrix]  = get_external_params(input_num, calib_file_path)

% load data from the Calib_Results.mat
calib_result = load(calib_file_path);

external_matrix = zeros(3, 4, input_num);

for i = 1:input_num
    omc = calib_result.(strcat('omc_', num2str(i)));
    t = calib_result.(strcat('Tc_', num2str(i)));
    % rodirgues transform vec to matrix
%     R = rotationVectorToMatrix(omc);
    R=rodrigues(omc);
    out = [R, t];
    external_matrix(:, :, i) = out;
end
end
