function intermediate_image = first_round_decryption_color(cipher_image , key_image , key6 , key7 , key_image_key)
%���ڵ�һ�ֽ��ܣ�������Ҫ��ԭ������Կͼ˳ʱ����ת90��
    key_image = imrotate(key_image , -90);
%�Լ���ͼ����Կͼ���б��룬����ͼ���봫�����Կ�ǵڶ��ּ���ʱDNA������õ���ͼ��·��
    encoded_cipher_image = encode_plain_image_by_row_decryption(cipher_image , key7);
    encoded_key_image = encode_key_image_by_row_decryption(key_image , [key_image_key,key7,key6]);
%�����������ͼ����������������Լ���ʱ���ɵ��м�ͼ·����Ϊ��ԿҲ��Ҫ����
    intermediate_encoded_image = decryption_operate(encoded_cipher_image , encoded_key_image , [key6,key7]);
%�Բ������ͼ���н��룬������Կ�Ǽ���ʱ���ɵ��м�ͼ·��
    intermediate_image = decode_encoded_cipher_image_decryption(intermediate_encoded_image , key6);
end