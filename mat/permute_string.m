function permuted_string = permute_string(s, l1, l2)
    s(s == l1) = '*';
    s(s == l2) = l1;
    s(s == '*') = l2;
    permuted_string = s;
end