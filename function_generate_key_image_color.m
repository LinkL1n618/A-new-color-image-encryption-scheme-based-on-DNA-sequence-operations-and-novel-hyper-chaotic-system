function [result_image,key1,key2,key3,key4] = function_generate_key_image_color(path)    
%获取信息
imageInfo = imfinfo(path);
name=imageInfo.Filename;%图像名字
time=imageInfo.FileModDate;%图像创建时间
size=imageInfo.FileSize;%图像大小
%图像长宽
width=imageInfo.Width;
height=imageInfo.Height;
N = max(width , height);
%规划格式，将长和宽组成一个字符串，以便后面SHA-256算法进行转化
resolution=[num2str(width) 'x' num2str(height)];

%SHA-256算法转换
name_num=sha512_to_float(sha512(name,'SHA-512'));
time_num=sha512_to_float(sha512(time,'SHA-512'));
size_num=sha512_to_float(sha512(num2str(size),'SHA-512'));
resolution_num=sha512_to_float(sha512(resolution,'SHA-512'));
key1 = name;
key2 = time;
key3 = size;
key4 = resolution;
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
key_image=zeros(N,N,3);


%生成密钥矩阵


for i = 1:N*N*3
    %Logistic映射控制选用哪一组数据作为密码块和忆阻函数参数
    name_num=3.999*name_num*(1-name_num);
    num1=floor(name_num*4)+1;
    key_image(i)=mod(abs(floor(result(num1))),255);
    
    %Sine映射控制选用哪一行数据作为忆阻函数参数
    %%
    % (替换下一个混沌系统式）
    time_num=0.999*sin(pi * time_num);
    %%
    num2=floor(time_num*length(sol))+1;
    
    result = [sol(num2,1),sol(num2,2),sol(num2,3),sol(num2,4)];
end
 
%将原来的数字矩阵转化成可以表示的图片
result_image = uint8(key_image);
end