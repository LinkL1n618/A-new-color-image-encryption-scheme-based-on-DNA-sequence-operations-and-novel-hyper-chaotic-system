function scrambled_gray_image = arnold_gray_scramble(image, rounds,T)
    % ��ȡͼ��ߴ�
    [height, width, ~] = size(image);
    
    image = im2double(image);

    a=2;
    b=3;
    % �����հ�ͼ��
    scrambled_gray_image = zeros(height, width, 'uint8');
    scrambled_gray_image = im2double(scrambled_gray_image);
    % ִ��Arnold�����㷨
    for r = 1:rounds    
        for y = 1:height
            for x = 1:width
                 new_x=mod((x-1)+b*(y-1),width)+1;   %modȡ�������(a,b)����a����b������
                 new_y=mod(a*(x-1)+(a*b+1)*(y-1),height)+1;
                 scrambled_gray_image(new_y,new_x)=image(y,x);
            end
        end
        % �����Һ��ͼ����Ϊ��һ�ֵ���������
        image = scrambled_gray_image;
    end
     scrambled_gray_image = scrambled_gray_image .* T;
end