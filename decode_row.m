function [decoded_row_pixels] = decode_row(RULE, encoded_row_pixels)
    switch RULE
    case 1
        decoded_row_pixels = rule1_reverse(encoded_row_pixels);
    case 2
        decoded_row_pixels = rule2_reverse(encoded_row_pixels);
    case 3
        decoded_row_pixels = rule3_reverse(encoded_row_pixels);
    case 4
        decoded_row_pixels = rule4_reverse(encoded_row_pixels);
    case 5
        decoded_row_pixels = rule5_reverse(encoded_row_pixels);
    case 6
        decoded_row_pixels = rule6_reverse(encoded_row_pixels);
    case 7
        decoded_row_pixels = rule7_reverse(encoded_row_pixels);
    case 8
        decoded_row_pixels = rule8_reverse(encoded_row_pixels);
    end;
end