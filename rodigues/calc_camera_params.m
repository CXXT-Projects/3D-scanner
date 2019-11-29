function []  = calc_camera_params(output_file_name)

length = 7;

external_matrix = get_external_params();

for i = 1:length
    current_external_matrix = external_matrix(:, [1 2 4], i);
    data = importdata(strcat('world_coordinate', num2str(i),  '.txt'));
    world_coordinate_data = data;
    [m, n] = size(world_coordinate_data);
    fid=fopen(strcat(output_file_name, num2str(i), '.txt'), 'wt');
    
    for j = 1:m
        w_x = world_coordinate_data(j, 1);
        w_y = world_coordinate_data(j, 2);
        pixel_matrix = [w_x; w_y; 1];
        c_x = current_external_matrix(1, :) * pixel_matrix;
        c_y = current_external_matrix(2, :) * pixel_matrix;
        c_z = current_external_matrix(3, :) * pixel_matrix;
        
        fprintf(fid, '%d %d %d\n', c_x, c_y, c_z);
    end
end
end
