function result = sha512_to_float(hash_value)
    % global randnum;
    % randnum = 3.999 * randnum * (1 - randnum);
    % startnum = floor(randnum * 128) + 1;
    % if startnum <= 128-16
    %     hash_value = hash_value(startnum : startnum + 15);
    % else
    %     hash_value = hash_value(startnum - 15 : startnum);
    % end
    % hash_int = hex2dec(hash_value);
    % max_hash_value = 'ffffffffffffffff';
    % max_hash = hex2dec(max_hash_value);
    % result = hash_int / max_hash;
    hash_value = upper(hash_value);
    hash_value1 = hex2dec(hash_value(1:16));
    hash_value2 = hex2dec(hash_value(17:32));
    hash_value3 = hex2dec(hash_value(33:48));
    hash_value4 = hex2dec(hash_value(49:64));
    hash_value5 = hex2dec(hash_value(65:80));
    hash_value6 = hex2dec(hash_value(81:96));
    hash_value7 = hex2dec(hash_value(97:112));
    hash_value8 = hex2dec(hash_value(113:128));
    hash_int = bitxor(bitxor(bitxor(bitxor(bitxor(bitxor(bitxor(hash_value1,hash_value2),hash_value3),hash_value4),hash_value5),hash_value6),hash_value7),hash_value8);
    %hash_int = hex2dec(hash_value_ulti);
    max_hash_value = 'ffffffffffffffff';
    max_hash = hex2dec(max_hash_value);
    result = hash_int / max_hash;
end