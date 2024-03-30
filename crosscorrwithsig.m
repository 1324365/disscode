% Define folder path for the dataset
folderPath = '/Users/laurahurn/Desktop/diss/data/passive/dias'; % Update with the actual folder path

% Define the list of file names
fileNames = {'stability_tetdais_15.csv', 'alertness_tetdais_15.csv', ...
             'boredom_tetdais_15.csv', 'clarity_tetdais_15.csv', ...
             'emotioncontent_tetdais_15.csv', 'selfother_tetdais_15.csv', ...
             'tone_tetdais_15.csv', 'timetravel_tetdais_15.csv'};

% Initialize a cell array to store data for each component
numComponents = numel(fileNames);
componentData = cell(1, numComponents);

% Read data from CSV files for each component
for component = 1:numComponents
    % Construct file path for the current component
    filePath = fullfile(folderPath, fileNames{component});
    
    % Read data from CSV file
    componentData{component} = csvread(filePath);
end

% Define significance level (alpha)
alpha = 0.05;

% Initialize cross-correlation matrix and p-values matrix
crossCorrMatrix = zeros(numComponents);
pValuesMatrix = zeros(numComponents);

% Compute cross-correlation matrix and p-values
for i = 1:numComponents
    for j = 1:numComponents
        % Check if both components have the same length
        if numel(componentData{i}) == numel(componentData{j})
            % Compute correlation coefficient using corr
            [correlationCoeff, pValue] = corr(componentData{i}, componentData{j});
            
            % Store correlation coefficient and p-value
            crossCorrMatrix(i, j) = correlationCoeff;
            pValuesMatrix(i, j) = pValue;
        else
            % If the lengths are not equal, set the correlation coefficient and p-value to NaN
            crossCorrMatrix(i, j) = NaN;
            pValuesMatrix(i, j) = NaN;
        end
    end
end

% Open a file to write raw correlation coefficients
fid = fopen('raw_correlation_coefficientdais.txt', 'w');

% Write raw correlation coefficients to the file
fprintf(fid, 'Raw Correlation Coefficients:\n');
for i = 1:numComponents
    for j = 1:numComponents
        if ~isnan(crossCorrMatrix(i, j))
            fprintf(fid, '%s,%s,%.4f\n', fileNames{i}, fileNames{j}, crossCorrMatrix(i, j));
        end
    end
end

% Close the file
fclose(fid);

% Display cross-correlation matrix with p-values
disp('Cross-Correlation Matrix:');
disp(crossCorrMatrix);

disp('P-values Matrix:');
disp(pValuesMatrix);

% Display cross-correlation matrix as a heatmap with significant p-values annotations
figure;
imagesc(crossCorrMatrix);
colorbar;
title('Cross-Correlation Matrix');
xlabel('Components');
ylabel('Components');
xticklabels(fileNames);
yticklabels(fileNames);
xtickangle(90);

% Add significant p-value annotations
for i = 1:numComponents
    for j = 1:numComponents
        if pValuesMatrix(i, j) < alpha && ~isnan(pValuesMatrix(i, j)) && pValuesMatrix(i, j) > 0
            pValueFormatted = sprintf('%.2e', pValuesMatrix(i, j)); % Format p-value using scientific notation with 2 decimal places
            text(j, i, pValueFormatted, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'w'); % Display formatted p-value
        end
    end
end

saveas(gcf, 'total_plotfinal.png');
