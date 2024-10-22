% Gauss映射
function xn1 = gaussMap(xn)
    xn1 = 4.999 * xn * (1 - xn) * exp(-xn^2);
end