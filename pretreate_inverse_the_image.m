function original_image = pretreate_inverse_the_image(pretreated_image , original_height , original_width)
%��Ԥ����
    [height , width] = size(pretreated_image);
    T = Sigmoid(width,height);
    get_reverse_image = zeros(height , width , 'double');
    get_reverse_image = arnold_gray_inverse(pretreated_image,8,T);      %Arnold�����Ҳ���
    reverse_image = im2uint8(get_reverse_image);    %�����Ҳ�����õ�����double���ͣ�����ת����uint8����
    if original_height ~= original_width        %�ж�ԭ���Ƿ�Ϊ������ȵ�ͼƬ��������ǣ����и�ԭ����
        reverse_image = reverse_image(1:original_height, 1:original_width);
    end
    original_image = reverse_image;
end