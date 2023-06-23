% Ӧ��ƽ�ƺ���ת�任
function transformed_points = apply_transform(points, tx, ty, theta)
    % ƽ�Ʊ任
    translated_points = points + [tx, ty];
    
    % ��ת�任
    rotation_matrix = [cos(theta), -sin(theta); sin(theta), cos(theta)];
    transformed_points = (rotation_matrix * translated_points')';
end