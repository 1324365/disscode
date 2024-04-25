
Partisipant = 5

% Function to extract dimensions from app

%Load path and file
path=('');
cd(path)

fname = 'ODESA_APP_DATA1.mat'
load(fname,"ODESA_APP_DATA")

TET_table=[]
file='gab 153active.xlsx';
TET_table=readcell(file);

%% Daily Trace 

if any(strcmpi(TET_table(:,4),'Wakefulness is a condition of being alert rather than sleepy. '))


% Find idx of each drawing
idx=[];
k =[];
idx=strcmpi(TET_table(:,3), 'Submit rating');
k=find(idx);  %Row of 'Sumit Rating'
length(k)
if length(k)==7
    '6 Dimensions filled'
elseif length(k)>7
    ([num2str(length(k)) ' indexes yielded']) %?
    return
elseif length(k) < 7
    ([num2str(length(k)) ' indexes yielded'])
end

% % Checking correct order
% idx_info=TET_table(k, 4);
% length(idx_info) %Should be 5
% Correct_Order = sum(strcmpi(idx_info, daily_dim_order)) %Should be 5
% if Correct_Order == 5

sidx=strcmpi(TET_table(:,2), 'MENU');
u=find(sidx);

%Initialising struct
dim_struct=struct('wakefulness', [], 'stress', [], 'rumination', [], 'mood', [], 'focus', [], 'bussyness', []);
fn=fieldnames(dim_struct);


% % % % % % 
for i=1:length(k)-1
    idx=(k(i)+1);
    until=(k(i+1)-3);

    v =[]
    v=(TET_table(idx:until, 8));
    v=cell2mat(v);

    n =[]
    n=(TET_table(idx:until, 7));
    n=cell2mat(n)
   % % % % % % 

      %Cleaning values 
    for c=1:length(v)
        if v(c) > 4   
            v(c) = 4;
        elseif v(c) < 0
            v(c) = 0;
        end
    end
    d = [n v] 
    dim_struct.(fn{i})=d;      
end

% Extract Time Stamp 
TimeS =[]
TET_table = cell2table(TET_table);
TimeS = (TET_table((k(1)+1),"TET_table1"));
TimeS = string(TimeS.TET_table1{1,1});
TimeSChars = convertStringsToChars(TimeS);
LTimeSChars = length(TimeSChars);
TimeS = TimeSChars(1:(LTimeSChars)-2);
% TimeS = datetime(TimeS,'InputFormat', 'yyyy-MM-dd HH:mm:ss.SSS','Format','dd-MMM-yyyy HH:mm:ss.SSS');
TET_table = table2cell(TET_table);

%Caculate Trace Number  

TraceNumber =[]


if length(ODESA_APP_DATA(Partisipant).dailytrace(1).wakefulness)==0
    
    TraceNumber = 1

elseif length(ODESA_APP_DATA(Partisipant).dailytrace)<2 && length(ODESA_APP_DATA(Partisipant).dailytrace(1).wakefulness)>0

    TraceNumber = 2

elseif length(ODESA_APP_DATA(Partisipant).dailytrace)>1

    TraceNumber = (length(ODESA_APP_DATA(Partisipant).dailytrace))+1

end 

%Format 
ODESA_APP_DATA(Partisipant).dailytrace(TraceNumber).wakefulness = dim_struct.wakefulness
ODESA_APP_DATA(Partisipant).dailytrace(TraceNumber).bussyness = dim_struct.bussyness
ODESA_APP_DATA(Partisipant).dailytrace(TraceNumber).mood = dim_struct.mood
ODESA_APP_DATA(Partisipant).dailytrace(TraceNumber).rumination = dim_struct.rumination
ODESA_APP_DATA(Partisipant).dailytrace(TraceNumber).focus = dim_struct.focus
ODESA_APP_DATA(Partisipant).dailytrace(TraceNumber).stress = dim_struct.stress


%Saving 
save(fname)
%end
end


%% active
Partisipant = 9
TET_table=[]
file='oli 193active.xlsx';
TET_table=readcell(file);

%% 
if any(strcmpi(TET_table(:,4),'Question 1: How do you feel your performance was across the task?'))

% Find idx of each drawing
idx=[];
k =[];
idx=strcmpi(TET_table(:,3), 'Submit rating');
k=find(idx);  %Row of 'Sumit Rating'
length(k)
if length(k)==9
    '6 Dimensions filled'
elseif length(k)>9
    ([num2str(length(k)) ' indexes yielded']) %?
    return
