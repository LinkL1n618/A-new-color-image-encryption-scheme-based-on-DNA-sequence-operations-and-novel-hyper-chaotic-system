function cipher_image = second_round_encryption(intermidiate_image , key_image , key6 , key7 , key_image_key)
    %�м�ͼ����
    %������ͼ���б���
    encoded_original_image = encode_plain_image_by_row(intermidiate_image , key6);
    encoded_key_image = encode_plain_image_by_row(key_image , [key_image_key,key7,key6]);
%��һ�����루֮ǰ���������(���ѽ����
%�����ű���ͼ����DNA����
    cipher_and_encoded_image = encryption_operate(encoded_original_image , encoded_key_image , [key6,key7]);
%�Բ���ͼ���н��룬�������Կ�ǲ���ͼ��·��
    cipher_image = decode_encoded_cipher_image(cipher_and_encoded_image , key7);
end