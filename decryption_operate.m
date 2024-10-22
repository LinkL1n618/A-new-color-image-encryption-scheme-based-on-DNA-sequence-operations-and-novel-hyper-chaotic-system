function [cipher_and_encoded_image] = decryption_operate(encoded_cipher_image, encoded_key_image, key)  
%解密过程中需要用到的DNA操作
[width , height] = size(encoded_cipher_image);
cipher_and_encoded_image = uint8(zeros(width, height));
initial_x_value = sha512_to_float(sha512(key,'SHA-512'));
x = CircleMap(initial_x_value);
%% 5种操作方式
for i = 1:width
    while true
    OPERATION = floor(5*x)+1;
    the_number_of_move = floor(height * x) + 1;
    x = CircleMap(x);
%%
switch OPERATION
    case 1
        %% 或操作
        cipher_and_encoded_image(i, :) = operate_or_in_row(encoded_cipher_image(i, :), encoded_key_image(i, :));
    case 2
        %% 加法操作
        cipher_and_encoded_image(i, :) = operate_addition_in_row(encoded_cipher_image(i, :), encoded_key_image(i, :));
    case 3
        %% 减法操作 运用了DNA减法的逆操作
        cipher_and_encoded_image(i, :) = operate_subtracktion_reverse_in_row(encoded_cipher_image(i, :), encoded_key_image(i, :));
    case 4
        %% 右移操作 和加密相反
        cipher_and_encoded_image(i, :) = operation_right_shift(encoded_cipher_image(i, :), the_number_of_move);
    case 5
        %% 左移操作 和加密相反
        cipher_and_encoded_image(i, :) = operation_left_shift(encoded_cipher_image(i, :), the_number_of_move);
end
    if OPERATION == 1 || OPERATION == 2 || OPERATION == 3
    break; % 一旦抽到 1、2 或 3，跳出循环
    end
    end
end
end