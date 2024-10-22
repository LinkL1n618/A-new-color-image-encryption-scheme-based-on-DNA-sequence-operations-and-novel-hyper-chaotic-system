function original_image = second_round_decryption_color(intermediate_image , original_image_path ,  key_image , key5 , key_image_key )
%将中间图和密钥图进行编码，中间图编码传入的密钥是第一轮加密时DNA操作后得到的图的路径
    encoded_intermediate_image = encode_plain_image_by_row_decryption(intermediate_image , key5);
    encoded_key_image = encode_key_image_by_row_decryption(key_image , key_image_key);
%将编码中间图和编码密钥图进行逆操作，传入的密钥是原图的路径
    original_encoded_image = decryption_operate(encoded_intermediate_image , encoded_key_image , [original_image_path,key5]);
%对操作后的图进行解码，传入的密钥是原图的路径
    original_image = decode_encoded_cipher_image_decryption(original_encoded_image , original_image_path);
end