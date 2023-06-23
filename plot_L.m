%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义函数
fun1 = @(x, y) norm(LaplaceMatrix([1 1;-1 1;-1 -1;1 -1],false)-LaplaceMatrix([x y;-0.5 0.5;-0.5 -0.5;0.5 -0.5],false),"fro");

% 定义绘图区间
x = linspace(-5, 5, 50);
y = linspace(-5, 5, 50);

% 创建坐标网格
[X, Y] = meshgrid(x, y);

% 计算梯度
len = size(X,1);
Z1 = zeros(len,len);
for i=1:len
    for j=1:len
        Z1(i,j) =  fun1(x(i), y(j));
    end
end

% 绘制梯度图
% [gradX, gradY] = gradient(z, x, y);
% figure;
% quiver(X, Y, -gradX, -gradY);
% xlabel('X');
% ylabel('Y');
% title('Gradient Plot');
% axis tight;
% axis equal;

% 绘制曲面图
figure;
surf(X, Y, Z1);
%contour(X,Y,Z1);
hold on
xlabel('X');
ylabel('Y');
zlabel('Z');
title('L Surface Plot');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义函数
fun2 = @(x, y) norm(LaplaceMatrix([1 1;-1 1;-1 -1;1 -1],true)-LaplaceMatrix([x y;-0.5 0.5;-0.5 -0.5;0.5 -0.5],true),"fro");

% 定义绘图区间
x = linspace(-5, 5, 50);
y = linspace(-5, 5, 50);

% 创建坐标网格
[X, Y] = meshgrid(x, y);

% 计算梯度
len = size(X,1);
Z2 = zeros(len,len);
for i=1:len
    for j=1:len
        Z2(i,j) =  fun2(x(i), y(j));
    end
end



% 绘制梯度图
%[gradX, gradY] = gradient(z, x, y);
% figure;
% quiver(X, Y, -gradX, -gradY);
% xlabel('X');
% ylabel('Y');
% title('Gradient Plot');
% axis tight;
% axis equal;

% 绘制曲面图
figure;
surf(X, Y, Z2);
%contour(X,Y,Z2);
hold on
xlabel('X');
ylabel('Y');
zlabel('Z');
title('SNL Surface Plot');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 绘制曲面图
figure;
surf(X, Y, (Z2+Z1)/2);
%contour(X,Y,Z2);
hold on
xlabel('X');
ylabel('Y');
zlabel('Z');
title('(SNL+L)/2 Surface Plot');
