% 计算误差函数
function error = compute_error(params, source_points, target_points)
    % 获取参数
    tx = params(1);
    ty = params(2);
    theta = params(3);
    
    % 应用平移和旋转变换
    transformed_points = apply_transform(source_points, tx, ty, theta);
    
    % 计算变换后的点和目标点之间的误差
    error = transformed_points - target_points;
end