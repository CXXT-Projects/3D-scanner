function [] = calc_circle_center(height_num, c_c_same_height_data_file_path, output_file_path)

c_c_same_height_data = load(c_c_same_height_data_file_path);

for i = 1: height_num
    
    % j = 1 standing for the left side data in the same height
    % j = 2 standing for the right side data in the same height 
    for j = 1 : 2
        field_name = strcat('circle_center', num2str(i), '_', num2str(j));
        data = c_c_same_height_data.(strcat('c_c_same_height', num2str(i), '_', num2str(j)));
        x = data(:, 1);
        y = data(:, 2);
        z = data(:, 3);
        ymean = mean(y);
        [k, resnorm] = fitting_circle_center_2d(x, z);
        result = [k(1), ymean, k(2)];
        
        eval([field_name, '=', mat2str(result), ';']);
        if i == 1 && j == 1
            save(output_file_path, field_name);
        else
            save(output_file_path, field_name, '-append');
        end
        
    end
    
end

end