% Define folder paths for the two sets of data
folderPath1 = '/Users/laurahurn/Desktop/diss/data/active /gabs/mw 180'; % Update with the actual folder path
folderPath2 = '/Users/laurahurn/Desktop/diss/data/active /gabs/t'; % Update with the actual folder path

% Create a matrix to store correlation coefficients for each day
correlationMatrix = NaN(10, 1);

% Loop through each day
for day = 1:10
    % Construct file paths for the two sets of data for the current day
    fileName1 = sprintf('mw_gab_180_%03d.csv', day); % Assuming file names are in the format per_tetgab180_001.csv, per_tetgab180_002.csv, etc.
    fileName2 = sprintf('interpolated_response_time180_%d.csv', day); % Assuming file names are in the format interpolated_response_time180_1.csv, interpolated_response_time180_2.csv, etc.
    filePath1 = fullfile(folderPath1, fileName1);
    filePath2 = fullfile(folderPath2, fileName2);
    
    try
        % Read data from the CSV files
        data1 = csvread(filePath1); % Start reading from row 2
        data2 = csvread(filePath2); 
        
        % Compute correlation coefficient
        correlationCoeff = corrcoef(data1, data2);
        
        % Store the correlation coefficient for the current day
        correlationMatrix(day) = correlationCoeff(1, 2);
    catch ME
        % Display error message if file reading fails
        disp(['Error reading files for day ', num2str(day), ': ', ME.message]);
    end
end

% Save the correlation matrix to a CSV file
outputFilePath = '/Users/laurahurn/Desktop/diss/data/active /gabs/mwxRTcorrelation_results.csv';
csvwrite(outputFilePath, correlationMatrix);

% Plot the correlations
figure;
plot(1:10, correlationMatrix, '-o'); % Changed from 1:11 to 1:10 as there are 10 days
xlabel('Day');
ylabel('Correlation Coefficient');
title('Correlation between per and response time for each pair of days');
grid on;
