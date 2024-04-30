load(fname, 'ODESA_APP_DATA');

% Manually add data to the 'dailytrace' field for the third participant
Partisipant = 4; % Participant index
TraceNumber = 10; % Trace number (adjust as needed)

% Additional data to be added
additional_data = [
];


ODESA_APP_DATA(Partisipant).activetask(TraceNumber).stability = additional_data;


save(fname, 'ODESA_APP_DATA');
