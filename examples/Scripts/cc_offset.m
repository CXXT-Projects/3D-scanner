% t 平移矩阵
% input_file_name 相机坐标系下的点mat文件
% input_num 需要处理的图片数量
% output_file_name 输出结果文件名(文件格式: .mat)

function [] = cc_offset(t, input_file_name, input_num, output_file_name)

cc_data = load(input_file_name);

for i = 1:input_num
    data = cc_data.(strcat('c_c', num2str(i)));
    
    % 平移
    result = data - t;
    %   分别生成不同的field
    field_name = strcat('c_c_offset', num2str(i));
    
    eval([field_name, '=', mat2str(result), ';']);
    %     保存为.mat文件
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
end

end