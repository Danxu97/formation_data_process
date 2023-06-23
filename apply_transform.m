% 应用平移和旋转变换
function transformed_points = apply_transform(points, tx, ty, theta)
    % 平移变换
    translated_points = points + [tx, ty];
    
    % 旋转变换
    rotation_matrix = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    transformed_points = (rotation_matrix * translated_points')';
end