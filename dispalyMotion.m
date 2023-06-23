% clc;
% clear;
% close all;
%load data
% 加载地图、路径、轨迹
displayGif = false;
% displayGif = true;

map = load([load_path,'map.txt']);

teb1 = load([load_path,'traj1.txt']);
teb2 = load([load_path,'traj2.txt']);
teb3 = load([load_path,'traj3.txt']);
teb4 = load([load_path,'traj4.txt']);
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
%% 运动模拟
o1 = [];
o2 = [];
o3 = [];
o4 = [];
i=1;
times = [teb1(end,7),teb2(end,7),teb3(end,7),teb4(end,7)];
for t = 0:0.2:max(times)
    [x1,y1,yaw1] = getStfromTraj(teb1,t);o1(end+1,:)=[x1,y1,yaw1];
    [x2,y2,yaw2] = getStfromTraj(teb2,t);o2(end+1,:)=[x2,y2,yaw2];
    [x3,y3,yaw3] = getStfromTraj(teb3,t);o3(end+1,:)=[x3,y3,yaw3];
    [x4,y4,yaw4] = getStfromTraj(teb4,t);o4(end+1,:)=[x4,y4,yaw4];
    plot(o1(:,1).*20,o1(:,2).*20,'r','LineWidth',1);
    plot(o2(:,1).*20,o2(:,2).*20,'g','LineWidth',1);
    plot(o3(:,1).*20,o3(:,2).*20,'b','LineWidth',1);
    plot(o4(:,1).*20,o4(:,2).*20,'m','LineWidth',1);
    line([o1(end,1).*20, o2(end,1).*20],[o1(end,2).*20, o2(end,2).*20],'color',[1-t/max(times),1-t/max(times),1-t/max(times)],'LineStyle','--');%1-2
    line([o2(end,1).*20, o3(end,1).*20],[o2(end,2).*20, o3(end,2).*20],'color',[1-t/max(times),1-t/max(times),1-t/max(times)],'LineStyle','--');%2-3
    line([o3(end,1).*20, o4(end,1).*20],[o3(end,2).*20, o4(end,2).*20],'color',[1-t/max(times),1-t/max(times),1-t/max(times)],'LineStyle','--');%3-4
    line([o4(end,1).*20, o1(end,1).*20],[o4(end,2).*20, o1(end,2).*20],'color',[1-t/max(times),1-t/max(times),1-t/max(times)],'LineStyle','--');%4-1
    %hold on;    
    if(displayGif)
        drawnow
        print(['.\gif\p',num2str(i)],'-dpng');   %保存图片
    else
        hold on;  
    end
    
    i=i+1;
end

%% 图片播放
if(displayGif)
    GifName = [save_path,'example.gif'];  %动图名字
    delay = 0.1;              %图片之间延迟
    for i = 1:length(o1)       
        A = imread(['.\gif\p',num2str(i),'.png']); %读取图片
        [X, map] = rgb2ind(A, 256);            %彩色图像转化成索引图像
        if i == 1
            imwrite(X, map, GifName, 'gif', 'LoopCount', inf, 'DelayTime', delay)
        else
            imwrite(X, map, GifName, 'gif', 'WriteMode', 'append', 'DelayTime', delay)
            end
    end
end