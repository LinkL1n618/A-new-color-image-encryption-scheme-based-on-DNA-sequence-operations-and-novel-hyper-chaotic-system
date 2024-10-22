function result = CircleMap(x)
    result = mod(3.85*x + 0.4 - (0.7/(3.85*pi))*sin(3.85*pi*x),1);
end