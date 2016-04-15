function log_likelihood = compute_likelihood(plaintext, alphabet, letter_p, letter_t)
    p = log(letter_p(alphabet == plaintext(1)));
    for i = 2:length(plaintext)
        j = alphabet == plaintext(i-1);
        k = alphabet == plaintext(i);
        p = p + log(letter_t(k, j));
    end
    log_likelihood = p;
end

