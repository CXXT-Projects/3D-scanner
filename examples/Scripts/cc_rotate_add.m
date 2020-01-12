% 把坐标点旋转到轴坐标系下

% input_num 需要处理的数据组数
% input_file_name 平移后的坐标点
% r 轴线的方向向量
% output_file_name 输出结果文件名(文件格式: .mat)

function [] = cc_rotate_add(input_num, input_file_name, r, output_file_name)

cc_offset_data = load(input_file_name);
% 每次旋转的角度（弧度制表示）
r=r * 2 * pi / 200;
% Rodrigues向量，生成一个旋转矩阵
% R = rotationVectorToMatrix(r);
R = rodrigues(r);

for i = 1:input_num
    if i == 100
        continue
    end
    
    if i == 101
        continue
    end
    
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