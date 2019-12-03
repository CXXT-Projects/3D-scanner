function [X, Y, Z]  = get_all_camera_coordinate(length)
X = [];
Y = [];
Z = [];
    
camera_coordinate_results = load('./camera_coordinate_results.mat');

for i = 1:length
    data = camera_coordinate_results.(strcat('c_c', num2str(i)));
    x = data(:, 1);
    y = data(:, 2);
    z = data(:, 3);
    X = [X, x'];
    Y = [Y, y'];
    Z = [Z, z'];
    
end
end