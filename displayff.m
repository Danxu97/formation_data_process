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

%编队导航期间每时刻的ff值
ff=[];
SNL_target = LaplaceMatrix([0.5 2.0;0.5 1.0; 1.5 1.0; 1.5 2.0],true);
for t = 1:length(o1)  
    x1=o1(t,1);
    y1=o1(t,2);
    x2=o2(t,1);
    y2=o2(t,2);
    x3=o3(t,1);
    y3=o3(t,2);
    x4=o4(t,1);
    y4=o4(t,2);
    SNL_current = LaplaceMatrix([x1 y1;x2 y2;x3 y3;x4 y4],true);
    ff(end+1) = norm(SNL_target-SNL_current,"fro");
end
figure();
plot(0:0.2:max(times),ff)
xlabel("t/s");
ylabel("ff");
%% 计算编队相似性误差
err_sim = sum(ff)/size(ff,2);