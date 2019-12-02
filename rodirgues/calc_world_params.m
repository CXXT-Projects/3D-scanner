function []  = calc_world_params(output_file_name)

length = 7;

external_matrix = get_external_params();
internal_matrix = get_internal_params();

for i = 1:length
    % B matrix     
    c_matrix = internal_matrix * external_matrix(:, [1 2 4], i);
    c_matrix_inv = inv(c_matrix);
    data = importdata(strcat('image_find', num2str(i),  '.txt'));
    v_u_data = data;
    [m, n] = size(v_u_data);
    fid=fopen(strcat(output_file_name, num2str(i), '.txt'), 'wt');
    
    for j = 1:m
%         u = u_v_data(j, 1);
%         v = u_v_data(j, 2);
        u = v_u_data(j, 2);
        v = v_u_data(j, 1);
        pixel_matrix = [u; v; 1];
        s = c_matrix_inv(3, :) * pixel_matrix;  % 1/s
        x = (c_matrix_inv(1, :) * pixel_matrix) ./ s; 
        y = (c_matrix_inv(2, :) * pixel_matrix) ./ s;
        
        fprintf(fid, '%d %d %d\n', x, y, 0);
    end
end
end
