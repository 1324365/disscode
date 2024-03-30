% Specify the file name for the original CSV file
original_csv_file_name = 'mw_oli_180.csv';

% Read data from the original CSV file
data = readtable(original_csv_file_name);

% Convert the table to a numeric matrix
data_matrix = table2array(data);

% Number of data points in each group
group_size = 180;

% Determine the number of groups
num_groups = ceil(size(data_matrix, 1) / group_size);

% Create a folder to store the group CSV files
output_folder = 'olimw180_files';
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

% Loop through each group of data points and write to a new CSV file
for i = 1:num_groups
    % Calculate the indices for the current group
    start_index = (i - 1) * group_size + 1;
    end_index = min(i * group_size, size(data_matrix, 1));
    
    % Extract the current group of data points
    current_group = data_matrix(start_index:end_index, :);
    
    % Specify the file name for the current CSV file
    csv_group_file_name = fullfile(output_folder, ['mw180_alibyday_', num2str(i), '.csv']);
    
    % Write the current group to a new CSV file
    csvwrite(csv_group_file_name, current_group);
    
    disp(['Data points for group ', num2str(i), ' saved to ', csv_group_file_name]);
end
