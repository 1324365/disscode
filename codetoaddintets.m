load(fname, 'ODESA_APP_DATA');

% Manually add data to the 'dailytrace' field for the third participant
Partisipant = 4; % Participant index
TraceNumber = 10; % Trace number (adjust as needed)

% Additional data to be added
additional_data = [
];

% Assign the additional data to the corresponding fields in the 'dailytrace' field
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).stability = additional_data;

% Save the modified data
save(fname, 'ODESA_APP_DATA');
