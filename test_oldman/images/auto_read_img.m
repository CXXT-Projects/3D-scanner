function [] =  auto_read_img(img_num)
obj =videoinput('winvideo',2,'RGB8_1280x1024');
for i=1:img_num
    image = getsnapshot(obj);
    imwrite(image,strcat('../images/image',num2str(i),'.bmp'));
    pause(7);
end