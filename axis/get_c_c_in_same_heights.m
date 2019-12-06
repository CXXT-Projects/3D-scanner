% 求解外参矩阵
% points_nums 同一高度的点的数量
% c_c_results_file_path： camera_coordinate_results.mat 文件路径

function []  = get_c_c_in_same_heights( c_c_results_file_path)

% load data from the camera_coordinate_results.mat
c_c_results = load(c_c_results_file_path);

external_matrix = zeros(3, 4, 7);

for i = 1:points_nums
    omc = calib_result.(strcat('omc_', num2str(i)));
    t = calib_result.(strcat('Tc_', num2str(i)));
    % rodirgues transform vec to matrix 
    R = rotationVectorToMatrix(omc);
    out = [R, t];
    external_matrix(:, :, i) = out;
end
end
