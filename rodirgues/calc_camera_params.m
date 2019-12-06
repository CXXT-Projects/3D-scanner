function []  = calc_camera_params(length, output_file_name)

external_matrix = get_external_params();
world_coordinate_results = load('./world_coordinate_results.mat');

for i = 1:length
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
        pixel_matrix = [w_x; w_y; 1];
        c_x = current_external_matrix(1, :) * pixel_matrix;
        c_y = current_external_matrix(2, :) * pixel_matrix;
        c_z = current_external_matrix(3, :) * pixel_matrix;
        result(j, :) = [c_x, c_y, c_z];
        
    eval([field_name, '=', mat2str(result), ';']);
    %     保存为.mat文件
    save(output_file_name, field_name, '-append');
    end
    
end

end
