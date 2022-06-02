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
                     
                    filename = d(i).name;

                    title(d(i).name)
                                 
                    snapnow
                    close all
                end
                
                save filenames.mat filename
            catch
                continue
            end
            
        end
    end
end
        



