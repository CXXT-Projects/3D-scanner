function [mask1] =  make_mask(x_min,x_max,y_min,y_max)
%实现输入mask的坐标范围（x_min, x_max, y_min, y_max），能够生成mask矩阵。
%mask矩阵大小与图像大小相同（1280 * 1024）
%mask矩阵在确定的mask区域内的值全为1，区域外的值全为0。
mask = zeros(1024,1280);
for i = y_min:y_max
    for j = x_min:x_max
        mask(i,j)=1;
    end
end
mask1=uint8(mask);
end


