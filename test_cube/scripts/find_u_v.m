% find the param u and v
% input_img_num 输入图片数量
% input_file_name 输入图片的文件名
% output_file_name 输出文件名  类型是.mat

function []  = find_u_v( input_num, input_file_name, output_file_name )

thresh_data = load(input_file_name);

for i = 1:input_num
    %     data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    data = thresh_data.(strcat('thresh_average', num2str(i)));
    
    %     find() 返回向量或者矩阵中不为0的元素的位置索引
    [row, col] = find(data);
    
    row_length = length(row(:));
    col_length = length(col(:));
    
    % catch error
    if row_length ~= col_length
        fprintf('Error: the length of the row is not equal to the length of the col');
        fprintf('\n');
        continue
    end
    result = [col, row];
    %   分别生成不同的field
    field_name = strcat('find_', num2str(i));
    
    eval([field_name, '=', mat2str(result), ';']);
    %     保存为.mat文件
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
end
