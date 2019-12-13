function [] =  read_images(img_num,img_name,output_file_name)


for i = 1:img_num
    field_name = strcat('a',num2str(i));
    img = imread(strcat(img_name,num2str(i),'.bmp'));
    eval([field_name,'=',mat2str(img),';']);
    if i == 1
        save(output_file_name,field_name);
    else
        save(output_file_name,field_name,'-append');
    end
end

end