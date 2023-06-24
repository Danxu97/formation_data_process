% 定义初始变换参数
tx0=0;
ty0=0;
theta0=0;
sx0 = 0;
sy0 = 0;
%编队导航期间每时刻的ff值
error=[];

%% 加载轨迹
teb1 = load([load_path,'traj1.txt']);
teb2 = load([load_path,'traj2.txt']);
teb3 = load([load_path,'traj3.txt']);
teb4 = load([load_path,'traj4.txt']);
%% 运动模拟
o1 = [];
o2 = [];
o3 = [];
o4 = [];
times = [teb1(end,7),teb2(end,7),teb3(end,7),teb4(end,7)];
for t = 0:0.2:max(times)
    [x1,y1,yaw1] = getStfromTraj(teb1,t);o1(end+1,:)=[x1,y1,yaw1];
    [x2,y2,yaw2] = getStfromTraj(teb2,t);o2(end+1,:)=[x2,y2,yaw2];
    [x3,y3,yaw3] = getStfromTraj(teb3,t);o3(end+1,:)=[x3,y3,yaw3];
    [x4,y4,yaw4] = getStfromTraj(teb4,t);o4(end+1,:)=[x4,y4,yaw4];
end
% 目标点
target_point=[o1(1,1:2);o2(1,1:2);o3(1,1:2);o4(1,1:2)];
initial_params = [tx0; ty0; theta0;sx0;sy0]; % 平移参数和旋转角度


for t = 1:length(o1)  
    x1=o1(t,1);
    y1=o1(t,2);
    x2=o2(t,1);
    y2=o2(t,2);
    x3=o3(t,1);
    y3=o3(t,2);
    x4=o4(t,1);
    y4=o4(t,2);
    
    source_points = [x1,y1;x2,y2;x3,y3;x4,y4];
    % 定义非线性最小二乘函数
    fun = @(params) computeErrorS(params, source_points, target_points);
    % 使用 lsqnonlin 求解非线性最小二乘问题
    initial_params = lsqnonlin(fun, initial_params);
    error(end+1) = sum(vecnorm(fun(initial_params), 2, 2));
end
figure();
plot(0:0.2:max(times),error)
xlabel("t/s");
ylabel("error");
err_dist2 = sum(error)/size(error,2);