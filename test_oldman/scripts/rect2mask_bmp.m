function [mask1] =  rect2mask_bmp(img_num,img_name,y_max)
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
    img_mask = img .* mask1;
    img_mask=uint8(img_mask);
    imwrite(img_mask,strcat('../images/image_mask',num2str(i),'.bmp'));
end
end