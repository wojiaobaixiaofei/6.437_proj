function decoded = decipher(cipher, ciphertext)
    key = invert_cipher(cipher);
    decoded = arrayfun(@(x) key(x), ciphertext);
end

function inverted_cipher = invert_cipher(cipher)
    inverted = containers.Map(values(cipher), keys(cipher));
    inverted_cipher = inverted;
end

