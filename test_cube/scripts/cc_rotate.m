
function [] = cc_rotate(input_num, input_file_name, r, output_file_name)

cc_offset_data = load(input_file_name);
% 每次旋转的角度（弧度制表示）
r=r*pi/10;
% Rodrigues向量，生成一个旋转矩阵
R = rotationVectorToMatrix(r);
for i = 1:input_num
    data = cc_offset_data.(strcat('c_c_offset', num2str(i)));
    % 平移
    result = data * R^(i - 1);
    % 分别生成不同的field
    field_name = strcat('c_c_rotate', num2str(i));
    eval([field_name, '=', mat2str(result), ';']);
    % 保存为.mat文件
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
end

end