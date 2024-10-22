function cipher_image = first_round_encryption(plain_image_path ,key_image, key5 , key_image_key)
%%
%ԭͼ��������
    plain_image = imread(plain_image_path);
    %plain_image = rgb2gray(plain_image);
    plain_image = pretreate_the_image(plain_image);
%%
%��ԭͼ����Կͼ�����б���
    encoded_original_image = encode_plain_image_by_row(plain_image , plain_image_path);
    encoded_key_image = encode_plain_image_by_row(key_image , key_image_key);
%����������ͼ����DNA����
    cipher_and_encoded_image = encryption_operate(encoded_original_image , encoded_key_image , [plain_image_path,key5]);
%�Բ���ͼ���н��룬�õ��м�ͼ
    cipher_image = decode_encoded_cipher_image(cipher_and_encoded_image , key5);
end