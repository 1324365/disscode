
mw = []; % Initialize all as an empty array

for i = 1:8
    n_samples =25; % Set n_samples to 90 within the loop

    % Assuming `data` is the same as `Ex`
    Ex = ODESA_APP_DATA(9).activetask(i).performance

    % Assuming `Ex` is a matrix where each column represents a variable
    d = Ex(:, 2); % Extracting column 2 of Ex

    interp_meth = 'spline'; % Interpolation method

    idx = 1:length(d);
    int_vec = linspace(min(idx), max(idx), n_samples);

    % Perform spline interpolation on column 2 of Ex
    d_res = interp1(idx, d, int_vec, interp_meth);

    % Transpose to vertical
    d_res = d_res.'; 

    % Store interpolated values
    mw = [mw; d_res];
end


csv_file_name = '';

% Write the matrix to the CSV file
csvwrite(csv_file_name, mw);



per = []; % Initialize all as an empty array

for i = 1:8
    n_samples =25; % Set n_samples to 90 within the loop

    % Assuming `data` is the same as `Ex`
    Ex = ODESA_APP_DATA(9).activetask(i).mindwandering

    % Assuming `Ex` is a matrix where each column represents a variable
    d = Ex(:, 2); % Extracting column 2 of Ex

    interp_meth = 'spline'; % Interpolation method

    idx = 1:length(d);
    int_vec = linspace(min(idx), max(idx), n_samples);

    % Perform spline interpolation on column 2 of Ex
    d_res = interp1(idx, d, int_vec, interp_meth);

    % Transpose to vertical
    d_res = d_res.'; 

    % Store interpolated values
    per = [per; d_res];
end
csv_file_name = '';

% Write the matrix to the CSV file
csvwrite(csv_file_name, per);
