% 计算世界坐标系下的坐标点

% input_num: 处理数据的组数
% calib_file_path: Calib_Results.mat文件的路径
% u_v_results_file_path: 存储u,v点的坐标mat路径
% output_file_path: 输出的mat文件路径

function []  = calc_world_coordinate(input_num, calib_file_path, u_v_results_file_path, output_file_path)

external_matrix = get_external_params(input_num, calib_file_path);
internal_matrix = get_internal_params(calib_file_path);
find_result = load(u_v_results_file_path);

for i = 1:input_num
    % B matrix
    c_matrix = internal_matrix * external_matrix(:, [1 2 4], i);
    c_matrix_inv = inv(c_matrix);
    
    current_data = find_result.(strcat('find', num2str(i)));
    [m, n] = size(current_data);
    
    field_name = strcat('w_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    for j = 1:m
        u = current_data(j, 1);
        v = current_data(j, 2);
        pixel_matrix = [u; v; 1];
        %   1/s：参数的倒数
        s = c_matrix_inv(3, :) * pixel_matrix;
        %   世界坐标系下的x
        x = (c_matrix_inv(1, :) * pixel_matrix) ./ s;
        %   世界坐标系下的y
        y = (c_matrix_inv(2, :) * pixel_matrix) ./ s;
        
        result(j, :) = [x, y, 0];
        
        eval([field_name, '=', mat2str(result), ';']);
        %     保存为.mat文件
        if i == 1
            save(output_file_path, field_name);
        else
            save(output_file_path, field_name, '-append');
        end
        
    end
    
end

end
