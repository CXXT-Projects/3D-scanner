function [mask1] =  rect2mask_mat(img_num,img_name,y_max,output_file_name)
% 合成read_images.m和make_mask_new.m
% 读取image_rect图片，做mask点乘后保存至img_mask.mat
mask = zeros(1024,1280);
for i = 1:y_max
    for j = 1:1280
        mask(i,j)=1;
    end
end
mask1=uint8(mask);

for i = 1:img_num
    img = imread(strcat(img_name,num2str(i),'.bmp'));
    img=uint8(img);
    
    field_b = strcat('b',num2str(i));
    img_mask = img .* mask1;
    img_mask=uint8(img_mask);
    eval([field_b,'=',mat2str(img_mask,'class'),';']);
    if i == 1
        save(output_file_name,field_b);
    else
        save(output_file_name,field_b,'-append');
    end
end
end