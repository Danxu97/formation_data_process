map = load([load_path,'map.txt']);
path = load([load_path,'path.txt']);
formation_path = load([load_path,'fpath.txt']);


path1=formation_path(1:4:end,:);
path2=formation_path(2:4:end,:);
path3=formation_path(3:4:end,:);
path4=formation_path(4:4:end,:);
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
% 绘制路径
for i = 1 : size(path1, 1)
    temp = path1(i, :);
    fill([temp(1)-1, temp(1), temp(1), temp(1)-1],...
        [temp(2)-1, temp(2)-1, temp(2), temp(2)], 'r', 'handlevisibility', 'off','EdgeColor',"none");
end
for i = 1 : size(path2, 1)
    temp = path2(i, :);
    fill([temp(1)-1, temp(1), temp(1), temp(1)-1],...
        [temp(2)-1, temp(2)-1, temp(2), temp(2)], 'g', 'handlevisibility', 'off','EdgeColor',"none");
end
for i = 1 : size(path3, 1)
    temp = path3(i, :);
    fill([temp(1)-1, temp(1), temp(1), temp(1)-1],...
        [temp(2)-1, temp(2)-1, temp(2), temp(2)], 'b', 'handlevisibility', 'off','EdgeColor',"none");
end
for i = 1 : size(path4, 1)
    temp = path4(i, :);
    fill([temp(1)-1, temp(1), temp(1), temp(1)-1],...
        [temp(2)-1, temp(2)-1, temp(2), temp(2)], 'm', 'handlevisibility', 'off','EdgeColor',"none");
end