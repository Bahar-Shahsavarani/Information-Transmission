clear;clc;

% read the file name of confusion matrices as csv files
fileNames = dir('*.csv');

% number of confusion matrices
num_files = length(fileNames);

% save transmitted information for each confusion matrix
information = zeros(1,num_files);

% save 
information_ideal = zeros(1,num_files);


for file = 1:num_files
    % read confusion matrix
    confusion_matrix = csvread(fileNames(file).name);
    
    % the max possible transmitted information for each confusion matrix;
    % this can be used for normalizationthis matrix is used for
    % normalizatio
    ideal_confusion_matrix = make_ideal_confusion_matrix(confusion_matrix);
    
    % compute transmitted information of the confusion matrix
    T = information_transmitted(confusion_matrix);
    
    % compute the max possible transmitted information of the confusion
    % matirx
    T_max = information_transmitted(ideal_confusion_matrix);
    
    % relative information transmitted
    information(file) = T/T_max * 100;
end

