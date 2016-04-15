load('example_cipher.mat')      % Load example
load('language_parameters.mat') % Load parameters

sub = ciphertext(1:500);

cipher_function = cipher_function(randperm(length(cipher_function)))

c1 = cipher(alphabet, cipher_function);

for i = 1:5000
    switch1 = randi([1,length(alphabet)]);
    switch2 = randi([1,length(alphabet)]);
    while switch1 == switch2
        switch2 = randi([1,length(alphabet)]);
    end
    c2 = permute_cipher(c1, alphabet(switch1), alphabet(switch2));
    t = compare_ciphers(c1, c2, sub, alphabet, letter_probabilities, letter_transition_matrix);
    a = unifrnd(0,1);
    if a<t
        c1 = containers.Map(keys(c2), values(c2));
    end
end

for i = 1:2000
    switch1 = randi([1,length(alphabet)]);
    switch2 = randi([1,length(alphabet)]);
    while switch1 == switch2
        switch2 = randi([1,length(alphabet)]);
    end
    c2 = permute_cipher(c1, alphabet(switch1), alphabet(switch2));
    t = compare_ciphers(c1, c2, ciphertext, alphabet, letter_probabilities, letter_transition_matrix);
    a = unifrnd(0,1);
    if a<t
        c1 = containers.Map(keys(c2), values(c2));
    end
end

