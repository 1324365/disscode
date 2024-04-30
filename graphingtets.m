
trial1 = ODESA_APP_DATA(1).activetask(1).performance;
trial2 = ODESA_APP_DATA(1).activetask(2).performance;
trial4 = ODESA_APP_DATA(1).activetask(3).performance;
trial5 = ODESA_APP_DATA(1).activetask(4).performance;
trial6 = ODESA_APP_DATA(1).activetask(5).performance;
trial7 = ODESA_APP_DATA(1).activetask(6).performance;
trial8 = ODESA_APP_DATA(1).activetask(7).performance;
trial9 = ODESA_APP_DATA(1).activetask(8).performance;
trial10 = ODESA_APP_DATA(1).activetask(9).performance;
trial11 = ODESA_APP_DATA(1).activetask(10).performance;
trial12 = ODESA_APP_DATA(1).activetask(11).performance;


allData = [trial1; trial2; trial3; trial4; trial5; trial6; trial7; trial8; trial9; trial10; trial11; trial12]; % Update this line to include all trials


categoricalColors = {'red', 'green', 'blue', 'yellow', 'cyan', 'magenta', 'orange', 'pink', 'purple', 'brown', 'gray', 'black'}; % Example categorical colors for 12 trials


trialIndices = [ones(size(trial1, 1), 1); 2*ones(size(trial2, 1), 1); 3*ones(size(trial3, 1), 1); 4*ones(size(trial4, 1), 1); 5*ones(size(trial5, 1), 1); 6*ones(size(trial6, 1), 1); 7*ones(size(trial7, 1), 1); 8*ones(size(trial8, 1), 1); 9*ones(size(trial9, 1), 1); 10*ones(size(trial10, 1), 1); 11*ones(size(trial11, 1), 1); 12*ones(size(trial12, 1), 1)]; % Update this line with the appropriate indices for all trials


categoricalColors = categorical(categoricalColors);


scatter(allData(:, 1), allData(:, 2), [], categoricalColors(trialIndices), 'filled');


title('Scatter Plot with Different Trials');
xlabel('X-axis');
ylabel('Y-axis');
