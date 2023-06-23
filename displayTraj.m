% clc;
% clear;
% close all;
%load data
%% 加载地图、路径、轨迹
map = load([load_path,'map.txt']);
path = load([load_path,'path.txt']);
formation_path = load([load_path,'fpath.txt']);

path1=formation_path(1:4:end,:);
path2=formation_path(2:4:end,:);
path3=formation_path(3:4:end,:);
path4=formation_path(4:4:end,:);

traj1 = load([load_path,'traj1.txt']);
traj2 = load([load_path,'traj2.txt']);
traj3 = load([load_path,'traj3.txt']);
traj4 = load([load_path,'traj4.txt']);
%%画出地图
figure("Name","地图");
a=size(map,1);
b=size(map,2);
axes('GridLineStyle',"none",'GridAlpha',0.8);
axis equal;

hold on;
grid on;
axis([0,a+2,0,b+2]);
set(gca,'xtick',0:10:a+2,'ytick',0:10:b+2);

obs = zeros(1,2);

%找到障碍物
for i=1:a
    for j=1:b
        if(~map(i,j)) 
                obs(end+1, :) = [i,j];
                hold on;
        end
    end
end

% 绘制障碍物
for i = 1 : size(obs, 1)
    temp = obs(i, :);
    fill([temp(1)-1, temp(1), temp(1), temp(1)-1],...
        [temp(2)-1, temp(2)-1, temp(2), temp(2)], 'k', 'handlevisibility', 'off','EdgeColor',"none");
end
hold on;
%% 绘制轨迹：指向车的运动方向
N = max([size(traj1,1),size(traj2,1),size(traj3,1),size(traj4,1)]);
%plot(traj1(1,1),traj1(1,2), 'g*');
%quiver(traj1(1,1),traj1(1,2),cos(traj1(1,3)),sin(traj1(1,3)),'b');
x1=traj1(:,1).*20;
y1=traj1(:,2).*20;
len1 = vecnorm(traj1(:,4:6), 2, 2);
u1=cos(traj1(:,3)).*len1;
v1=sin(traj1(:,3)).*len1;
quiver(x1,y1,u1,v1,'r');

x2=traj2(:,1).*20;
y2=traj2(:,2).*20;
len2 = vecnorm(traj2(:,4:6), 2, 2);
u2=cos(traj2(:,3)).*len2;
v2=sin(traj2(:,3)).*len2;
quiver(x2,y2,u2,v2,'g');

x3=traj3(:,1).*20;
y3=traj3(:,2).*20;
len3 = vecnorm(traj3(:,4:6), 2, 2);
u3=cos(traj3(:,3)).*len3;
v3=sin(traj3(:,3)).*len3;
quiver(x3,y3,u3,v3,'b');

x4=traj4(:,1).*20;
y4=traj4(:,2).*20;
len4 = vecnorm(traj4(:,4:6), 2, 2);
u4=cos(traj4(:,3)).*len4;
v4=sin(traj4(:,3)).*len4;
quiver(x4,y4,u4,v4,'m');

axis equal;
%% 绘制速度曲线图
figure();
% robot1
subplot(2,2,1);
% 添加左侧的y轴标签
yyaxis left;
plot(traj1(:,7),traj1(:,4),'Color','r','LineWidth',2);hold on;
yyaxis left;
plot(traj1(:,7),traj1(:,5),'Color','b','LineWidth',2);hold on;
ylabel('v(m/s)');
% 添加右侧的y轴标签
yyaxis right;
ylabel('w(rad/s)');
plot(traj1(:,7),traj1(:,6),'Color','g','LineWidth',2);
xlabel('t(s)');
legend('vx','vy','w');
title('robot1');
% robot2
subplot(2,2,2);
% 添加左侧的y轴标签
yyaxis left;
plot(traj2(:,7),traj2(:,4),'Color','r','LineWidth',2);hold on;
yyaxis left;
plot(traj2(:,7),traj2(:,5),'Color','b','LineWidth',2);hold on;
ylabel('v(m/s)');
% 添加右侧的y轴标签
yyaxis right;
plot(traj2(:,7),traj2(:,6),'Color','g','LineWidth',2);
ylabel('w(rad/s)');
xlabel('t(s)');
legend('vx','vy','w');
title('robot2');
%robot3
subplot(2,2,3);
% 添加左侧的y轴标签
yyaxis left;
plot(traj3(:,7),traj3(:,4),'Color','r','LineWidth',2);hold on;
yyaxis left;
plot(traj3(:,7),traj3(:,5),'Color','b','LineWidth',2);hold on;
ylabel('v(m/s)');
% 添加右侧的y轴标签
yyaxis right;
plot(traj3(:,7),traj3(:,6),'Color','g','LineWidth',2);
ylabel('w(rad/s)');
xlabel('t(s)');
legend('vx','vy','w');
title('robot3');
%robot4
subplot(2,2,4);
% 添加左侧的y轴标签
yyaxis left;
plot(traj4(:,7),traj4(:,4),'Color','r','LineWidth',2);hold on;
yyaxis left;
plot(traj4(:,7),traj4(:,5),'Color','b','LineWidth',2);hold on;
ylabel('v(m/s)');
% 添加右侧的y轴标签
yyaxis right;
plot(traj4(:,7),traj4(:,6),'Color','g','LineWidth',2);
ylabel('w(rad/s)');
xlabel('t(s)');
legend('vx','vy','w');
title('robot4');