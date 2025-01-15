clc; clear;

% 读取记录文件
log_file = 'fbp_phantom_liver_slice_512/normalization_log.txt'; % 记录文件路径
save_folder = 'bm3d_liver_images'; % 图像所在文件夹

% 打开日志文件并读取记录
data = readtable(log_file, 'Delimiter', '\t', 'ReadVariableNames', true);
slice_indices = data.Slice_Index; % 读取 Slice 索引
normalization_factors = data.Normalization_Factor; % 读取归一化因子

% 初始化用于保存三维数组的矩阵（根据第一张图片推断大小）
example_image = imread(fullfile(save_folder, sprintf('Phantom_liver_slice_bm3d_%03d.png', slice_indices(1))));
[rows, cols] = size(example_image);
num_slices = length(slice_indices); % 获取切片数
restored_fbp = zeros(rows, cols, num_slices); % 初始化三维数组

% 遍历每个 slice 并还原其值
for i = 1:num_slices
    slice_index = slice_indices(i);
    normalization_factor = normalization_factors(i);
    
    % 如果 normalization_factor 为 0，则当前 slice 全为零
    if normalization_factor == 0
        restored_fbp(:, i, :) = 0;
        continue;
    end
    
    % 读取对应的归一化图像
    image_path = fullfile(save_folder, sprintf('Phantom_liver_slice_bm3d_%03d.png', slice_index));
    slice_uint8 = imread(image_path);
    
    % 图像转换回原始范围并还原
    slice_normalized = double(slice_uint8) / 255; % 从 [0, 255] 回到 [0, 1]
    restored_fbp(:, i, :) = slice_normalized * normalization_factor; % 恢复到原始范围
end
bm3d = restored_fbp;
% 完成还原，restored_fbp 是还原后的三维矩阵
disp('三维数组已成功还原。');
save('BM3D_liver.mat', 'bm3d');

%% 

clc; clear;

% 设置变量路径
log_file = 'fbp_phantom_liver_slice_512/normalization_log.txt'; % 记录文件路径
save_folder = 'N2N_liver_phantom'; % 图像所在文件夹

% 从日志文件读取索引和归一化因子
data = readtable(log_file, 'Delimiter', '\t', 'ReadVariableNames', true);
slice_indices = data.Slice_Index; % 提取切片索引
normalization_factors = data.Normalization_Factor; % 提取归一化因子

% 初始化用于保存三维数组的矩阵（通过第一张图片推断大小）
example_image = imread(fullfile(save_folder, sprintf('Phantom_liver_slice_%03d.png', slice_indices(1))));
[rows, cols, ~] = size(example_image); % 获取行、列大小（JPEG默认为RGB三通道）
num_slices = length(slice_indices); % 切片总数
restored_fbp = zeros(rows, cols, num_slices); % 初始化三维数组，用于存储灰度切片

% 遍历每个切片并还原其值
for i = 1:num_slices
    slice_index = slice_indices(i); % 当前处理切片的索引
    normalization_factor = normalization_factors(i); % 对应切片的归一化因子
    
    % 如果归一化因子为 0，则当前切片全为零
    if normalization_factor == 0
        restored_fbp(:, i, :) = 0; % 第 i 个切片全置零%kindey是(:,:,i), liver是(:,i,:)
        continue; % 跳过当前循环
    end
    
    % 读取切片 RGB 图像
    image_path = fullfile(save_folder, sprintf('Phantom_liver_slice_%03d.png', slice_index));
    slice_uint8 = imread(image_path); 
    
    % 转换为灰度图像
    slice_gray = rgb2gray(slice_uint8); % RGB 转为灰度（单通道）

    % 灰度图像归一化到 [0, 1] 范围
    slice_normalized = double(slice_gray) / 255;
    
    % 恢复到原始范围并存入三维矩阵
    restored_fbp(:, i, :) = slice_normalized * normalization_factor; % 恢复值范围
end

% 输出结果
disp('三维数组已成功还原。');
zsn2n = restored_fbp;
% 如果需要保存结果到工作空间或者 .mat 文件：
save('ZS_N2N_liver_Phantom.mat', 'zsn2n');

%% 

clc; clear;

% 设置变量路径
log_file = 'fbp_phantom_liver_slice_512/normalization_log.txt'; % 记录文件路径
save_folder = 'clean_liver_phantom'; % 图像所在文件夹

% 从日志文件读取索引和归一化因子
data = readtable(log_file, 'Delimiter', '\t', 'ReadVariableNames', true);
slice_indices = data.Slice_Index; % 提取切片索引
normalization_factors = data.Normalization_Factor; % 提取归一化因子

% 初始化用于保存三维数组的矩阵（通过第一张图片推断大小）
example_image = imread(fullfile(save_folder, sprintf('Phantom_liver_slice_%03d.png', slice_indices(1))));
[rows, cols, ~] = size(example_image); % 获取行、列大小（JPEG默认为RGB三通道）
num_slices = length(slice_indices); % 切片总数
restored_fbp = zeros(rows, cols, num_slices); % 初始化三维数组，用于存储灰度切片

% 遍历每个切片并还原其值
for i = 1:num_slices
    slice_index = slice_indices(i); % 当前处理切片的索引
    normalization_factor = normalization_factors(i); % 对应切片的归一化因子
    
    % 如果归一化因子为 0，则当前切片全为零
    if normalization_factor == 0
        restored_fbp(:, i, :) = 0; % 第 i 个切片全置零%kindey是(:,:,i), liver是(:,i,:)
        continue; % 跳过当前循环
    end
    
    % 读取切片 RGB 图像
    image_path = fullfile(save_folder, sprintf('Phantom_liver_slice_%03d.png', slice_index));
    slice_uint8 = imread(image_path); 
    
    % 转换为灰度图像
    slice_gray = rgb2gray(slice_uint8); % RGB 转为灰度（单通道）

    % 灰度图像归一化到 [0, 1] 范围
    slice_normalized = double(slice_gray) / 255;
    
    % 恢复到原始范围并存入三维矩阵
    restored_fbp(:, i, :) = slice_normalized * normalization_factor; % 恢复值范围
end

% 输出结果
disp('三维数组已成功还原。');
zsa2a = restored_fbp;
% 如果需要保存结果到工作空间或者 .mat 文件：
save('ZS_A2A_liver_Phantom.mat', 'zsa2a');
