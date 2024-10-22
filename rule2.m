function [encoded_row_pixels] = rule2(plain_row_pixels)
    encoded_row_pixels = '';
    iterations = length(plain_row_pixels);
    for i = 1:iterations
        binvalue = dec2bin(plain_row_pixels(i),8);
        

        if binvalue(1) == '0' && binvalue(2) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        elseif  binvalue(1) == '0' && binvalue(2) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        elseif binvalue(1) == '1' && binvalue(2) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        end
        

        if binvalue(3) == '0' && binvalue(4) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        elseif  binvalue(3) == '0' && binvalue(4) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        elseif binvalue(3) == '1' && binvalue(4) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        end
        

        if binvalue(5) == '0' && binvalue(6) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        elseif  binvalue(5) == '0' && binvalue(6) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        elseif binvalue(5) == '1' && binvalue(6) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        end
        
        if binvalue(7) == '0' && binvalue(8) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'A' ];
        elseif  binvalue(7) == '0' && binvalue(8) == '1'
            encoded_row_pixels = [encoded_row_pixels , 'G' ];
        elseif binvalue(7) == '1' && binvalue(8) == '0'
            encoded_row_pixels = [encoded_row_pixels , 'C' ];
        else
            encoded_row_pixels = [encoded_row_pixels , 'T' ];
        end
    end
end