elseif length(k) < 9
    ([num2str(length(k)) ' indexes yielded'])
end

% % Checking correct order
% idx_info=TET_table(k, 4);
% length(idx_info) %Should be 5
% Correct_Order = sum(strcmpi(idx_info, daily_dim_order)) %Should be 5
% if Correct_Order == 5

sidx=strcmpi(TET_table(:,2), 'MENU');
u=find(sidx);

%Initialising struct
dim_struct=struct('performance', [], 'alertness', [], 'attention', [], 'mindwandering', [], 'effort', [], 'bored', [], 'emotions', [], 'stability', []);
fn=fieldnames(dim_struct);


% % % % % % 
for i=1:length(k)-1
    idx=(k(i)+1);
    until=(k(i+1)-3);

    v =[]
    v=(TET_table(idx:until, 8));
    v=cell2mat(v);

    n =[]
    n=(TET_table(idx:until, 7));
    n=cell2mat(n)
   % % % % % % 

      %Cleaning values 
    for c=1:length(v)
        if v(c) > 4   
            v(c) = 4;
        elseif v(c) < 0
            v(c) = 0;
        end
    end
    d = [n v] 
    dim_struct.(fn{i})=d;      
end

% Extract Time Stamp 
%TimeS =[]
%TET_table = cell2table(TET_table);
%TimeS = (TET_table((k(1)+1),"TET_table1"));
%TimeS = string(TimeS.TET_table1{1,1});
%TimeSChars = convertStringsToChars(TimeS);
%LTimeSChars = length(TimeSChars);
%TimeS = TimeSChars(1:(LTimeSChars)-2);
% TimeS = datetime(TimeS,'InputFormat', 'yyyy-MM-dd HH:mm:ss.SSS','Format','dd-MMM-yyyy HH:mm:ss.SSS');
%TET_table = table2cell(TET_table);

%Caculate Trace Number  

TraceNumber =[]


if length(ODESA_APP_DATA(Partisipant).activetask(1).performance)==0
    
    TraceNumber = 1

elseif length(ODESA_APP_DATA(Partisipant).activetask)<2 && length(ODESA_APP_DATA(Partisipant).activetask(1).performance)>0

    TraceNumber = 2

elseif length(ODESA_APP_DATA(Partisipant).activetask)>1

    TraceNumber = (length(ODESA_APP_DATA(Partisipant).activetask))+1

end 

%Format 
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).performance = dim_struct.performance
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).alertness = dim_struct.alertness
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).attention = dim_struct.attention
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).mindwandering = dim_struct.mindwandering
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).effort = dim_struct.effort
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).emotions = dim_struct.emotions
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).stability = dim_struct.stability
ODESA_APP_DATA(Partisipant).activetask(TraceNumber).bored = dim_struct.bored



%Saving 
save(fname)
%end
end


%% passive

Partisipant = 9
TET_table=[]
file='oli 193passive.xlsx';
TET_table=readcell(file);
%% 
if any(strcmpi(TET_table(:,4),'Trace the clarity of thought across the task.'))

% Find idx of each drawing
idx=[];
k =[];
idx=strcmpi(TET_table(:,3), 'Submit rating');
k=find(idx);  %Row of 'Sumit Rating'
length(k)
if length(k)==9
    '6 Dimensions filled'
elseif length(k)>9
    ([num2str(length(k)) ' indexes yielded']) %?
    return
elseif length(k) < 9
    ([num2str(length(k)) ' indexes yielded'])
end

% % Checking correct order
% idx_info=TET_table(k, 4);
% length(idx_info) %Should be 5
% Correct_Order = sum(strcmpi(idx_info, daily_dim_order)) %Should be 5
% if Correct_Order == 5

sidx=strcmpi(TET_table(:,2), 'MENU');
u=find(sidx);

%Initialising struct
dim_struct=struct('clarity', [], 'emotioncontent', [], 'tone', [], 'timetravel', [], 'selfother', [], 'stability', [], 'boredom', [], 'alertness', []);
fn=fieldnames(dim_struct);


% % % % % % 
for i=1:length(k)-1
    idx=(k(i)+1);
    until=(k(i+1)-3);

    v =[]
    v=(TET_table(idx:until, 8));
    v=cell2mat(v);

    n =[]
    n=(TET_table(idx:until, 7));
    n=cell2mat(n)
   % % % % % % 

      %Cleaning values 
    for c=1:length(v)
        if v(c) > 4   
            v(c) = 4;
        elseif v(c) < 0
            v(c) = 0;
        end
    end
    d = [n v] 
    dim_struct.(fn{i})=d;      
