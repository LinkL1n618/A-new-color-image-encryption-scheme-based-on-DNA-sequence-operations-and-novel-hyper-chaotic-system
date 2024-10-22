function [cipher_and_encoded_image] = encryption_operate(encoded_plain_image, encoded_key_image, key)  

[width , height] = size(encoded_plain_image);
cipher_and_encoded_image = uint8(zeros(width, height));
%information = imfinfo(path);
initial_x_value = sha512_to_float(sha512(key,'SHA-512'));
x = CircleMap(initial_x_value);
%% 5�ֲ�����ʽ
for i = 1:width
    while true
    OPERATION = floor(5*x)+1;
    the_number_of_move = floor(height * x) + 1;
    x = CircleMap(x);
%%
switch OPERATION
    case 1
        %% �����
        cipher_and_encoded_image(i, :) = operate_or_in_row(encoded_plain_image(i, :), encoded_key_image(i, :));
    case 2
        %% �ӷ�����
        cipher_and_encoded_image(i, :) = operate_addition_in_row(encoded_plain_image(i, :), encoded_key_image(i, :));
    case 3
        %% ��������
        cipher_and_encoded_image(i, :) = operate_subtracktion_in_row(encoded_plain_image(i, :), encoded_key_image(i, :));
    case 4
        %% ���Ʋ���
        cipher_and_encoded_image(i, :) = operation_left_shift(encoded_plain_image(i, :), the_number_of_move);
    case 5
        %% ���Ʋ���
        cipher_and_encoded_image(i, :) = operation_right_shift(encoded_plain_image(i, :), the_number_of_move);
end
    if OPERATION == 1 || OPERATION == 2 || OPERATION == 3
    break; % һ���鵽 1��2 �� 3������ѭ��
    end
   end
end
end