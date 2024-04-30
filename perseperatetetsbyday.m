
original_csv_file_name = '';


data = readtable(original_csv_file_name);


data_matrix = table2array(data);


group_size = 180;


num_groups = ceil(size(data_matrix, 1) / group_size);

output_folder = 'olimw180_files';
if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end


for i = 1:num_groups
    % Calculate the indices for the current group
    start_index = (i - 1) * group_size + 1;
    end_index = min(i * group_size, size(data_matrix, 1));
    
    % Extract the current group of data points
    current_group = data_matrix(start_index:end_index, :);
    
    % Specify the file name for the current CSV file
    csv_group_file_name = fullfile(output_folder, ['', num2str(i), '.csv']);
    
 
    csvwrite(csv_group_file_name, current_group);
    
    disp(['Data points for group ', num2str(i), ' saved to ', csv_group_file_name]);
end
