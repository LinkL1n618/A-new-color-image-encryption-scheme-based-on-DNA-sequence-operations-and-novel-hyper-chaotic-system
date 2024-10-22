function [cipher_image] = decode_encoded_cipher_image_decryption(encoded_cipher_image , path)
[width , height] = size(encoded_cipher_image);
height = height / 4;
cipher_image = uint8(zeros(width , height));
initial_num = sha512_to_float(sha512(path,'SHA-512'));
u = 3.999;
x = u * initial_num * (1-initial_num);
for i = 1:width
    RULE = floor(8*x) + 1;
    cipher_image(i, :) = decode_row(RULE, encoded_cipher_image(i, :));
    x = u * x * (1-x);
end;
end