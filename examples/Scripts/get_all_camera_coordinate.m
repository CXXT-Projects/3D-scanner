% ��ȡ���е��������ϵ�µĵ�

% image_num: �����ͼƬ����
% result_file_path: �����������ϵ�µ� x' y' z'���ļ� './camera_coordinate_results.mat'

function [X, Y, Z]  = get_all_camera_coordinate(image_num, results_file_path)
X = [];
Y = [];
Z = [];

camera_coordinate_results = load(results_file_path);

for i = 1:image_num
    if i == 100
        continue
    end
    
    if i == 101
        continue
    end
    
    data = camera_coordinate_results.(strcat('c_c_rotate', num2str(i)));
    x = data(:, 1);
    y = data(:, 2);
    z = data(:, 3);
    X = [X, x'];
    Y = [Y, y'];
    Z = [Z, z'];
    
end
end