function cipher_image = gray_image_encryption(fifth_key , key_image_key , sixth_key , seventh_key , path,localpath)
%第一轮加密
[key_image,first_key,second_key,third_key,fourth_key] = function_generate_key_image_gray(path);
intermediate_cipher_image = first_round_encryption(path ,key_image, fifth_key , key_image_key);
%顺时针旋转90度
key_image = imrotate(key_image , -90);
new_cipher_image = imrotate(intermediate_cipher_image , -90);
%第二轮加密，分别传入：旋转后的中间图，中间图路径（未旋转），密钥图，密钥图路径  （这个地方后期我认为要改，传入内容过多，可以尝试简化一下）
cipher_image = second_round_encryption(new_cipher_image , key_image, sixth_key , seventh_key , key_image_key);
%展示
%imshow(cipher_image);
%disp('加密成功');
%disp(['本次加密的密钥是：','1：',first_key,'   ','2：',second_key,'   ','3：',num2str(third_key),'   ','4：',fourth_key,'   ','5：',fifth_key,'   ','6：',sixth_key,'   ','7：',seventh_key,'   ','8：',key_image_key]);
%disp(['本次加密的图片路径是：',path,'   ','这也是一个密钥！']);
imwrite(cipher_image , localpath);
[folder,name,~] = fileparts(localpath);
writefile_name = [folder,'\',name,'.txt'];
fileID = fopen(writefile_name,'w');
fprintf(fileID,'本次加密的密钥是：1：%s\n2：%s\n3：%s\n4：%s\n5：%s\n6：%s\n7：%s\n8：%s\n本次加密的图片路径是：%s',first_key,second_key,num2str(third_key),fourth_key,fifth_key,sixth_key,seventh_key,key_image_key,path);
fclose(fileID);
end