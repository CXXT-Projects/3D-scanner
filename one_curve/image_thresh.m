% mask to thresh
% threshold {num} 阈值大小
% input_img_num {num} 输入图片的数量
% input_file_name {string} 输入要处理的图片名
% output_file_name {string} 输出的图片名 

function [s]  = image_thresh( threshold, input_img_num, input_file_name, output_file_name )

for i = 1:input_img_num
    data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    output_img = im2bw(data, threshold / 255);
    imwrite(output_img, strcat(output_file_name, num2str(i), '.bmp'));
end
