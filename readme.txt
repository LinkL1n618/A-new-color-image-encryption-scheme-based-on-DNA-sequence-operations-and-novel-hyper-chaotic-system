本文件夹是算法源代码文件夹，用于存放图像加密和解密算法的源代码。
总的算法源代码分为加密和解密代码，在加密和解密代码下面又分为彩色图像加解密和灰色图像加解密。本文件夹还带有DNA编码、运算图表，方便审查
其中最主要的算法代码是以下几个：
1.color_image_encryption.m：彩色图像加密代码，用于对彩色图像进行加密，输入对应的参数即可对图像进行加密
2.color_image_decryption.m：彩色图像解密代码，用于对彩色图像进行解密，输入对应的参数即可对图像进行解密
3.gray_image_encryption.m：灰度图像加密代码，用于对灰度图像进行加密，输入对应的参数即可对图像进行加密
4.gray_image_decryption.m：灰度图像解密代码，用于对灰度图像进行解密，输入对应的参数即可对图像进行解密
剩余的代码详细解释如下：
1.加密代码：
    1.1 灰度图像加密代码：
        1. arnold_gray_scramble.m：对图像预处理时，使用Arnold置乱算法对图像进行置乱
        2. decode_encoded_cipher_image.m：对已经进行DNA编码后的图像进行DNA解码
        3. decode_row.m：对已经DNA编码后的图像进行逐行DNA解码，此函数是被上面的decode_encoded_cipher_image函数所调用
        4. encode_plain_image_by_row.m：对未进行DNA编码的图像进行DNA编码
        5. encode_row.m：对未进行DNA编码的图像进行逐行DNA编码，此函数是被上面的encode_plain_image_by_row函数所调用
        6. encryption_operate.m：对已经DNA编码后的两张图像进行DNA运算
        7. first_round_encryption.m：对灰度图像进行第一轮加密
        8. function_generate_key_image_gray.m：用四维忆阻超混沌系统生成灰度图加密需要的密钥图
        9. gray_image_encryption.m：灰度图加密总代码
        10. pretreate_the_image.m：对图像预处理
        11. second_round_encryption.m：对灰度图像进行第二轮加密
    1.2 彩色图像加密代码：
        1. arnold_scramble_color.m：对彩色图像预处理时，使用Arnold置乱算法对彩色图像进行置乱
        2. color_image_encryption.m：彩色图像加密总代码
        3. first_round_encryption_color.m：对彩色图像进行第一轮加密
        4. function_generate_key_image_color.m：用四维忆阻超混沌系统生成彩色图加密需要的密钥图
        5. pretreate_the_image_color.m：对彩色图像进行预处理
        6. second_round_encryption_color.m：对彩色图像进行第二轮加密
2.解密代码：
    2.1 灰度图像解密代码：
        1. arnold_gray_inverse.m：对图像进行逆向预处理，即使用Arnold逆置乱算法对图像进行还原
        2. decode_encoded_cipher_image_decryption.m：在解密算法中对已经进行DNA编码后的图像进行DNA解码
        3. decryption.operate.m：对已经DNA编码后的两张图像进行DNA解密运算
        4. encode_key_image_by_row_decryption.m：在解密算法中，对通过四维忆阻超混沌系统得到的密钥图进行DNA编码
        5. encode_plain_image_by_row_decryption.m：在解密算法中，对加密后的图进行DNA编码
        6. first_round_decryption.m：对灰度图像进行第一轮解密
        7. function_generate_decryption_key_image.m：用四维忆阻超混沌系统生成解密需要的密钥图
        8. gray_image_decryption.m：灰度图解密总代码
        9. pretreate_inverse_the_image.m：对图像进行逆预处理
        10. second_round_decryption.m：对灰度图进行第二轮解密
    2.2 彩色图像解密代码：
        1. arnold_inverse_color.m：对彩色图像进行逆向预处理，即使用Arnold逆置乱算法对彩色图像进行还原
        2. color_image_decryption.m：彩色图像解密总代码
        3. first_round_decryption_color.m：对彩色图像进行第一轮解密
        4. function_generate_decryption_key_image_color.m：用四维忆阻超混沌系统生成彩色图解密需要的密钥图
        5. pretreate_inverse_the_image_color.m：对彩色图像进行逆预处理
        6. second_round_decryption_color.m：对彩色图像进行第二轮解密
3.DNA代码：DNA的编码表、运算表都在本文件夹内，方便审查
    3.1 DNA编码代码
        1. rule1.m：根据规则一对图像进行DNA编码
        2. rule2.m：根据规则二对图像进行DNA编码
        3. rule3.m：根据规则三对图像进行DNA编码
        4. rule4.m：根据规则四对图像进行DNA编码
        5. rule5.m：根据规则五对图像进行DNA编码
        6. rule6.m：根据规则六对图像进行DNA编码
        7. rule7.m：根据规则七对图像进行DNA编码
        8. rule8.m：根据规则八对图像进行DNA编码
    3.2 DNA解码代码
        1. rule1_reverse.m：根据规则一对图像进行DNA解码
        2. rule2_reverse.m：根据规则二对图像进行DNA解码
        3. rule3_reverse.m：根据规则三对图像进行DNA解码
        4. rule4_reverse.m：根据规则四对图像进行DNA解码
        5. rule5_reverse.m：根据规则五对图像进行DNA解码
        6. rule6_reverse.m：根据规则六对图像进行DNA解码
        7. rule7_reverse.m：根据规则七对图像进行DNA解码
        8. rule8_reverse.m：根据规则八对图像进行DNA解码
    3.3 DNA运算代码
        1. operation_addition.m：对两组DNA序列进行加法运算
        2. operation_subtracktion.m：对两组DNA序列进行减法运算
        3. operation_or.m：对两组DNA序列进行异或运算
        4. operation_left_shift.m：对一组DNA序列进行左移运算
        5. operation_right_shift.m：对一组DNA序列进行右移运算
        6. operation_subtracktion_reverse.m：解密时，对两组DNA序列进行减法逆运算
        7. operation_addition_in_row.m：对两组DNA序列进行逐行加法运算，该函数是被operation_addtition.m所调用
        8. operation_or_in_row.m：对两组DNA序列进行逐行异或运算，该函数是被operation_or.m所调用
        9. operation_subtracktion_in_row.m：对两组DNA序列进行逐行减法运算，该函数是被operation_subtracktion.m所调用
        10. operation_subtracktion_reverse_in_row.m：对两组DNA序列进行逐行减法逆运算，该函数是被operation_subtracktion_reverse.m所调用
4.其他代码
    4.1 CircleMap.m：在加解密算法中使用的Circle混沌映射公式
    4.2 fourDimensionalChaosSystem.m：四维忆阻超混沌系统代码
    4.3 gaussMap.m：在加解密算法中使用的高斯混沌映射公式
    4.4 Memristor_formula.m：四维忆阻超混沌系统中的忆阻器方程
    4.5 sha512.m：对数据进行sha512哈希算法处理的代码
    4.6 sha512_to_float.m：对得到的哈希值进行0-1化处理
    4.7 Sigmoid.m：在对图像进行预处理时，使用Sigmoid算法对图像进行扩散操作
    4.8 SineMap.m：在加解密算法中使用的Sine混沌映射公式