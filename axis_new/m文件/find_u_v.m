% find the param u and v
% input_img_num 输入图片数量
% input_file_name 输入图片的文件名
% output_file_name 输出文件名  类型是.mat

function []  = find_u_v( input_img_num, input_file_name, output_file_name )

for i = 1:input_img_num
    data = imread(strcat('../thresh/', input_file_name, num2str(i), '.bmp'));
    
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
%   分别生成不同的field
    field_name = strcat('find_', num2str(i));
    data = [col, row];
    eval([field_name, '=', mat2str(data), ';']);
%     保存为.mat文件
    save(output_file_name, field_name, '-append');
    
end
