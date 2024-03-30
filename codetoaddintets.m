load(fname, 'ODESA_APP_DATA');

% Manually add data to the 'dailytrace' field for the third participant
Partisipant = 4; % Participant index
TraceNumber = 10; % Trace number (adjust as needed)

% Additional data to be added
additional_data = [
0.105024	1.231389
0.166923	1.205462
0.307647	1.092071
0.420477	1.010215
0.515991	1.016481
0.609011	1.100541
0.704039	1.232106
0.794486	1.379701
0.879396	1.518495
0.961437	1.637574
1.040479	1.725932
1.116727	1.783367
1.188958	1.806221
1.265115	1.792015
1.341385	1.72927
1.421037	1.6047
1.495892	1.456535
1.567659	1.309217
1.638675	1.181393
1.711478	1.06004
1.871021	0.83609
1.949583	0.736562
2.027404	0.657037
2.095117	0.611269
2.163529	0.596725
2.234246	0.629036
2.300447	0.738738
2.36126	0.946595
2.423708	1.204031
2.493911	1.450516
2.564038	1.641957
2.636651	1.778383
2.707926	1.869824
2.77582	1.936833
2.842983	1.975914
2.913019	1.987417
3.057696	1.880816
3.132825	1.750974
3.213319	1.601966
3.294143	1.447958
3.379985	1.292469
3.4659	1.153982
3.549271	1.031712
3.625488	0.930531
3.693152	0.865822
3.758114	0.838097
3.815541	0.85021
3.87064	0.911371
3.922939	1.022533
3.974336	1.163105];

% Assign the additional data to the corresponding fields in the 'dailytrace' field
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).stability = additional_data;

% Save the modified data
save(fname, 'ODESA_APP_DATA');