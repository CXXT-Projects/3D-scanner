function [x0] = calc_true_camera_coordinates(length, output_file_name)

find_results = load('../mat/img_u_v.mat');

[internal_matrix]  = get_internal_params('../mat/Calib_Results.mat');
% 内参
A = internal_matrix;

[X, Y, Z] = get_all_camera_coordinate(7, '../../rodirgues/camera_coordinate_results.mat');

[fitresult, gof] = createFit(X, Y, Z);
%  coeffs = [p00, p10, p10]
coeffs = coeffvalues(fitresult);
p00 = coeffs(1);
p10 = coeffs(2);
p01 = coeffs(3);
% formula(fitresult) %   获取表达式
% p00 + p10*x + p01*y = z
% (x0, 0, 0)
x0 = -(p00 / p10);

for i = 1:length
    
    data = find_results.(strcat('find_', num2str(i)));
    [m, n] = size(data);
    
    field_name = strcat('c_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    for j = 1:m
        u = data(j, 1);
        v = data(j, 2);
        
        % x, y, z 是相机坐标系下的点
        syms x y z s;
        vars = [x y z s];
        u_v_mat = [u; v; 1];
        c_c_matrix = [x; y; z];
        eqns = [s .*u_v_mat == A * c_c_matrix, p00 + p10 * x + p01 * y - z == 0 ];
        [x, y, z, s] =solve(eqns, vars);
        x = double(x);
        y = double(y);
        z = double(z);
        s = double(s);
        
        result(j, :) = [x, y, z];
    end
    
    eval([field_name, '=', mat2str(result), ';']);
    
    %     保存为.mat文件
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name, field_name, '-append');
    end
    
end

end