function original_image = second_round_decryption(intermediate_image , key_image , original_image_path , key5 , key_image_key , original_width , original_height)
%���м�ͼ����Կͼ���б��룬�м�ͼ���봫�����Կ�ǵ�һ�ּ���ʱDNA������õ���ͼ��·��
    encoded_intermediate_image = encode_plain_image_by_row_decryption(intermediate_image , key5);
    encoded_key_image = encode_key_image_by_row_decryption(key_image , key_image_key);
%�������м�ͼ�ͱ�����Կͼ������������������Կ��ԭͼ��·��
    original_encoded_image = decryption_operate(encoded_intermediate_image , encoded_key_image , [original_image_path,key5]);
%�Բ������ͼ���н��룬�������Կ��ԭͼ��·��
    original_pretreated_image = decode_encoded_cipher_image_decryption(original_encoded_image , original_image_path);
%��ͼ������Ԥ����������õ�ԭͼ����Ԥ�����������ķֱ��ǣ�Ԥ����ͼƬ��ԭͼ�ĸߣ�ԭͼ�ĳ�������ĸߺͿ���Ա߹������ľ��󳤿�˳���Ƕ�Ӧ�ģ���ϵͳ��ʾ��˳�����෴�ģ�
    original_image = pretreate_inverse_the_image(original_pretreated_image , original_height , original_width);
end