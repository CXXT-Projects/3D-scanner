function []  = calc_world_params(image_num, calib_file_path, find_results_file_path, output_file_name)

external_matrix = get_external_params(calib_file_path);
internal_matrix = get_internal_params(calib_file_path);
find_result = load(find_results_file_path);

for i = 1:image_num
    % B matrix   
    c_matrix = internal_matrix * external_matrix(:, [1 2 4], i);
    c_matrix_inv = inv(c_matrix);
    
    current_data = find_result.(strcat('find_', num2str(i)));
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
        save(output_file_name, field_name);
    else
        save(output_file_name, field_name, '-append');
    end
    
    end
    
end

end
