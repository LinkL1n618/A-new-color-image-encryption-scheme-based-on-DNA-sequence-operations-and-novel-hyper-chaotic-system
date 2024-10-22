function pretreated_image = pretreate_the_image_color(plain_image)
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
%    grey_image=rgb2gray(image);
    [new_height, new_width, ~] = size(image);
    T = Sigmoid(new_width,new_height);
    timage = zeros(new_height , new_width , 'double');
    timage = arnold_scramble_color(image,8,T);
    pretreated_image = im2uint8(timage);
end