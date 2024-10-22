function scrambled_gray_image = arnold_gray_scramble(image, rounds,T)
    % 获取图像尺寸
    [height, width, ~] = size(image);
    
    image = im2double(image);

    a=2;
    b=3;
    % 创建空白图像
    scrambled_gray_image = zeros(height, width, 'uint8');
    scrambled_gray_image = im2double(scrambled_gray_image);
    % 执行Arnold置乱算法
    for r = 1:rounds    
        for y = 1:height
            for x = 1:width
                 new_x=mod((x-1)+b*(y-1),width)+1;   %mod取余操作，(a,b)就是a除以b的余数
                 new_y=mod(a*(x-1)+(a*b+1)*(y-1),height)+1;
                 scrambled_gray_image(new_y,new_x)=image(y,x);
            end
        end
        % 将置乱后的图像作为下一轮迭代的输入
        image = scrambled_gray_image;
    end
     scrambled_gray_image = scrambled_gray_image .* T;
end