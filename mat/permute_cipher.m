
function permuted_cipher = permute_cipher(cipher, letter1, letter2)
    
    permuted = containers.Map(keys(cipher), values(cipher));
    old1 = cipher(letter1);
    old2 = cipher(letter2);
    
    permuted(letter1) = old2;
    permuted(letter2) = old1;
    
    permuted_cipher = permuted;
end