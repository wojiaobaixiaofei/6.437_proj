load('example_cipher.mat')      % Load example
load('language_parameters.mat') % Load parameters

c = cipher(alphabet, cipher_function);

decode(ciphertext, c)