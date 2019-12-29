function [] =  auto_read_img(img_num)
obj =videoinput('winvideo',2,'RGB8_1280x1024');
for i=1:img_num
%     eval('image', num2str(i))=getsnapshot(obj);
    image = getsnapshot(obj);
%     eval(['image', num2str(i), '=', mat2str(image)]);
    imwrite(image,strcat('../images/image',num2str(i),'.bmp'));
end