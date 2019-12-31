
function [] = cc_rotate(input_num, input_file_name, r, output_file_name)

cc_offset_data = load(input_file_name);
% 每次旋转的角度（弧度制表示）
r=r * 2 * pi / 100;
% Rodrigues向量，生成一个旋转矩阵
% R = rotationVectorToMatrix(r);
R = rodrigues(r);

for i = 1:input_num
    if i == 50
        continue
    end
    
    j = i;
    if i > 50
        j = i - 1;
    end
    
    data = cc_offset_data.(strcat('c_c_offset', num2str(j)));
    % 平移
    result = data * R^(i - 1);
    % 分别生成不同的field
    field_name = strcat('c_c_rotate', num2str(j));
    eval([field_name, '=', mat2str(result), ';']);
    % 保存为.mat文件
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
    
end

end