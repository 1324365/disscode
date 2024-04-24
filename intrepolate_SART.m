per = []; % Initialize all as an empty array

n_samples = 1440; % Change n_samples to 1980 within the loop

% Load the new data source (assuming it's stored in a CSV file)
data = readmatrix('', 'NumHeaderLines', 1); % Skip the first line (header)

% Extract response times from column 10
response_times = data(:, 10);

% Check for NaN values and remove them
response_times = response_times(~isnan(response_times));

% Interpolation method
interp_method = 'spline';

if numel(response_times) >= 2 % Ensure enough sample points for interpolation
    % Perform interpolation
    idx = 1:length(response_times);
    int_vec = linspace(min(idx), max(idx), n_samples);
    interpolated_response_times = interp1(idx, response_times, int_vec, interp_method);

    % Transpose to vertical
    interpolated_response_times = interpolated_response_times';

    % Store interpolated values
    per = [per; interpolated_response_times];
    
    % Write the matrix to the CSV file
    csv_file_name = '';
    writematrix(per, csv_file_name);
else
    disp('Error: Not enough sample points for interpolation.');
end
