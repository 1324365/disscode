components = {'emotions', 'stability', 'alertness', 'bored'}; % List of components

% Loop over each component
for componentIndex = 1:numel(components)
    component = components{componentIndex}; % Get the current component name
    
    % Initialize an empty array to store interpolated data for all days
    interpolatedData = [];
    
    % Loop over each day
    for day = 1:8 % Assuming there are 6 days
        n_samples = 15; % Set n_samples to 15 within the loop

        % Assuming `data` is the same as `Ex`
        Ex = ODESA_APP_DATA(8).activetask(day).(component);

        % Assuming `Ex` is a matrix where each column represents a variable
        d = Ex(:, 2); % Extracting column 2 of Ex

        interp_meth = 'spline'; % Interpolation method

        idx = 1:length(d);
        int_vec = linspace(min(idx), max(idx), n_samples);

        % Perform spline interpolation on column 2 of Ex
        d_res = interp1(idx, d, int_vec, interp_meth);

        % Transpose to vertical
        d_res = d_res.'; 

        % Append interpolated values for the current day to the matrix
        interpolatedData = [interpolatedData; d_res];
    end
    
    % Construct CSV file name for the current component
    csv_file_name = [component ''];

    % Write the interpolated data to the corresponding CSV file for the current component
    csvwrite(csv_file_name, interpolatedData);
end
