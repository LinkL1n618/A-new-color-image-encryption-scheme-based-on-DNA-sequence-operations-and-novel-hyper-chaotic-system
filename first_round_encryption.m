function cipher_image = first_round_encryption(plain_image_path ,key_image, key5 , key_image_key)
%%
%原图处理及生成
    plain_image = imread(plain_image_path);
    %plain_image = rgb2gray(plain_image);
    plain_image = pretreate_the_image(plain_image);
%%
%对原图和密钥图进行行编码
    encoded_original_image = encode_plain_image_by_row(plain_image , plain_image_path);
    encoded_key_image = encode_plain_image_by_row(key_image , key_image_key);
%将两个编码图进行DNA操作
    cipher_and_encoded_image = encryption_operate(encoded_original_image , encoded_key_image , [plain_image_path,key5]);
%对操作图进行解码，得到中间图
    cipher_image = decode_encoded_cipher_image(cipher_and_encoded_image , key5);
end