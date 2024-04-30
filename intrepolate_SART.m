per = [];

n_samples = 1440; % Change n_samples to 1980 within the loop


data = readmatrix('', 'NumHeaderLines', 1); % Skip the first line (header)

% Extract response times from column x
response_times = data(:, x);


response_times = response_times(~isnan(response_times));

% Interpolation method
interp_method = 'spline';

if numel(response_times) >= 2 % Ensure enough sample points for interpolation
    % Perform interpolation
    idx = 1:length(response_times);
    int_vec = linspace(min(idx), max(idx), n_samples);
    interpolated_response_times = interp1(idx, response_times, int_vec, interp_method);

    interpolated_response_times = interpolated_response_times';

    % Store interpolated values
    per = [per; interpolated_response_times];
    
   
    csv_file_name = '';
    writematrix(per, csv_file_name);
else
    disp('Error: Not enough sample points for interpolation.');
end
