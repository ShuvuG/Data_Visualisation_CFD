% Polynomial curve fitting across all values 
% Labelling data points 
% A polynomial fit can help draw surface and contour plan 
 
%% 
clear 
close all 
set(0,'DefaultFigureColormap',feval('jet')); % set default colormap to Jet 
 
% Import data from excel file 
Table_Import = readtable('TEMA optimisation Analysis.xlsx','Sheet','Sheet2'); 
Table_Import1 = readtable('TEMA optimisation Analysis.xlsx','Sheet','Sheet3'); 
 
% Point to note - Excel has changed the values of Heat Transfer coeecient 
% to make them column identifiers? 
 
X= table2array(Table_Import); % Convert Table to Array 
Y= table2array(Table_Import1); % Convert Table to Array 
 
 
%% 
% Define dataset 
Y1=Y(:,1); 
Y2=Y(:,2); 
Y3=Y(:,3); 
Heat= X(:,1); 
Cost=X(:,3); 
Pressure=X(:,4); 
scatter(Heat, Cost) 
 
% Seperate data points according to the middle iteration layer 
idx=find(strcmp(Y1,'E' )); 
Heat_1=Heat(idx); 
Cost_1=Cost(idx); 
Pressure_1=Pressure(idx); 
figure 
scatter3(Heat_1, Cost_1, Pressure_1,'filled','red') 
 
hold on 
idx1=find(strcmp(Y1,'F' )); 
Heat_2=Heat(idx1); 
Cost_2=Cost(idx1); 
Pressure_2=Pressure(idx1); 
scatter3(Heat_2, Cost_2, Pressure_2,'filled','blue') 
 
hold on 
idx2=find(strcmp(Y1,'G' )); 
Heat_3=Heat(idx2); 
Cost_3=Cost(idx2); 
Pressure_3=Pressure(idx2); 
scatter3(Heat_3, Cost_3, Pressure_3,'filled','black') 
 
hold on 
idx=find(strcmp(Y1,'H' )); 
Heat_1=Heat(idx); 
Cost_1=Cost(idx); 
Pressure_1=Pressure(idx); 
scatter3(Heat_1, Cost_1, Pressure_1,'filled','green') 
 
hold on 
idx1=find(strcmp(Y1,'J' )); 
Heat_2=Heat(idx1); 
Cost_2=Cost(idx1); 
Pressure_2=Pressure(idx1); 
scatter3(Heat_2, Cost_2, Pressure_2,'filled','magenta') 
 
hold on 
idx2=find(strcmp(Y1,'I' )); 
Heat_3=Heat(idx2); 
Cost_3=Cost(idx2); 
Pressure_3=Pressure(idx2); 
scatter3(Heat_3, Cost_3, Pressure_3,'filled','cyan') 
 
hold on 
idx=find(strcmp(Y1,'K' )); 
Heat_1=Heat(idx); 
Cost_1=Cost(idx); 
Pressure_1=Pressure(idx); 
scatter3(Heat_1, Cost_1, Pressure_1,'filled','yellow') 
 
hold on 
idx1=find(strcmp(Y2,'X' )); 
Heat_2=Heat(idx1); 
Cost_2=Cost(idx1); 
Pressure_2=Pressure(idx1); 
scatter3(Heat_2, Cost_2, Pressure_2,'filled') 
 
xlim([15 140]) % Set limit on x-axis 
ylim([1750 95000]) % Set limit on y-axis 
zlim([0.01 0.108]) % Set limit on z-axis 
 
% To extract labels of the associated data points 
Y1=Y(:,1); 
Y2=Y(:,2); 
Y3=Y(:,3); 
Ee=strcat(Y3, Y1, Y2); 
 
% % Labelling the po 
% dx = 0.1; dy = 0.1; % displacement so the text does not overlay the data points 
% text(Heat_3+dx, Cost_3+dy, Pressure_3, Ee(:)); 
 
 
% Simple plot using poylfit 
Heat_Range=15:2:137; 
whos Heat_Range 
Cost_Range=1500:129:9480; 
whos Cost_Range 
p2=polyfitn([Heat_3, Cost_3], Pressure_3,2); % 4th order model 
Pressure_Range=polyvaln(p2, [Heat_Range(:), Cost_Range(:)]); 
hold on 
%plot3(Heat_Range,Cost_Range,Pressure_Range) 
xlabel("Heat Coeffecient") 
ylabel("Cost") 
zlabel("Pressure") 
hold off 
 
