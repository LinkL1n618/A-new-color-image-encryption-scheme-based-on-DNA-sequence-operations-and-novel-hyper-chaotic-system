function cipher_image = second_round_encryption(intermidiate_image , key_image , key6 , key7 , key_image_key)
    %中间图生成
    %对两张图进行编码
    encoded_original_image = encode_plain_image_by_row(intermidiate_image , key6);
    encoded_key_image = encode_plain_image_by_row(key_image , [key_image_key,key7,key6]);
%这一个代码（之前）有问题↓(现已解决）
%将两张编码图进行DNA操作
    cipher_and_encoded_image = encryption_operate(encoded_original_image , encoded_key_image , [key6,key7]);
%对操作图进行解码，传入的密钥是操作图的路径
    cipher_image = decode_encoded_cipher_image(cipher_and_encoded_image , key7);
end