% 二值化操作

% threshold 阈值大小
% input_num 需要处理的图片数量
% input_file_name 处理的图片的文件名
% output_file_name 输出的图片文件名

function []  = image_thresh(threshold, input_num, input_file_name, output_file_name)

for i = 1:input_num
    data = imread(strcat(input_file_name, num2str(i), '.bmp'));
    result = im2bw(data, threshold / 255);
    
    imwrite(result, strcat(output_file_name, num2str(i), '.bmp'));
end
