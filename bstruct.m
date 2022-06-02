clear
PathName = uigetdir;
file_all = dir(fullfile(PathName,'*.mat'));
matfile = file_all([file_all.isdir] == 0); 
clear file_all PathName

x=[];                               
for i=1:length(matfile)
    x=[x; load(matfile(i).name)];
end

b=[];
for j=1:length(x)
    b=[b;x(j, 1).odistance.'];
end

FileName = [matfile(i,1).name(1:end-9),'.mat'];
save(FileName,'matfile','x','b');