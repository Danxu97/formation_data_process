% ��������
function error = computeErrorS(params, source_points, target_points)
    % ��ȡ����
    tx = params(1);
    ty = params(2);
    theta = params(3);
    sx = params(4);
    sy = params(5);
    
    % Ӧ��ƽ�ơ���ת�ͷ����任
    transformed_points = apply_transformS(source_points, tx, ty, theta, sx, sy);
    
    % ����任��ĵ��Ŀ���֮������
    error = transformed_points - target_points;
end