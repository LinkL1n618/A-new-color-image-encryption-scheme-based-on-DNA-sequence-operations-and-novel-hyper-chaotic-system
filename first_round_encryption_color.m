function cipher_image = first_round_encryption_color(plain_image , plain_image_path , key_image , key5 , key_image_key)
%%
%对原图和密钥图进行行编码
    encoded_original_image = encode_plain_image_by_row(plain_image , plain_image_path);
    encoded_key_image = encode_plain_image_by_row(key_image , key_image_key);
%将两个编码图进行DNA操作，传入的密钥是原图的路径
    cipher_and_encoded_image = encryption_operate(encoded_original_image , encoded_key_image , [plain_image_path,key5]);
%对操作图进行解码，得到中间图
    cipher_image = decode_encoded_cipher_image(cipher_and_encoded_image , key5);
end