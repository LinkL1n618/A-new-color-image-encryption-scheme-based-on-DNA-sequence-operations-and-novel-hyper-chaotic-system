function original_image = color_image_decryption(first_key ,second_key , third_key , fourth_key , fifth_key , sixth_key , seventh_key , key_image_key , original_path , cipher_image_path,save_path)
newstr = strsplit(fourth_key , 'x');
arrsize = size(newstr);
    if arrsize(1) ~=1
        original_image=[];return;
    else
        if arrsize(2) ~=2
            original_image=[];return;
        end
    end
original_width  = str2num(char(newstr(1)));
original_height = str2num(char(newstr(2)));
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
cipher_image = imread(cipher_image_path);
[height , width , ~] = size(cipher_image);
key_image = function_generate_decryption_key_image_color(first_key , second_key ,third_key ,fourth_key ,height , width);
key_image_R = key_image(:,:,1);
key_image_G = key_image(:,:,2);
key_image_B = key_image(:,:,3);
cipher_image_R = cipher_image(:,:,1);
cipher_image_G = cipher_image(:,:,2);
cipher_image_B = cipher_image(:,:,3);
%一轮解密
intermediate_image_R = first_round_decryption_color(cipher_image_R , key_image_R, sixth_key_R , seventh_key_R , key_image_key_R);
intermediate_image_G = first_round_decryption_color(cipher_image_G , key_image_G, sixth_key_G , seventh_key_G , key_image_key_G);
intermediate_image_B = first_round_decryption_color(cipher_image_B , key_image_B, sixth_key_B , seventh_key_B , key_image_key_B);
intermediate_image = cat(3 , intermediate_image_R , intermediate_image_G , intermediate_image_B);
%逆时针旋转90度
intermediate_image = imrotate(intermediate_image , 90);
intermediate_image_R = intermediate_image(:,:,1);
intermediate_image_G = intermediate_image(:,:,2);
intermediate_image_B = intermediate_image(:,:,3);
%二轮解密 这里需要传入原图片的路径作为解密参数
original_image_R = second_round_decryption_color(intermediate_image_R , original_path , key_image_R , fifth_key_R , key_image_key_R );
original_image_G = second_round_decryption_color(intermediate_image_G , original_path , key_image_G , fifth_key_G , key_image_key_G );
original_image_B = second_round_decryption_color(intermediate_image_B , original_path , key_image_B , fifth_key_B , key_image_key_B );
original_image = cat(3 , original_image_R , original_image_G , original_image_B);
original_image = pretreate_inverse_the_image_color(original_image , original_height , original_width);
%imshow(original_image);
imwrite(original_image , save_path);
end