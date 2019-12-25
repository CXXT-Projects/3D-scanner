% 计算相机坐标系下的坐标点

% image_num: 图片数量
% calib_file_path: Calib_Results.mat文件的路径
% w_c_results_file_path: 相机坐标系下的坐标点
% output_filename: 输出文件的名称

function []  = calc_camera_coordinate(input_num, calib_file_path, w_c_results_file_path, output_filename)

external_matrix = get_external_params(input_num, calib_file_path);
world_coordinate_results = load(w_c_results_file_path);

for i = 1:input_num
    %     外参矩阵
    current_external_matrix = external_matrix(:, [1 2 4], i);
    
    current_data = world_coordinate_results.(strcat('w_c', num2str(i)));
    [m, n] = size(current_data);
    
    field_name = strcat('c_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    for j = 1:m
        % 世界坐标系下的 x 和 y
        w_x = current_data(j, 1);
        w_y = current_data(j, 2);
        world_matrix = [w_x; w_y; 1];
        c_x = current_external_matrix(1, :) * world_matrix;
        c_y = current_external_matrix(2, :) * world_matrix;
        c_z = current_external_matrix(3, :) * world_matrix;
        result(j, :) = [c_x, c_y, c_z];
        
        eval([field_name, '=', mat2str(result), ';']);
        %     保存为.mat文件
        if i == 1
            save(output_filename, field_name);
        else
            save(output_filename, field_name, '-append');
        end
        
    end
end

end
