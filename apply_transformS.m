% 应用平移、旋转和放缩变换
function transformed_points = apply_transformS(points, tx, ty, theta, sx, sy)
    % 平移变换
    translated_points = points + [tx, ty];
    
    % 旋转变换
    rotation_matrix = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    rotated_points = (rotation_matrix * translated_points')';
    
    % 放缩变换
    scaled_points = rotated_points .* [sx, sy];
    
    transformed_points = scaled_points;
end