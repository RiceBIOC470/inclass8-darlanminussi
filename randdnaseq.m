function randomSeq = randdnaseq(N)
% returns a random dna sequence of length N

seq = N; % define sequence length

bases = ['A' 'T' 'G' 'C'];
gen_numbers = randi(numel(bases),[1 seq]);
randomSeq = bases(gen_numbers);

end