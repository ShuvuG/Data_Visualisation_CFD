% PCA analysis to perform orthogonal regression 
 
clear 
close all 
set(0,'DefaultFigureColormap',feval('jet')); % set default colormap to Jet 
 
% Directly relevant to data visualisation: 
% https://www.youtube.com/watch?v=7WqWoEKUdQY 
% https://www.youtube.com/channel/UC-A3RB9zleSwKGYBdBcV8lw/videos 
% https://www.youtube.com/watch?v=QuAiA1jaee0 
 
% Import data from excel file 
Table_Import = readtable('TEMA optimisation Analysis.xlsx','Sheet','Sheet2'); 
whos Table_Import 
Table_Import1 = readtable('TEMA optimisation Analysis.xlsx','Sheet','Sheet3'); 
whos Table_Import1 
 
% Point to note - Excel has changed the values of Heat Transfer coeecient 
% to make them column identifiers? 
 
X= table2array(Table_Import); % Convert Table to Array 
whos X 
Y= table2array(Table_Import1); % Convert Table to Array 
whos Y 
 
figure; hist(X(:,1)); % initial histogram to see data distribution 
figure; hist(X(:,2)); % initial histogram to see data distribution 
figure; hist(X(:,3)); % initial histogram to see data distribution 
figure; hist(X(:,4)); % initial histogram to see data distribution 
 
Eigen=X'*X; 
whos Eigen 
 
[W, lambda] = eig(Eigen) % Principal component analysis using eigen decomposition 
whos W 
whos lambda 
 
% Reorder W matrix 
W=W(:,end:-1:1) 
lambda=lambda(:,end:-1:1) 
 
% Singular Value decomposition to identify V vector 
[U,sigma,V]=svd(X); 
V_r=V(:,1:2); % truncating to take 1st 2 components 
a=X*V_r; 
 
figure; plot(a(:,1),a(:,2),'.'); %scatter plot 
 
sv = diag(sigma) 
figure; stairs(cumsum(sv)/sum(sv)) % to see how the 2 principal components represent the available data 
Y1=Y(:,1); 
whos Y1 
Y2=Y(:,2); 
whos Y2 
Y3=Y(:,3); 
whos Y3 
 
% Proof that only the middle value provides the optimisation effect 
 
% Incorporate Labels (middle part only) 
figure; scatter(a(1:119,1),a(1:119,2),20, categorical(Y1)); %scatter plot 
colorbar('Ticks',[1,2,3,4,5,6,7,8], ... 
    'TickLabels',{'E','F','G','H','J','I','K','X'}) 
xlabel("PC1") 
ylabel("PC2") 
title("Impact of Iteration II on TEMA CFD Simulation Results" ) 
 
% Incorporate Labels (first part only) 
figure; scatter(a(1:119,1),a(1:119,2),20, categorical(Y3)); %scatter plot 
colorbar('Ticks',[1,2,3,4,5], ... 
    'TickLabels',{'B','A','C','D','N'}) 
 
% Incorporate Labels (last part only) 
figure; scatter(a(1:119,1),a(1:119,2),20, categorical(Y2)); %scatter plot 
colorbar('Ticks',[1,2,3], ... 
    'TickLabels',{'M','L','N'}) 
 
% Incorporate Labels (middle part only) 
figure; scatter(a(1:119,1),20, categorical(Y1)); %scatter plot 
colorbar('Ticks',[1,2,3,4,5,6,7,8], ... 
    'TickLabels',{'E','F','G','H','J','I','K','X'}) 
 
