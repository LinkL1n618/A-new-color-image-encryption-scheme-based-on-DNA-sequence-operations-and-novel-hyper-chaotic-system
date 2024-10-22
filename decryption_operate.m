function [cipher_and_encoded_image] = decryption_operate(encoded_cipher_image, encoded_key_image, key)  
%���ܹ�������Ҫ�õ���DNA����
[width , height] = size(encoded_cipher_image);
cipher_and_encoded_image = uint8(zeros(width, height));
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
        cipher_and_encoded_image(i, :) = operate_or_in_row(encoded_cipher_image(i, :), encoded_key_image(i, :));
    case 2
        %% �ӷ�����
        cipher_and_encoded_image(i, :) = operate_addition_in_row(encoded_cipher_image(i, :), encoded_key_image(i, :));
    case 3
        %% �������� ������DNA�����������
        cipher_and_encoded_image(i, :) = operate_subtracktion_reverse_in_row(encoded_cipher_image(i, :), encoded_key_image(i, :));
    case 4
        %% ���Ʋ��� �ͼ����෴
        cipher_and_encoded_image(i, :) = operation_right_shift(encoded_cipher_image(i, :), the_number_of_move);
    case 5
        %% ���Ʋ��� �ͼ����෴
        cipher_and_encoded_image(i, :) = operation_left_shift(encoded_cipher_image(i, :), the_number_of_move);
end
    if OPERATION == 1 || OPERATION == 2 || OPERATION == 3
    break; % һ���鵽 1��2 �� 3������ѭ��
    end
    end
end
end