%% 加载数据的路径
load_path = './data/';
%% 保存实验数据的路径
save_path = './0exps/exp24/';
mkdir(save_path);
%% 关闭现有图窗
close all;
%% 显示各数据及其曲线
displayPath;
displayTraj;
dispalyMotion;
displayff;
displayError;
DisplayRTSError;
%% 显示关键指标
fprintf('tracking time：%f\n',max(times));
fprintf('err_sim：%f\n',err_sim);
fprintf('err_dist1:%f\n',err_dist1);
fprintf('err_dist2:%f\n',err_dist2);
%% 保存现有图窗
figHandles = findall(0, 'Type', 'figure');  % 获取所有图形窗口句柄
for i = 1:length(figHandles)
    fig = figHandles(i);  % 获取当前图形窗口句柄
    saveas(fig, [save_path,'figure', num2str(i)], 'png');  % 保存图形为 PNG 格式，可以根据需要更改格式
end

%% 保存数据
save([save_path,'map.mat'], 'map'); 
% save([save_path,'obs.mat'], 'obs');
% save([save_path,'fpath.mat'], 'formation_path');
% save([save_path,'traj1.mat'], 'traj1');
% save([save_path,'traj2.mat'], 'traj2');
% save([save_path,'traj3.mat'], 'traj3');
% save([save_path,'traj4.mat'], 'traj4');
%% 保存obs
fileID = fopen([save_path,'obs.txt'], 'w');
% 按行写入 .txt 文件
for i = 1:size(obs, 1)
    fprintf(fileID, '%d ', obs(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);

%% 保存fpath formationA*结果
fileID = fopen([save_path,'fpath.txt'], 'w');
% 按行写入 .txt 文件
for i = 1:size(formation_path, 1)
    fprintf(fileID, '%d ', formation_path(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
%% 保存formation teb结果
% 1
fileID = fopen([save_path,'traj1.txt'], 'w');
% 按行写入 .txt 文件
for i = 1:size(traj1, 1)
    fprintf(fileID, '%f ', traj1(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
% 2
fileID = fopen([save_path,'traj2.txt'], 'w');
% 按行写入 .txt 文件
for i = 1:size(traj2, 1)
    fprintf(fileID, '%f ', traj2(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
% 3 
fileID = fopen([save_path,'traj3.txt'], 'w');
% 按行写入 .txt 文件
for i = 1:size(traj3, 1)
    fprintf(fileID, '%f ', traj3(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
% 4
fileID = fopen([save_path,'traj4.txt'], 'w');
% 按行写入 .txt 文件
for i = 1:size(traj4, 1)
    fprintf(fileID, '%f ', traj4(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
