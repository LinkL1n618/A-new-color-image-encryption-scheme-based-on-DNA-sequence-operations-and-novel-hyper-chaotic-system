function cipher_image = gray_image_encryption(fifth_key , key_image_key , sixth_key , seventh_key , path,localpath)
%��һ�ּ���
[key_image,first_key,second_key,third_key,fourth_key] = function_generate_key_image_gray(path);
intermediate_cipher_image = first_round_encryption(path ,key_image, fifth_key , key_image_key);
%˳ʱ����ת90��
key_image = imrotate(key_image , -90);
new_cipher_image = imrotate(intermediate_cipher_image , -90);
%�ڶ��ּ��ܣ��ֱ��룺��ת����м�ͼ���м�ͼ·����δ��ת������Կͼ����Կͼ·��  ������ط���������ΪҪ�ģ��������ݹ��࣬���Գ��Լ�һ�£�
cipher_image = second_round_encryption(new_cipher_image , key_image, sixth_key , seventh_key , key_image_key);
%չʾ
%imshow(cipher_image);
%disp('���ܳɹ�');
%disp(['���μ��ܵ���Կ�ǣ�','1��',first_key,'   ','2��',second_key,'   ','3��',num2str(third_key),'   ','4��',fourth_key,'   ','5��',fifth_key,'   ','6��',sixth_key,'   ','7��',seventh_key,'   ','8��',key_image_key]);
%disp(['���μ��ܵ�ͼƬ·���ǣ�',path,'   ','��Ҳ��һ����Կ��']);
imwrite(cipher_image , localpath);
[folder,name,~] = fileparts(localpath);
writefile_name = [folder,'\',name,'.txt'];
fileID = fopen(writefile_name,'w');
fprintf(fileID,'���μ��ܵ���Կ�ǣ�1��%s\n2��%s\n3��%s\n4��%s\n5��%s\n6��%s\n7��%s\n8��%s\n���μ��ܵ�ͼƬ·���ǣ�%s',first_key,second_key,num2str(third_key),fourth_key,fifth_key,sixth_key,seventh_key,key_image_key,path);
fclose(fileID);
end