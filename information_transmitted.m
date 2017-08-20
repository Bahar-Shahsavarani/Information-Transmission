function information = information_transmitted(confusion_matrix)
% This function measures the covariance of the output (response) and
% input(stimulus), which is called information transmitted from stimulus to
% response in bits per stimulus (Miller and Nicely, 1955).

% number of stimulus
number_of_stimuli = length(confusion_matrix);

% sample of n observations
n = sum(sum(confusion_matrix,2));

% frequency of stimuli
f_s = zeros(1,number_of_stimuli);

for row = 1:number_of_stimuli
    f_s(row) = sum(confusion_matrix(row,:))/n;
end

% frequency of responses
f_r = zeros(1,number_of_stimuli);

for column = 1:number_of_stimuli
    f_r(column) = sum(confusion_matrix(:,column))/n;
end

% temporary information transmission
T = 0;
for i = 1:number_of_stimuli
    for j =1:number_of_stimuli
        if (confusion_matrix(i,j) == 0) || (f_s(i) == 0) || (f_r(j) == 0)
            T = T + 0;
        else
            T = -(confusion_matrix(i,j)/n) * log2((f_s(i)*f_r(j))/...
                (confusion_matrix(i,j)/n)) + T;
        end
    end
end
 information = T;
end