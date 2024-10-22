function T = Sigmoid(width, height )
    % 设置置乱函数参数
    a = 0.2658;  % 置乱函数参数
    b = -12.567;  % 置乱函数参数

    % 调整置乱函数矩阵的尺寸与输入图像相同
    T = zeros(height, width);
    %resizedT = imresize(T, [height, width]);

    % 生成置乱函数
    x = linspace(1, 10, width); % 根据矩阵大小调整x范围
    y = linspace(1, 10, height); % 根据矩阵大小调整y范围
    [X, Y] = meshgrid(x, y);
    T = 1./(1 + exp(-a*(X+Y-b)));
end