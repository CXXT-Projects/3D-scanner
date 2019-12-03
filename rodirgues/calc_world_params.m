function []  = calc_world_params(length, output_file_name)

external_matrix = get_external_params();
internal_matrix = get_internal_params();
find_result = load('../find/find_results.mat');

for i = 1:length
    % B matrix   
    c_matrix = internal_matrix * external_matrix(:, [1 2 4], i);
    c_matrix_inv = inv(c_matrix);
    
    data = find_result.(strcat('find_', num2str(i)));
    [m, n] = size(data);
    
    field_name = strcat('w_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    for j = 1:m
        u = data(j, 1);
        v = data(j, 2);
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
    save(output_file_name, field_name, '-append');
    end
    
end

end
