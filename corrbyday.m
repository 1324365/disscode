% Define folder paths for the two sets of data
folderPath1 = ''; 
folderPath2 = ''; 


correlationMatrix = NaN(10, 1);

% Loop through each day
for day = 1:10

    fileName1 = sprintf('', day); 
    fileName2 = sprintf('', day); 
    filePath1 = fullfile(folderPath1, fileName1);
    filePath2 = fullfile(folderPath2, fileName2);
    
    try
  
        data1 = csvread(filePath1);
        data2 = csvread(filePath2); 
        
    
        correlationCoeff = corrcoef(data1, data2);
        
 
        correlationMatrix(day) = correlationCoeff(1, 2);
    catch ME

        disp(['Error reading files for day ', num2str(day), ': ', ME.message]);
    end
end


outputFilePath = '';
csvwrite(outputFilePath, correlationMatrix);


figure;
plot(1:10, correlationMatrix, '-o'); 
xlabel('Day');
ylabel('Correlation Coefficient');
title('Correlation between per and response time for each pair of days');
grid on;
