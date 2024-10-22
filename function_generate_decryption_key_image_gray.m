function outputimage = function_generate_decryption_key_image_gray(key1,key2,key3,key4,height,width)    
N = max(height ,width);
%SHA-256算法转换
name_num=sha512_to_float(sha512(key1,'SHA-512'));
time_num=sha512_to_float(sha512(key2,'SHA-512'));
size_num=sha512_to_float(sha512(num2str(key3),'SHA-512'));
resolution_num=sha512_to_float(sha512(key4,'SHA-512'));
    
    x = name_num; % 获取x的值
    y = time_num; % 获取y的值
    z = size_num; % 获取z的值
    w = resolution_num; % 获取w的值
  %定义初始值
  initial=[x,y,z,w];
  %定义时间区间
  tspan = [0.001, 10000];
  
  %四维超混沌系统普通迭代
%result=fourDimensionalChaosSystem(name_num,time_num,size_num,resolution_num,1,1);

%四维超混沌系统导数集
[t, sol] = ode45(@(t, x) fourDimensionalChaosSystem(x), tspan, initial);
%sol = sol(1000:13000,:,:,:);
result = [sol(floor(x*length(sol)),1),sol(floor(y*length(sol)),2),sol(floor(z*length(sol)),3),sol(floor(w*length(sol)),4)];
%新建密钥图矩阵
key_image=zeros(height,width);
%生成密钥矩阵


for i = 1:N*N
    %Logistic映射控制选用哪一组数据作为密码块和忆阻函数参数
    name_num=3.999*name_num*(1-name_num);
    num1=floor(name_num*4)+1;
    key_image(i)=mod(abs(floor(result(num1)*1000)),255);
    
    %Sine映射控制选用哪一行数据作为忆阻函数参数
    time_num=0.999*sin(pi * time_num);
    num2=floor(time_num*length(sol))+1;
    
    
    result = [sol(num2,1),sol(num2,2),sol(num2,3),sol(num2,4)];
end
 
%将原来的数字矩阵转化成可以表示的图片
outputimage = uint8(key_image);
end