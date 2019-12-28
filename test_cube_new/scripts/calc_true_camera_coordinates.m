function [x0] = calc_true_camera_coordinates(image_num, output_file_name)

find_results = load('u_v_results.mat');

[internal_matrix]  = get_internal_params('Calib_Results.mat');
% 内参
A = internal_matrix;

[X, Y, Z] = get_all_camera_coordinate(7, 'c_c_results.mat');

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

for i = 1:image_num
    
    %     data = find_results.(strcat('find_', num2str(i)));
    data = find_results.(strcat('find', num2str(i)));
    [m, n] = size(data);
    
    field_name = strcat('c_c', num2str(i));
    %   init result
    result = zeros(m, 3);
    
    %    speed the calc
    vars = sym(zeros(1, m));
    for num = 1 : m
        variable_name = strcat('s', num2str(num));
        eval(['syms ', variable_name, ';']);
        eval([['vars(1,' num2str(num)  ')'], '=', variable_name, ';']);
    end

    %   声明每组的未知变量s
    syms s;
    %   像素坐标系的齐次表示
    pixel_mat = [
        data(:, 1)';
        data(:, 2)';
        ones(1, m);
        ];
    %   A矩阵的逆矩阵
    A_inv = inv(A);
    %   X矩阵
    x = A_inv(1, :) * ([vars(1, :); vars(1, :); vars(1, :)] .* pixel_mat);
    %   Y 矩阵
    y = A_inv(2, :) * ([vars(1, :); vars(1, :); vars(1, :)] .* pixel_mat);
    %   Z 矩阵
    z = A_inv(3, :) * ([vars(1, :); vars(1, :); vars(1, :)] .* pixel_mat);
    %   定义方程
    eqn =  p00 + p10 *  x + p01 * y - z == zeros(1, m);
    sol_s = solve(eqn);
    
    %  init s
    s = zeros(1, m);
    for k = 1 : m
        value = sol_s.(strcat('s', num2str(k)));
        s(1, k) = double(value);
    end
    
    
    %     new_eqn = eqn(1, 2) == 0;
    % 求解这一组的s的值
%     sol_s = solve(eqn);
   
    %     new_x = A_inv(1, :) * (sol_s .* pixel_mat);
    %     new_y = A_inv(2, :) * (sol_s .* pixel_mat);
    %     new_z = A_inv(3, :) * (sol_s .* pixel_mat);
    tmp_result = A_inv *([s(1, :); s(1, :); s(1, :)] .* pixel_mat);
    
    result = tmp_result';
   
    %     for j = 1:m
    %         u = data(j, 1);
    %         v = data(j, 2);
    %
    %         % x, y, z 是相机坐标系下的点
    %         syms x y z s;
    %         vars = [x y z s];
    %         u_v_mat = [u; v; 1];
    %         c_c_matrix = [x; y; z];
    %         eqns = [s .*u_v_mat == A * c_c_matrix, p00 + p10 * x + p01 * y - z == 0 ];
    %         [x, y, z, s] =solve(eqns, vars);
    %         x = double(x);
    %         y = double(y);
    %         z = double(z);
    %         s = double(s);
    %
    %         result(j, :) = [x, y, z];
    %     end
    
    eval([field_name, '=', mat2str(result), ';']);
    
    %     保存为.mat文件
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name, field_name, '-append');
    end
    
end

end