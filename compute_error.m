% ��������
function error = compute_error(params, source_points, target_points)
    % ��ȡ����
    tx = params(1);
    ty = params(2);
    theta = params(3);
    
    % Ӧ��ƽ�ƺ���ת�任
    transformed_points = apply_transform(source_points, tx, ty, theta);
    
    % ����任��ĵ��Ŀ���֮������
    error = transformed_points - target_points;
end