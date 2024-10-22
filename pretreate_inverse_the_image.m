function original_image = pretreate_inverse_the_image(pretreated_image , original_height , original_width)
%逆预处理
    [height , width] = size(pretreated_image);
    T = Sigmoid(width,height);
    get_reverse_image = zeros(height , width , 'double');
    get_reverse_image = arnold_gray_inverse(pretreated_image,8,T);      %Arnold逆置乱操作
    reverse_image = im2uint8(get_reverse_image);    %逆置乱操作后得到的是double类型，这里转换成uint8类型
    if original_height ~= original_width        %判断原先是否为长宽相等的图片，如果不是，进行复原操作
        reverse_image = reverse_image(1:original_height, 1:original_width);
    end
    original_image = reverse_image;
end