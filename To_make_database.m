

% Building ODESA APP database  

for i = 1:300

ODESA_APP_DATA(i).DailyTrace =struct('Time', [],'Wakefulness', [], 'Emotions', [], 'Anxiety', [], 'Busyness', [], 'Attention', []);

ODESA_APP_DATA(i).DriveTrace =struct('Time', [],'Performance', [], 'Wakefulness', [], 'Effort', [], 'Emotions', [], 'Rumination', [], 'Mind', []);

ODESA_APP_DATA(i).DriveQ =struct('Time', [],'Regular', [], 'Passengers', [], 'Listen', [], 'Affect', [], 'Attention', [], 'How_Long', [], 'Purpose', []);

ODESA_APP_DATA(i).DailyQ =struct('Time', [],'Into_Bed', [], 'Out_Bed', [], 'CPAP', [], 'Sleep_Rating',[]);

end 