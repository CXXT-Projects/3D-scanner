% 灰度归一化取平均
% input_img_num {num} 输入图片的数量
% input_file_name {string} 输入要处理的图片名
% output_file_name {string} 输出的图片名 image_thresh_average*

function [s]  = image_thresh_average( input_img_num, input_file_name, output_file_name )

for i = 1 :input_img_num
    data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    % m_size 是行数 n_size 是列数
    [m_size, n_size]=size(data);
    output = zeros(m_size, n_size);
    for m = 1 : m_size
        image_thresh_find = find(data(m, :));
        if isempty(image_thresh_find)==1
            continue;
        else
            mean_index = round(mean(image_thresh_find));
            output(m, mean_index) = 1;
            output(m, mean_index) = output(m, mean_index) / 255;
        end
    end
    
    imwrite(output, strcat(output_file_name, num2str(i), '.bmp'));
end
