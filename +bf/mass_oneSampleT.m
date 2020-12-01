function b = mass_oneSampleT(data)

% runs Bayes factor one-sample t-test for multiple tests

% collapse over dimensions
dimensions = size(data);
data = data(:,:);

% cycle through each test
b = zeros(size(data,2),1);
for i = 1 : size(data,2)
    
    % get Bayes factor
    b(i) = bf.ttest(data(:,i));
    
    % update user
    if mod(i,5000) == 0
        fprintf('Bayes estimatation %1.1f%% complete\n',100.*(i./size(data,2)));
    end
end

% reshape output
b = reshape(b,dimensions(2:end));
