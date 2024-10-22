function [encoded_image] = encode_plain_image_by_row(plain_image , path)
%获取图片大小
[width , height , ~] = size(plain_image);
%构建加密图矩阵，大小为M*4*N
encoded_image = zeros(width, height*4); 
initial_num = sha512_to_float(sha512(path,'SHA-512'));
x = initial_num;
u = 3.999;
x = u * x * (1 - x);
%对每一行进行DNA行编码，x的初始值是path的SHA-512值转换成的小数（0-1之间）
    for i = 1:width
        RULE = floor(8*x)+1;
        encoded_image(i, :) = encode_row(RULE, plain_image(i, :));
        x = u * x * (1 - x);
    end;
end