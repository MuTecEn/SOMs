mirverbose(0)
close all

recurse();


function recurse()
d = dir;

    for i = 3:length(d)
        if d(i).isdir
            disp('/////////////////')
            d(i).name
            cd(d(i).name);
            recurse();
            cd ..
        else
            try
                if strcmp(d(i).name(end-3:end), '.mid')
                    m = readmidi(d(i).name);
                    
                    m = setvalues(m,'dur',1); % duration needs to be positive to work
                    figure
                    odistance = onsetdist(m,4,'fig');
                                     
                    title(d(i).name)

                    save(['C:\Users\user\Desktop\MIDI\mono' ...
                       num2str(d(i).name) '.mat'],'odistance')
                
                    snapnow
                    close all
                end
                
                 
            catch
                continue
            end
        end
    end
end
        



