% 定义初始变换参数
tx0=0;
ty0=0;
theta0=0;

%编队导航期间每时刻的ff值
error=[];
% 目标点
target_point=[0.5 2.0;0.5 1.0; 1.5 1.0; 1.5 2.0];
initial_params = [tx0; ty0; theta0]; % 平移参数和旋转角度
%% 加载轨迹
formation_path = load('fpath.txt');
path1=formation_path(1:4:end,:).*0.05;
path2=formation_path(2:4:end,:).*0.05;
path3=formation_path(3:4:end,:).*0.05;
path4=formation_path(4:4:end,:).*0.05;

%% 计算误差
for t = 1:length(path1)  
    x1=path1(t,1);
    y1=path1(t,2);
    x2=path2(t,1);
    y2=path2(t,2);
    x3=path3(t,1);
    y3=path3(t,2);
    x4=path4(t,1);
    y4=path4(t,2);
    
    source_points = [x1,y1;x2,y2;x3,y3;x4,y4];
    % 定义非线性最小二乘函数
    fun = @(params) compute_error(params, source_points, target_points);
    % 使用 lsqnonlin 求解非线性最小二乘问题
    initial_params = lsqnonlin(fun, initial_params);
    error(end+1) = sum(vecnorm(fun(initial_params), 2, 2));
end
figure();
plot(error)
xlabel("num");
ylabel("error");
err_sum = sum(error)