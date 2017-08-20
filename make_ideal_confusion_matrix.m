function ideal_matrix = make_ideal_confusion_matrix(confusion_matrix)
% This function simulate an ideal confusion matrix in which there is no
% confusions. That is, the ideal confusion matrix is a diagonal matrix.

% number of stimulus
number_of_stimuli = length(confusion_matrix);
% sample of n observations
n = sum(sum(confusion_matrix,2));

% frequency of stimuli
f_s = zeros(1,number_of_stimuli);

for row = 1:number_of_stimuli
    f_s(row) = sum(confusion_matrix(row,:))/n;
end

ideal_matrix = diag(f_s);
end