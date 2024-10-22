function dxdt = fourDimensionalChaosSystem(x)
     % 系统参数
    a = 40; % 参数a的值
    b = 30;  % 参数b的值
    c = 15;  % 参数c的值
    d = 7;  % 参数d的值
    e = 0.4;  % 参数e的值
    f = 25;
    Mf1 = 0.2;
    Mf2 = 0.5;

    % 系统方程
    dxdt = [
    a * (x(2) - x(1)) + Memristor_formula(Mf1,Mf2,x(4)) * x(3) ;
    b *  x(1) - x(1)  * x(3) + c * x(2);
    x(1) * x(2) - d * x(3) ;
    e * x(1)^2 - f * x(4)
    ];


    
end