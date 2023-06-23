file_path = './0exps/exp3/';
load([file_path,'fpath.mat']);
load([file_path,'traj1.mat']);
load([file_path,'traj2.mat']);
load([file_path,'traj3.mat']);
load([file_path,'traj4.mat']);

%% 保存fpath formationA*结果
fileID = fopen('fpath.txt', 'w');
% 按行写入 .txt 文件
for i = 1:size(formation_path, 1)
    fprintf(fileID, '%d ', formation_path(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
%% 保存formation teb结果
% 1
fileID = fopen('traj1.txt', 'w');
% 按行写入 .txt 文件
for i = 1:size(traj1, 1)
    fprintf(fileID, '%f ', traj1(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
% 2
fileID = fopen('traj2.txt', 'w');
% 按行写入 .txt 文件
for i = 1:size(traj2, 1)
    fprintf(fileID, '%f ', traj2(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
% 3 
fileID = fopen('traj3.txt', 'w');
% 按行写入 .txt 文件
for i = 1:size(traj3, 1)
    fprintf(fileID, '%f ', traj3(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
% 4
fileID = fopen('traj4.txt', 'w');
% 按行写入 .txt 文件
for i = 1:size(traj4, 1)
    fprintf(fileID, '%f ', traj4(i, :));  % 根据需要的格式化字符串进行调整
    fprintf(fileID, '\n');  % 换行
end
fclose(fileID);
