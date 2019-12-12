% ���ͬһ�߶ȵ�Բ��

function [X, Y, Z] = circle_center_fitting(group_nums, c_c_same_height_results_path, output_file_path)

% init X Y Z
X = [];
Y = [];
Z = [];

c_c_same_height_results = load(c_c_same_height_results_path);

for i = 1:group_nums
    for j = 1 : 1

        data = c_c_same_height_results.(strcat('c_c_same_height', num2str(i), '_', num2str(j)));
        [O, R, F] = ff(data');
        %         x = data(:, 1);
        %         y = data(:, 2);
        %         z = data(:, 3);
        %         % ������Ϊ��ʼԲ��
        %         p0=mean(data);
        %         % �Ե����ĵ�ƽ������Ϊ��ʼ�뾶
        %         r=mean(sqrt(sum((data - repmat(p0, [size(data, 1) 1])).^2, 2)));
        %
        %         f=@(p)((x - p(1)).^2+(y - p(2)).^2+(z - p(3)).^2 - p(4).^2);
        %
        %         p=lsqnonlin(f, [p0 r]);
        %
        %         X = [X, p(1)];
        %         Y = [Y, p(2)];
        %         Z = [Z, p(3)];
        X = [X, O(1)];
        Y = [Y, O(2)];
        Z = [Z, O(3)];
    end
    
end

fitting_circle_center = [X', Y', Z'];
save(output_file_path, 'fitting_circle_center');

end
