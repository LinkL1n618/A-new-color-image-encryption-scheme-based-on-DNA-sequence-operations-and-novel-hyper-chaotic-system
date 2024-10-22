function [encoded_image] = encode_plain_image_by_row(plain_image , path)
%��ȡͼƬ��С
[width , height , ~] = size(plain_image);
%��������ͼ���󣬴�СΪM*4*N
encoded_image = zeros(width, height*4); 
initial_num = sha512_to_float(sha512(path,'SHA-512'));
x = initial_num;
u = 3.999;
x = u * x * (1 - x);
%��ÿһ�н���DNA�б��룬x�ĳ�ʼֵ��path��SHA-512ֵת���ɵ�С����0-1֮�䣩
    for i = 1:width
        RULE = floor(8*x)+1;
        encoded_image(i, :) = encode_row(RULE, plain_image(i, :));
        x = u * x * (1 - x);
    end;
end