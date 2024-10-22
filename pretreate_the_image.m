function [pretreated_image,time_key] = pretreate_the_image(plain_image)
    image = plain_image;
    [original_height, original_width, ~] = size(image);
    if original_height ~= original_width
        max_dim = max(original_height , original_width);
        padded_height = max_dim;
        padded_width = max_dim;
        vertical_padding = padded_height - original_height;
        horizontal_padding = padded_width - original_width;
        image = padarray(image, [vertical_padding, horizontal_padding], 'replicate', 'post');
    end 
    [new_height, new_width, ~] = size(image);
    T = Sigmoid(new_width,new_height);
    timage = zeros(new_height , new_width , 'double');
    timage = arnold_gray_scramble(image,8,T);
    pretreated_image = im2uint8(timage);
end