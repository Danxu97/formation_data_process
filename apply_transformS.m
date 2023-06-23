% Ӧ��ƽ�ơ���ת�ͷ����任
function transformed_points = apply_transformS(points, tx, ty, theta, sx, sy)
    % ƽ�Ʊ任
    translated_points = points + [tx, ty];
    
    % ��ת�任
    rotation_matrix = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    rotated_points = (rotation_matrix * translated_points')';
    
    % �����任
    scaled_points = rotated_points .* [sx, sy];
    
    transformed_points = scaled_points;
end