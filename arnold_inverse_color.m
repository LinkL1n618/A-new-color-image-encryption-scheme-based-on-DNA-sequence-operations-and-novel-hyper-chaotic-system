function original_image = arnold_inverse_color(scrambled_image,rounds,T)
[height,width,~] = size(scrambled_image);


a=2;
b=3;
% 创建空白图像

scrambled_image = im2double(scrambled_image);

original_image = zeros(height, width, 3, 'double');

% 执行Arnold逆运算
for r = 1:rounds
    for y = 1:height
        for x = 1:width
            % 计算像素的原始位置
             % 计算像素的新位置
                new_x=mod((a*b+1)*(x-1)-b*(y-1),width)+1;%matlab索引中不能是0，要从1开始
                new_y=mod(-a*(x-1)+(y-1),height)+1;
                original_image(new_y,new_x,:)=scrambled_image(y,x,:);
 %               if r == rounds
 %                    original_image(new_y,new_x,:) = floor(original_image(new_y,new_x,:) / T(x,y));
 %                end
        end
    end
    
    % 将逆运算后的图像作为下一轮迭代的输入
    scrambled_image = original_image;
end
   % original_image = original_image .* T;
end