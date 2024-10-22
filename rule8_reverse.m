function [original_cipher_image_row] = rule8_reverse(encoded_cipher_image_row)
    iterator = length(encoded_cipher_image_row);
    row_length = iterator;
    max_row = iterator / 4;
    original_cipher_image_row = zeros(1,max_row);
    bin_string = '';
    for i = 1 : iterator
        if char(encoded_cipher_image_row(i)) == 'G'
            bin_string = [bin_string , '00'];
        elseif char(encoded_cipher_image_row(i)) == 'T'
            bin_string = [bin_string , '01'];
        elseif char(encoded_cipher_image_row(i)) == 'A'
            bin_string = [bin_string , '10'];
        else
            bin_string = [bin_string , '11'];
        end
    end
    
 %   dec_string = '';
    j = 1;
    for i = 1:8:(2 * row_length - 7)
        dec_string = bin_string(i:i+7);
        original_cipher_image_row(j) = bin2dec(dec_string);
        j = j + 1;
    end;
end
