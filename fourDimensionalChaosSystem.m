function dxdt = fourDimensionalChaosSystem(x)
     % ϵͳ����
    a = 40; % ����a��ֵ
    b = 30;  % ����b��ֵ
    c = 15;  % ����c��ֵ
    d = 7;  % ����d��ֵ
    e = 0.4;  % ����e��ֵ
    f = 25;
    Mf1 = 0.2;
    Mf2 = 0.5;

    % ϵͳ����
    dxdt = [
    a * (x(2) - x(1)) + Memristor_formula(Mf1,Mf2,x(4)) * x(3) ;
    b *  x(1) - x(1)  * x(3) + c * x(2);
    x(1) * x(2) - d * x(3) ;
    e * x(1)^2 - f * x(4)
    ];


    
end