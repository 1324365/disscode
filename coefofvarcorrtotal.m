% Folder paths
folderPath1 = ''; 
folderPath2 = '';

dataCellArray1 = cell(6, 1);
dataCellArray2 = cell(6, 1);


for day = 1:6

    fileName1 = sprintf('', day);
    fileName2 = sprintf('v', day); 
    filePath1 = fullfile(folderPath1, fileName1);
    filePath2 = fullfile(folderPath2, fileName2);
    
    
    disp(filePath1);
    disp(filePath2);
    
    try
    
        data1 = csvread(filePath1); % Start reading from row 2, column 6
     data2 = csvread(filePath2); % Skip first row
        
   
        dataCellArray1{day} = data1;
        dataCellArray2{day} = data2;
    catch ME
        fprintf('Error reading CSV files for day %d: %s\n', day, ME.message);
        continue; % Skip to the next iteration
    end
    

    fprintf('Successfully read CSV files for day %d\n', day);
end


dataMatrix1 = cell2mat(dataCellArray1);
dataMatrix2 = cell2mat(dataCellArray2);
minSize = min(numel(dataMatrix1), numel(dataMatrix2));


dataMatrix1 = dataMatrix1(1:minSize);
dataMatrix2 = dataMatrix2(1:minSize);


correlationCoeff = corrcoef(dataMatrix1(:), dataMatrix2(:));


fprintf('Correlation coefficient between compiled data from folders 1 and 2: %f\n', correlationCoeff(1, 2));




fprintf('Correlation coefficient between compiled data from folders 1 and 2: %f\n', correlationCoeff(1, 2));
outputFilePath = '';
csvwrite(outputFilePath, correlationCoeff);


[correlationCoeff, pValue] = corr(dataMatrix1(:), dataMatrix2(:));

% Choose significance level (alpha)
alpha = 0.05;


if pValue < alpha
    fprintf('The correlation is statistically significant (p = %f)\n', pValue);
else
    fprintf('The correlation is not statistically significant (p = %f)\n', pValue);
end
