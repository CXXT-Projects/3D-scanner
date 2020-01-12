% 灰度归一化取平均（u取小数）得到(u, v)点

% input_num 处理数据的组数
% input_file_path 输入的mat文件路径
% output_file_path 输出的mat文件路径

function []  = image_thresh_average(input_num, input_file_path, output_file_path)

thresh_data = load(input_file_path);

for i = 1 :input_num
    data = thresh_data.(strcat('thresh',num2str(i)));
    
    % m_size 是行数 n_size 是列数
    [m_size, n_size] = size(data);
    result = [];
    
    index = 0;
    
    for m = 1 : m_size
        image_thresh_find = find(data(m, :));
        if isempty(image_thresh_find)==1
            continue;
        else
            index = index + 1;
            mean_index = mean(image_thresh_find);
            result(index, :) = [mean_index, m];
        end
    end
    
    field_name = strcat('find', num2str(i));
    eval([field_name,'=', mat2str(result, 'class'), ';']);
    
    if i == 1
        save(output_file_path,field_name);
    else
        save(output_file_path,field_name,'-append');
    end
    
    imwrite(result, strcat(output_file_path, num2str(i), '.bmp'));
end