end

% Extract Time Stamp 
TimeS =[]
TET_table = cell2table(TET_table);
TimeS = (TET_table((k(1)+1),"TET_table1"));
TimeS = string(TimeS.TET_table1{1,1});
TimeSChars = convertStringsToChars(TimeS);
LTimeSChars = length(TimeSChars);
TimeS = TimeSChars(1:(LTimeSChars)-2);
% TimeS = datetime(TimeS,'InputFormat', 'yyyy-MM-dd HH:mm:ss.SSS','Format','dd-MMM-yyyy HH:mm:ss.SSS');
TET_table = table2cell(TET_table);

%Caculate Trace Number  

TraceNumber =[]


if length(ODESA_APP_DATA(Partisipant).passive(1).clarity)==0
    
    TraceNumber = 1

elseif length(ODESA_APP_DATA(Partisipant).passive)<2 && length(ODESA_APP_DATA(Partisipant).passive(1).clarity)>0

    TraceNumber = 2

elseif length(ODESA_APP_DATA(Partisipant).passive)>1

    TraceNumber = (length(ODESA_APP_DATA(Partisipant).passive))+1

end 

%Format 
ODESA_APP_DATA(Partisipant).passive(TraceNumber).clarity = dim_struct.clarity
ODESA_APP_DATA(Partisipant).passive(TraceNumber).emotioncontent = dim_struct.emotioncontent
ODESA_APP_DATA(Partisipant).passive(TraceNumber).tone = dim_struct.tone
ODESA_APP_DATA(Partisipant).passive(TraceNumber).timetravel = dim_struct.timetravel
ODESA_APP_DATA(Partisipant).passive(TraceNumber).selfother = dim_struct.selfother
ODESA_APP_DATA(Partisipant).passive(TraceNumber).stability = dim_struct.stability
ODESA_APP_DATA(Partisipant).passive(TraceNumber).boredom = dim_struct.boredom
ODESA_APP_DATA(Partisipant).passive(TraceNumber).alertness = dim_struct.alertness



%Saving 
save(fname)
%end
end

%%  Questionare answers 



Partisipant = 1
TET_table=[]
file='lh750 221pretest.xlsx';
TET_table=readcell(file);


if any(strcmpi(TET_table(:,4), 'Question_3:_How_are_you_feeling_today_in_yourself?')) ...
    || any(strcmpi(TET_table(:,4), 'Question_4:_How_is_your_body_feeling_right_now?'));

    
    idxQ1=strcmpi(TET_table(:,4), 'Question_3:_How_are_you_feeling_today_in_yourself?');
kQ1=find(idxQ1);

idxQ2=strcmpi(TET_table(:,4), 'Question_4:_How_is_your_body_feeling_right_now?');
kQ2=find(idxQ2);

idxQS=strcmpi(TET_table(:,3), 'QuestionnaireAnswers');
kQS=find(idxQS);

    if any(kQS)
SleepQList = cell2mat(TET_table((kQS),[9 10 11 12])')
kSL = find(SleepQList)

TimeofDay =cell2mat(TET_table((kQS),[13 14 15 16])')
kSL2 = find(SleepQList)
    end 

Q1 = kSL

Q2 = kSL2

Q3 = cell2mat(TET_table((kQ1),[5]))

Q4  = cell2mat(TET_table((kQ2),[5]))



TraceNumber =[]

if length(ODESA_APP_DATA(Partisipant).Dailypretest(1).feeling) ==0
    
    TraceNumber = 1

elseif length(ODESA_APP_DATA(Partisipant).Dailypretest)<2 && length(ODESA_APP_DATA(Partisipant).Dailypretest(1).feeling)>0

    TraceNumber = 2

elseif length(ODESA_APP_DATA(Partisipant).Dailypretest) >1

    TraceNumber = (length(ODESA_APP_DATA(Partisipant).Dailypretest))+1

end 


%Format 
ODESA_APP_DATA(Partisipant).Dailypretest(TraceNumber).feeling = Q3
ODESA_APP_DATA(Partisipant).Dailypretest(TraceNumber).body = Q4
ODESA_APP_DATA(Partisipant).Dailypretest(TraceNumber).timeoftaking = Q2
ODESA_APP_DATA(Partisipant).Dailypretest(TraceNumber).sleepquality = Q1

%Saving 
save(fname)
end 
