function original_image = arnold_inverse_color(scrambled_image,rounds,T)
[height,width,~] = size(scrambled_image);


a=2;
b=3;
% �����հ�ͼ��

scrambled_image = im2double(scrambled_image);

original_image = zeros(height, width, 3, 'double');

% ִ��Arnold������
for r = 1:rounds
    for y = 1:height
        for x = 1:width
            % �������ص�ԭʼλ��
             % �������ص���λ��
                new_x=mod((a*b+1)*(x-1)-b*(y-1),width)+1;%matlab�����в�����0��Ҫ��1��ʼ
                new_y=mod(-a*(x-1)+(y-1),height)+1;
                original_image(new_y,new_x,:)=scrambled_image(y,x,:);
 %               if r == rounds
 %                    original_image(new_y,new_x,:) = floor(original_image(new_y,new_x,:) / T(x,y));
 %                end
        end
    end
    
    % ����������ͼ����Ϊ��һ�ֵ���������
    scrambled_image = original_image;
end
   % original_image = original_image .* T;
end