function cipher_out = cipher(alphabet, cipher_fun)
    c = containers.Map;
    for n = 1:length(alphabet)
        c(alphabet(n)) = cipher_fun(n);
    end
    cipher_out = c;
end
