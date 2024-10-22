function intermediate_image = first_round_decryption_color(cipher_image , key_image , key6 , key7 , key_image_key)
%由于第一轮解密，所以需要将原来的密钥图顺时针旋转90度
    key_image = imrotate(key_image , -90);
%对加密图和密钥图进行编码，加密图编码传入的密钥是第二轮加密时DNA操作后得到的图的路径
    encoded_cipher_image = encode_plain_image_by_row_decryption(cipher_image , key7);
    encoded_key_image = encode_key_image_by_row_decryption(key_image , [key_image_key,key7,key6]);
%将两个编码的图进行逆操作，并且以加密时生成的中间图路径作为密钥也需要传入
    intermediate_encoded_image = decryption_operate(encoded_cipher_image , encoded_key_image , [key6,key7]);
%对操作后的图进行解码，解码密钥是加密时生成的中间图路径
    intermediate_image = decode_encoded_cipher_image_decryption(intermediate_encoded_image , key6);
end