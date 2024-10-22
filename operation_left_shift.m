function [c] = operation_left_shift(a , number_of_move)
    shiftAmount = number_of_move;
    shiftedCharacters = zeros(size(a));
    shiftedCharacters = a(shiftAmount+1:end);
    shiftedCharacters = [shiftedCharacters, a(1:shiftAmount)];
    c = shiftedCharacters;
end