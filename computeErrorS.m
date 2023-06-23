% 计算误差函数
function error = computeErrorS(params, source_points, target_points)
    % 获取参数
    tx = params(1);
    ty = params(2);
    theta = params(3);
    sx = params(4);
    sy = params(5);
    
    % 应用平移、旋转和放缩变换
    transformed_points = apply_transformS(source_points, tx, ty, theta, sx, sy);
    
    % 计算变换后的点和目标点之间的误差
    error = transformed_points - target_points;
end