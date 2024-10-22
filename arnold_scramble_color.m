function scrambled_image = arnold_scramble_color(image, rounds,T)
    % ��ȡͼ��ߴ�
    [height, width, ~] = size(image);
    
    image = im2double(image);
    
    a=2;
    b=3;
    % �����հ�ͼ��
    scrambled_image = zeros(height, width, 3, 'uint8');
    scrambled_image = im2double(scrambled_image);
    
    %the_number_in_fibonacci = fibonacci(width * height);
    
    % ִ��Arnold�����㷨
    for r = 1:rounds    
        for y = 1:height
            for x = 1:width
                 new_x=mod((x-1)+b*(y-1),width)+1;   %modȡ�������(a,b)����a����b������
                 new_y=mod(a*(x-1)+(a*b+1)*(y-1),height)+1;
                 scrambled_image(new_y,new_x,:)=image(y,x,:);
 %                if r == rounds
 %                    scrambled_image(new_y,new_x) = floor(scrambled_image(new_y,new_x) * T(x,y));
 %                end
               %  scrambled_image(yy,xx,:)=scrambled_image(yy,xx,:)*(abs(0.99*sin(pi*x*y)));
            end
        end
        % �����Һ��ͼ����Ϊ��һ�ֵ���������
        image = scrambled_image;
    end
 %   scrambled_image = im2uint8(scrambled_image);
 %   double_scrambled_image = im2double(scrambled_image);
 %   scrambled_image = scrambled_image .* T;
 %   scrambled_image = im2uint8(scrambled_image);
end