function outputimage = function_generate_decryption_key_image_gray(key1,key2,key3,key4,height,width)    
N = max(height ,width);
%SHA-256�㷨ת��
name_num=sha512_to_float(sha512(key1,'SHA-512'));
time_num=sha512_to_float(sha512(key2,'SHA-512'));
size_num=sha512_to_float(sha512(num2str(key3),'SHA-512'));
resolution_num=sha512_to_float(sha512(key4,'SHA-512'));
    
    x = name_num; % ��ȡx��ֵ
    y = time_num; % ��ȡy��ֵ
    z = size_num; % ��ȡz��ֵ
    w = resolution_num; % ��ȡw��ֵ
  %�����ʼֵ
  initial=[x,y,z,w];
  %����ʱ������
  tspan = [0.001, 10000];
  
  %��ά������ϵͳ��ͨ����
%result=fourDimensionalChaosSystem(name_num,time_num,size_num,resolution_num,1,1);

%��ά������ϵͳ������
[t, sol] = ode45(@(t, x) fourDimensionalChaosSystem(x), tspan, initial);
%sol = sol(1000:13000,:,:,:);
result = [sol(floor(x*length(sol)),1),sol(floor(y*length(sol)),2),sol(floor(z*length(sol)),3),sol(floor(w*length(sol)),4)];
%�½���Կͼ����
key_image=zeros(height,width);
%������Կ����


for i = 1:N*N
    %Logisticӳ�����ѡ����һ��������Ϊ���������躯������
    name_num=3.999*name_num*(1-name_num);
    num1=floor(name_num*4)+1;
    key_image(i)=mod(abs(floor(result(num1)*1000)),255);
    
    %Sineӳ�����ѡ����һ��������Ϊ���躯������
    time_num=0.999*sin(pi * time_num);
    num2=floor(time_num*length(sol))+1;
    
    
    result = [sol(num2,1),sol(num2,2),sol(num2,3),sol(num2,4)];
end
 
%��ԭ�������־���ת���ɿ��Ա�ʾ��ͼƬ
outputimage = uint8(key_image);
end