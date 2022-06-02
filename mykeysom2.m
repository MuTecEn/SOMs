%function y=mykeysom(x)
% Solve a Clustering Problem with a Self-Organizing Map
% Script generated by Neural Clustering app
% Created 30-May-2022 11:37:28
%
% This script assumes these variables are defined:
%
%   b - input data.

x = b';

% Create a Self-Organizing Map
dimension1 = 10;
dimension2 = 10;
net = selforgmap([dimension1 dimension2]);

% Train the Network
[net,tr] = train(net,x);


% Test the Network
y = net(x);

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotsomtop(net)
%figure, plotsomnc(net)

[rows,columns] = size(y);
pos = net.layers{1}.positions;
[l,m] = size(pos);
figure, plotsomnd(net, x)

for j=1:rows
for k=1:columns
    val = y(j,k);
    load('filenames.mat','d');
    if val == 1
        point = [j,k];
        test = j;
        n = d(k).name;
        [filepath,name,ext] = fileparts(n);
        n = name;
                
        for w=1
        for z=test
            val2 = pos([w,w+1],z); 
            text(val2(1),val2(2),0,n,'FontSize',2)
        end
        end
    end
        
        
        
end

end

                






           






%figure, plotsomplanes(net)
%figure, plotsomhits(net,x)
%figure, plotsompos(net,x)

