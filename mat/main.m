cd('/Users/phil/Google Drive/classes/6.437J/project/mat')
load('example_cipher.mat')      % Load example
load('language_parameters.mat') % Load parameters

n_letters = length(ciphertext); 
% n_iters = 10000;
likelihood = zeros(1, 1);
acceptance = zeros(1, 1);
accuracy = zeros(1, 1);
decoded = ciphertext(1:n_letters);

done = zeros(1,1);
i = 0
while done == 0
    i = i + 1; 
    switch1 = randi([1,length(alphabet)]);
    switch2 = randi([1,length(alphabet)]);
    while switch1 == switch2
        switch2 = randi([1,length(alphabet)]);
    end
    candidate = permute_string(decoded, alphabet(switch1), alphabet(switch2));
    l1 = compute_likelihood(decoded, alphabet, letter_probabilities, letter_transition_matrix);
    likelihood(i) = l1 / n_letters;
    
    l2 = compute_likelihood(candidate, alphabet, letter_probabilities, letter_transition_matrix);
    t = min(1, exp(l2 - l1));
    
    a = unifrnd(0,1);
    if a<t
        acceptance(i) = 1;
        decoded = candidate;
    else
        acceptance(i) = 0;
    end
    accuracy(i) = sum(decoded == plaintext(1:n_letters)) / n_letters;
    
    if accuracy(i) == 1
        done = 1;
    end
    if mod(i, 100) == 0
        disp(decoded)
    end
end



figure

% Plot the acceptance rate over time
subplot(3,1,1) 
plot(log(tsmovavg(acceptance,'s',300)))
axis([0,inf,-inf,0])
xlabel('Iteration number')
ylabel('Log-acceptance rate')
title('Acceptance rate at each iteration')


 
% Plot the likelihood of the cipher over time
subplot(3,1,2)
plot(likelihood)
axis([0,inf,-inf,0])
xlabel('Iteration number')
ylabel('Log-likelihood of cipher / number of letters')
title('Log-likelihood of cipher per iteration')


% Plot the accuracy
subplot(3,1,3) 
plot(accuracy)
axis([0,inf,0,1])
xlabel('Iteration number')
ylabel('Accuracy')
title('Accuracy of cipher per iteration')

print('summary','-dpng')


