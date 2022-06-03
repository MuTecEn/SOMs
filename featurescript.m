mirverbose(0)
close all

b=[]; 
filenames = {};

[b,filenames] = recurse(b,filenames);

maxb = max(b,[],2); % Maximum value for each song
b = b./repmat(maxb,[1,size(b,2)]); % Normalising with respect to this max value

save('export.mat','matfile','b','filenames');


function [b,filenames] = recurse(b,filenames)
d = dir;

    for i = 3:length(d)
        if d(i).isdir
            disp('/////////////////')
            d(i).name
            cd(d(i).name);
            [b,filenames] = recurse(b,filenames)
            cd ..
        else
            try
                if strcmp(d(i).name(end-3:end), '.mid')
                    m = readmidi(d(i).name);
                    
                    m = setvalues(m,'dur',1); % duration needs to be positive to work
                    %figure
                    odistance = onsetdist(m,4,'fig');
                                     
                    b=[b; odistance'];
                    filenames{end+1} = d(i).name;

                    %title(d(i).name)

                    %save([num2str(d(i).name) '.mat'],'odistance')
                
                    %snapnow
                    %close all
                end
                
                 
            catch
                continue
            end
        end
    end
end

        



