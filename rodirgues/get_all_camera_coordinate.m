function [X, Y, Z]  = get_all_camera_coordinate()
X = [];
Y = [];
Z = [];
    
length = 7;

for i = 1:length
    data = importdata(strcat('camera_coordinate', num2str(i),  '.txt'));
    x = data(:, 1);
    y = data(:, 2);
    z = data(:, 3);
    X = [X, x'];
    Y = [Y, y'];
    Z = [Z, z'];
    
end
end