% Folder paths
folderPath1 = '/Users/laurahurn/Desktop/diss/data/active /ali/alimw25_files'; 
folderPath2 = '/Users/laurahurn/Desktop/diss/data/active /ali/aliper25_files';
% Preallocate cell arrays to store data from each day
dataCellArray1 = cell(6, 1);
dataCellArray2 = cell(6, 1);

% Loop through each day
for day = 1:6
    % Construct file paths for the two sets of data for the current day
    fileName1 = sprintf('mw25_alibyday_%d.csv', day);
    fileName2 = sprintf('per25_alibyday_%d.csv', day); % Assuming file names are in the format dais225final1_001.csv, dais225final1_002.csv, etc.
    filePath1 = fullfile(folderPath1, fileName1);
    filePath2 = fullfile(folderPath2, fileName2);
    
    % Print file paths for debugging
    disp(filePath1);
    disp(filePath2);
    
    try
        % Read data from the CSV files
        data1 = csvread(filePath1); % Start reading from row 2, column 6
     data2 = csvread(filePath2); % Skip first row
        
        % Store the data in cell arrays
        dataCellArray1{day} = data1;
        dataCellArray2{day} = data2;
    catch ME
        fprintf('Error reading CSV files for day %d: %s\n', day, ME.message);
        continue; % Skip to the next iteration
    end
    
    % Add debugging output to indicate successful reading of the files
    fprintf('Successfully read CSV files for day %d\n', day);
end

% Concatenate data from cell arrays into matrices
dataMatrix1 = cell2mat(dataCellArray1);
dataMatrix2 = cell2mat(dataCellArray2);
minSize = min(numel(dataMatrix1), numel(dataMatrix2));

% Trim the matrices to the minimum size
dataMatrix1 = dataMatrix1(1:minSize);
dataMatrix2 = dataMatrix2(1:minSize);

% Compute correlation coefficient
correlationCoeff = corrcoef(dataMatrix1(:), dataMatrix2(:));

% Display the correlation coefficient
fprintf('Correlation coefficient between compiled data from folders 1 and 2: %f\n', correlationCoeff(1, 2));

% Compute correlation coefficient

% Display the correlation coefficient
fprintf('Correlation coefficient between compiled data from folders 1 and 2: %f\n', correlationCoeff(1, 2));
outputFilePath = '/Users/laurahurn/Desktop/diss/data/active /ali/totalcorr_per_mw.csv';
csvwrite(outputFilePath, correlationCoeff);

% Compute correlation coefficient and p-value
[correlationCoeff, pValue] = corr(dataMatrix1(:), dataMatrix2(:));

% Choose significance level (alpha)
alpha = 0.05;

% Check for significance
if pValue < alpha
    fprintf('The correlation is statistically significant (p = %f)\n', pValue);
else
    fprintf('The correlation is not statistically significant (p = %f)\n', pValue);
end
