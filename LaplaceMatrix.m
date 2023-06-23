function L = LaplaceMatrix(pose_array,SN)
%UNTITLED 根据位置计算拉普拉斯矩阵
%   此处显示详细说明
%Adjacecy and Degree
% pose_array = [x y;-3 3;-3 -3;3 -3];
tr = size(pose_array,1);
Adj = zeros(tr,tr);
Deg = zeros(1,tr);
for i=1:tr
    for j=1:tr
        Adj(i,j) = norm(pose_array(i,:) - pose_array(j,:));
        Deg(i) = Deg(i) + Adj(i,j);
    end
end
L = Deg - Adj;

%Symmetric Normalized Laplacian
if(SN==true)
    L =zeros(tr,tr);
    for i = 1:tr
        for j = 1:tr
            if(i==j)
                L(i,j) = 1;
            else
                L(i,j) = -Adj(i,j)*power(Deg(i),-0.5)*power(Deg(j),-0.5);
            end
        end
    end
end
end

