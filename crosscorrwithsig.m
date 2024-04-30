
folderPath = ''; 


fileNames = {};


numComponents = numel(fileNames);
componentData = cell(1, numComponents);


for component = 1:numComponents
    % Construct file path for the current component
    filePath = fullfile(folderPath, fileNames{component});
    
 
    componentData{component} = csvread(filePath);
end


alpha = 0.05;


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


fid = fopen('', 'w');


fprintf(fid, 'Raw Correlation Coefficients:\n');
for i = 1:numComponents
    for j = 1:numComponents
        if ~isnan(crossCorrMatrix(i, j))
            fprintf(fid, '%s,%s,%.4f\n', fileNames{i}, fileNames{j}, crossCorrMatrix(i, j));
        end
    end
end


fclose(fid);


disp('Cross-Correlation Matrix:');
disp(crossCorrMatrix);

disp('P-values Matrix:');
disp(pValuesMatrix);


figure;
imagesc(crossCorrMatrix);
colorbar;
title('Cross-Correlation Matrix');
xlabel('Components');
ylabel('Components');
xticklabels(fileNames);
yticklabels(fileNames);
xtickangle(90);

for i = 1:numComponents
    for j = 1:numComponents
        if pValuesMatrix(i, j) < alpha && ~isnan(pValuesMatrix(i, j)) && pValuesMatrix(i, j) > 0
            pValueFormatted = sprintf('%.2e', pValuesMatrix(i, j)); % Format p-value using scientific notation with 2 decimal places
            text(j, i, pValueFormatted, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'w'); % Display formatted p-value
        end
    end
end

saveas(gcf, 'total_plotfinal.png');
