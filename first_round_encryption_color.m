function cipher_image = first_round_encryption_color(plain_image , plain_image_path , key_image , key5 , key_image_key)
%%
%��ԭͼ����Կͼ�����б���
    encoded_original_image = encode_plain_image_by_row(plain_image , plain_image_path);
    encoded_key_image = encode_plain_image_by_row(key_image , key_image_key);
%����������ͼ����DNA�������������Կ��ԭͼ��·��
    cipher_and_encoded_image = encryption_operate(encoded_original_image , encoded_key_image , [plain_image_path,key5]);
%�Բ���ͼ���н��룬�õ��м�ͼ
    cipher_image = decode_encoded_cipher_image(cipher_and_encoded_image , key5);
end