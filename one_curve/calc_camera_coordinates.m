function [] = calc_camera_coordinates(length)

find_results = load('./find_results.mat');
[X, Y, Z] = get_all_camera_coordinate(1, '../rodirgues/camera_coordinate_results.mat');
[fitresult, gof] = createFit(X, Y, Z);
%  coeffs = [p00, p10, p10]
coeffs = coeffvalues(fitresult);

% formula(fitresult) %   获取表达式
% p00 + p10*x + p01*y = z

for i = 1:length

    data = find_results.(strcat('find_', num2str(i)));
    [m, n] = size(data);
    
    field_name = strcat('c_c', num2str(i));
    %   init result 
    result = zeros(m, 3);
    
    for j = 1:m
        u = current_data(j, 1);
        v = current_data(j, 2);
        
    end
    
    
end

end