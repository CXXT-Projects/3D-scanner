% 阈值化处理

% threshold 阈值大小
% input_num 处理数据的数量
% input_filename 输入的mat文件名
% output_filename 输出的mat文件名

function []  = image_thresh(threshold, input_num, input_filename, output_filename)

mask_data = load(input_filename);

for i = 1:input_num
    img_mask = mask_data.(strcat('b', num2str(i)));
    result = im2bw(img_mask, threshold / 255);
    
    field_name = strcat('thresh', num2str(i));
    
    eval([field_name,'=',mat2str(result, 'class'),';']);
    if i == 1
        save(output_filename,field_name);
    else
        save(output_filename,field_name,'-append');
    end
    
    imwrite(result, strcat(output_filename, num2str(i), '.bmp'));
end
