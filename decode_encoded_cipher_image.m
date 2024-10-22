function [cipher_image] = decode_encoded_cipher_image(encoded_cipher_image , path)
[width , height] = size(encoded_cipher_image);
height = height / 4;
cipher_image = uint8(zeros(width , height));
initial_num = sha512_to_float(sha512(path,'SHA-512'));
x = gaussMap(initial_num);
for i = 1:width
    RULE = floor(mod(x*1000,8))+1;
    cipher_image(i, :) = decode_row(RULE, encoded_cipher_image(i, :));
    x = gaussMap(x);
end;
end