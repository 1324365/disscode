components = {'emotions', 'stability', 'alertness', 'bored'}; 


for componentIndex = 1:numel(components)
    component = components{componentIndex}; % Get the current component name
    

    interpolatedData = [];
    

    for day = 1:8 % Assuming there are 6 days
        n_samples = 15; % Set n_samples to 15 within the loop

        % Assuming `data` is the same as `Ex`
        Ex = ODESA_APP_DATA(8).activetask(day).(component);

     
        d = Ex(:, 2); % Extracting column 2 of Ex

        interp_meth = 'spline'; % Interpolation method

        idx = 1:length(d);
        int_vec = linspace(min(idx), max(idx), n_samples);

        % Perform spline interpolation on column 2 of Ex
        d_res = interp1(idx, d, int_vec, interp_meth);

  
        d_res = d_res.'; 

        interpolatedData = [interpolatedData; d_res];
    end
    
  
    csv_file_name = [component ''];

    % Write the interpolated data to the corresponding CSV file for the current component
    csvwrite(csv_file_name, interpolatedData);
end
