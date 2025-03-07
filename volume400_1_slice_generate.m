clc; clear;

% 加载你的三维数据
load('fbp_400_1.mat'); % 确保文件在工作目录中
fbp = flip(signal_recon, 2);
fbp = permute(fbp, [3, 2, 1]);
fbp = flip(fbp, 2);
fbp = flip(fbp, 1);
fbp(fbp < 0) = 0;
% save('Unprocessed_liver.mat', 'fbp');
% 保存的文件夹和记录文件
save_folder = 'fbp_phantom_liver_slice_400_1'; % 保存图像的文件夹
if ~exist(save_folder, 'dir')
    mkdir(save_folder); % 创建文件夹如果不存在
end
log_file = fullfile(save_folder, 'normalization_log.txt'); % 保存归一化的记录文件

% 打开记录文件
fid = fopen(log_file, 'w'); % 写入模式打开文件
fprintf(fid, 'Slice_Index\tNormalization_Factor\n'); % 写标题

% 确定数据大小
[~, ~, num_slices] = size(fbp); % 三维数据的尺寸
for i = 1:num_slices
    % 提取第 i 个 slice
    slice = squeeze(fbp(:, i, :));%kindey是(:,:,i), liver是(:,i,:)
    
    % 计算最大值
    max_val = max(slice(:));
    
    % 如果最大值为 0，跳过（防止除以 0 的问题）
    if max_val == 0
        warning(['Slice ', num2str(i), ' 中全为零，将跳过归一化和保存。']);
        fprintf(fid, '%d\t%.6f\n', i, 0); % 保存最大值为 0 的记录
        continue;
    end
    
    % 最大值归一化
    slice_normalized = slice / max_val; % 归一化到 [0, 1]
    slice_uint8 = uint8(slice_normalized * 255); % 转换为 uint8 保存
    
    % 保存图片
    save_path = fullfile(save_folder, sprintf('Phantom_liver_slice_%03d.png', i)); % 构建保存路径
    imwrite(slice_uint8, save_path); % 保存为 PNG
    
    % 记录最大值
    fprintf(fid, '%d\t%.6f\n', i, max_val); % 写入记录文件
end

% 关闭文件
fclose(fid);

% 提示完成
disp(['所有 Slice 已保存，并在 ', log_file, ' 中记录了归一化信息。']);