function [encoded_row_pixels] = rule3(plain_row_pixels)
    encoded_row_pixels = '';
    iterations = length(plain_row_pixels);
    for i = 1:iterations
        binvalue = dec2bin(plain_row_pixels(i),8);
        

        if binvalue(1) == '0' && binvalue(2) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        elseif  binvalue(1) == '0' && binvalue(2) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        elseif binvalue(1) == '1' && binvalue(2) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        end
        

        if binvalue(3) == '0' && binvalue(4) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        elseif  binvalue(3) == '0' && binvalue(4) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        elseif binvalue(3) == '1' && binvalue(4) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        end
        

        if binvalue(5) == '0' && binvalue(6) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        elseif  binvalue(5) == '0' && binvalue(6) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        elseif binvalue(5) == '1' && binvalue(6) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        end
        

        if binvalue(7) == '0' && binvalue(8) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        elseif  binvalue(7) == '0' && binvalue(8) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        elseif binvalue(7) == '1' && binvalue(8) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        end
    end
end