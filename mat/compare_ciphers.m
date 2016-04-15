function acceptance_rate = compare_ciphers(current, proposed, ciphertext, alphabet, letter_p, letter_t)
    l1 = test_cipher(current, ciphertext, alphabet, letter_p, letter_t);
    l2 = test_cipher(proposed, ciphertext, alphabet, letter_p, letter_t);
    l_ratio = exp(l2 - l1);
    acceptance_rate = min(1,l_ratio);
end