% 求解同一高度下的所有坐标

% points_nums: 输入文件中每组的坐标数量
% same_height_nums 同一高度的坐标点的数量
% c_c_results_file_path: camera_coordinate_results.mat 文件路径
% output_file_name: 保存.mat文件的名称

function []  = get_c_c_in_same_height(points_nums, same_height_nums, c_c_results_file_path, output_file_name)

% load data from the camera_coordinate_results.mat
c_c_results = load(c_c_results_file_path);

for i = 1:points_nums
    field_name = strcat('c_c_same_height', num2str(i));
    %   第一组数据，先创建.mat文件
    if i == 1
        save(output_file_name, field_name);
    end
    %   init result
    result = zeros(same_height_nums, 3);
    for j = 1 : same_height_nums
        data = c_c_results.(strcat('c_c', num2str(j)));
        result(j, :) = data(i, :);
    end
    
    eval([field_name, '=', mat2str(result), ';']);
    %     保存为.mat文件
    save(output_file_name, field_name, '-append');    
    
end

end