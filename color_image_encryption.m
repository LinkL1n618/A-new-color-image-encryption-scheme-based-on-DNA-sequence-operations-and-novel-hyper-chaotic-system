function cipher_image = color_image_encryption(fifth_key , key_image_key , sixth_key , seventh_key , path,localpath)
fifth_key_R = [fifth_key , '_R'];
fifth_key_G = [fifth_key , '_G'];
fifth_key_B = [fifth_key , '_B'];
sixth_key_R = [sixth_key , '_R'];
sixth_key_G = [sixth_key , '_G'];
sixth_key_B = [sixth_key , '_B'];
seventh_key_R = [seventh_key , '_R'];
seventh_key_G = [seventh_key , '_G'];
seventh_key_B = [seventh_key , '_B'];
key_image_key_R = [key_image_key , '_R'];
key_image_key_G = [key_image_key , '_G'];
key_image_key_B = [key_image_key , '_B'];
image = imread(path);
image = pretreate_the_image_color(image);
%imshow(image);
image_R = image(:,:,1);
image_G = image(:,:,2);
image_B = image(:,:,3);
[key_image,first_key,second_key,third_key,fourth_key] = function_generate_key_image_color(path);
key_image_R = key_image(:,:,1);
key_image_G = key_image(:,:,2);
key_image_B = key_image(:,:,3);
%第一轮加密
intermediate_cipher_image_R = first_round_encryption_color(image_R ,path , key_image_R , fifth_key_R , key_image_key_R);
intermediate_cipher_image_G = first_round_encryption_color(image_G ,path , key_image_G , fifth_key_G , key_image_key_G);
intermediate_cipher_image_B = first_round_encryption_color(image_B ,path , key_image_B , fifth_key_B , key_image_key_B);
intermediate_cipher_image = cat(3 ,intermediate_cipher_image_R , intermediate_cipher_image_G , intermediate_cipher_image_B);
%顺时针旋转90度
key_image = imrotate(key_image , -90);
new_cipher_image = imrotate(intermediate_cipher_image , -90);
%第二轮加密，分别传入：旋转后的中间图，中间图路径（未旋转），密钥图，密钥图路径  （这个地方后期我认为要改，传入内容过多，可以尝试简化一下）
new_cipher_image_R = new_cipher_image(:,:,1);
new_cipher_image_G = new_cipher_image(:,:,2);
new_cipher_image_B = new_cipher_image(:,:,3);
key_image_R = key_image(:,:,1);
key_image_G = key_image(:,:,2);
key_image_B = key_image(:,:,3);
cipher_image_R = second_round_encryption_color(new_cipher_image_R , key_image_R, sixth_key_R , seventh_key_R , key_image_key_R);
cipher_image_G = second_round_encryption_color(new_cipher_image_G , key_image_G, sixth_key_G , seventh_key_G , key_image_key_G);
cipher_image_B = second_round_encryption_color(new_cipher_image_B , key_image_B, sixth_key_B , seventh_key_B , key_image_key_B);
cipher_image = cat(3 , cipher_image_R , cipher_image_G , cipher_image_B);
%localpath='C:\Users\LENOVO\Desktop\大创代码（matlab2023b)\彩色图代码（改）\pic\encrypt.png';
imwrite(cipher_image , localpath);
[folder,name,~] = fileparts(localpath);
writefile_name = [folder,'\',name,'.txt'];
fileID = fopen(writefile_name,'w');
fprintf(fileID,'本次加密的密钥是：1：%s\n2：%s\n3：%s\n4：%s\n5：%s\n6：%s\n7：%s\n8：%s\n本次加密的图片路径是：%s',first_key,second_key,num2str(third_key),fourth_key,fifth_key,sixth_key,seventh_key,key_image_key,path);
fclose(fileID);
%展示
%imshow(cipher_image);
%disp('加密成功');
%disp(['本次加密的密钥是：','1：',first_key,'   ','2：',second_key,'   ','3：',num2str(third_key),'   ','4：',fourth_key,'   ','5：',fifth_key,'   ','6：',sixth_key,'   ','7：',seventh_key,'   ','8：',key_image_key]);
%disp(['本次加密的图片路径是：',path,'   ','这也是一个密钥！']);