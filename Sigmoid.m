function T = Sigmoid(width, height )
    % �������Һ�������
    a = 0.2658;  % ���Һ�������
    b = -12.567;  % ���Һ�������

    % �������Һ�������ĳߴ�������ͼ����ͬ
    T = zeros(height, width);
    %resizedT = imresize(T, [height, width]);

    % �������Һ���
    x = linspace(1, 10, width); % ���ݾ����С����x��Χ
    y = linspace(1, 10, height); % ���ݾ����С����y��Χ
    [X, Y] = meshgrid(x, y);
    T = 1./(1 + exp(-a*(X+Y-b)));
end