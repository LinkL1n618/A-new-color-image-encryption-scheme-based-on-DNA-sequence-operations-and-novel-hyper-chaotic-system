function [c] = operation_right_shift(a , number_of_move)
    shiftAmount = number_of_move;
    shiftedCharacters = a(end-shiftAmount+1:end);
    shiftedCharacters = [shiftedCharacters, a(1:end-shiftAmount)];
    c = shiftedCharacters;
end