%% 
% Seperate data points according to the first iteration layer 
 
idx=find(strcmp(Y3,'B' )); 
Heat_1=Heat(idx); 
Cost_1=Cost(idx); 
Pressure_1=Pressure(idx); 
figure 
scatter3(Heat_1, Cost_1, Pressure_1,'filled','red') 
 
hold on 
idx1=find(strcmp(Y3,'A' )); 
Heat_2=Heat(idx1); 
Cost_2=Cost(idx1); 
Pressure_2=Pressure(idx1); 
scatter3(Heat_2, Cost_2, Pressure_2,'filled','blue') 
 
hold on 
idx2=find(strcmp(Y3,'C' )); 
Heat_3=Heat(idx2); 
Cost_3=Cost(idx2); 
Pressure_3=Pressure(idx2); 
scatter3(Heat_3, Cost_3, Pressure_3,'filled','black') 
 
hold on 
idx=find(strcmp(Y3,'D' )); 
Heat_1=Heat(idx); 
Cost_1=Cost(idx); 
Pressure_1=Pressure(idx); 
scatter3(Heat_1, Cost_1, Pressure_1,'filled','green') 
 
hold on 
idx1=find(strcmp(Y3,'N' )); 
Heat_2=Heat(idx1); 
Cost_2=Cost(idx1); 
Pressure_2=Pressure(idx1); 
scatter3(Heat_2, Cost_2, Pressure_2,'filled','magenta') 
hold off 
 
%% 
% Seperate data points according to the middle iteration layer 
  
idx=find(strcmp(Y2,'M' )); 
Heat_1=Heat(idx); 
Cost_1=Cost(idx); 
Pressure_1=Pressure(idx); 
figure 
scatter3(Heat_1, Cost_1, Pressure_1,'filled','red') 
 
hold on 
idx1=find(strcmp(Y2,'L' )); 
Heat_2=Heat(idx1); 
Cost_2=Cost(idx1); 
Pressure_2=Pressure(idx1); 
scatter3(Heat_2, Cost_2, Pressure_2,'filled','blue') 
 
hold on 
idx2=find(strcmp(Y2,'N' )); 
Heat_3=Heat(idx2); 
Cost_3=Cost(idx2); 
Pressure_3=Pressure(idx2); 
scatter3(Heat_3, Cost_3, Pressure_3,'filled','black') 
 
xlim([15 140]) % Set limit on x-axis 
ylim([17250 95000]) % Set limit on y-axis 
zlim([0.01 0.108]) % Set limit on z-axis 
 
%% 
% Polynomial fit coeffecient 
% Holding aside a random part of the training data 
iterations=10; 
Order=5; 
Mean=zeros(Order,1); 
Error1=zeros(iterations,1); 
% Mesh function to plot polynomial functions 
figure 
XMesh=15:1:137; 
YMesh=17250:637:94965; 
ZMesh=zeros(numel(XMesh),1); 
for j=1:Order, 
    for i=1:iterations, 
        Heat_randlist= randperm(length(Heat_3)); 
        Cost_randlist=randperm(length(Cost_3)); 
        test=Heat_randlist(1:10); 
        train=Heat_randlist(11:end); 
        test1=Cost_randlist(1:10); 
        train1=Cost_randlist(11:end); 
 
        % fit model to train data 
        p=polyfitn([Heat_3(train),Cost_3(train1)], Pressure_3(train),j); % linear model 
        % Asses the linear model test data 
        Error1(i)=sum((Pressure_3(test)-polyvaln(p, [Heat_3(test), Cost_3(test)])).^2)/numel(test); 
        ZMesh=polyvaln(p,[XMesh(:), YMesh(:)]); 
        scatter3(Heat_3, Cost_3, Pressure_3) 
        hold on 
        plot3(XMesh, YMesh, ZMesh) 
    end; 
    Mean(j)=mean(Error1); 
    Error=zeros(iterations,1); 
    ZMesh=zeros(numel(XMesh),1); 
end; 
 
 
