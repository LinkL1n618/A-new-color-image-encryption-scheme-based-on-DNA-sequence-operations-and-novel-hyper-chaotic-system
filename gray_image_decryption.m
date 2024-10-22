function original_image = gray_image_decryption(first_key , second_key , third_key , fourth_key , fifth_key , sixth_key , seventh_key ,key_image_key, original_path , cipher_image_path,save_path)
cipher_image = imread(cipher_image_path);
third_key = str2num(third_key);
[height , width , ~] = size(cipher_image);
original_size = strsplit(fourth_key,'x');
arrsize = size(original_size);
    if arrsize(1) ~=1
        original_image=[];return;
    else
        if arrsize(2) ~=2
            original_image=[];return;
        end
    end
original_width = str2num(original_size{1});
original_height = str2num(original_size{2});
key_image = function_generate_decryption_key_image_gray(first_key ,second_key , third_key ,fourth_key , height ,width);
%一轮解密
intermediate_decryption_image = first_round_decryption(cipher_image , key_image , sixth_key , seventh_key , key_image_key);
%逆时针旋转90度
intermediate_decryption_image = imrotate(intermediate_decryption_image , 90);
%二轮解密 
original_image = second_round_decryption(intermediate_decryption_image , key_image , original_path , fifth_key , key_image_key , original_width , original_height);
%imshow(original_image);
imwrite(original_image , save_path);
end