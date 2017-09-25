%Inclass assignment 8
%Darlan Conterno Minussi

%Using the swalign function
% A. Create a random DNA sequence of length 100. 

seq1 = randdnaseq(100);

% B. Create a second sequence from the first one by changing the middle 20 basepairs (at positions 41-60)

seq2 = [randseq(40), seq1(41:60), randseq(40)];

% C. run swalign on the two sequences with the default parameters

[score, align, start] = swalign(seq1, seq2); 
disp(score);
disp(align);
disp(start);

% D. run swalign with much higher and lower values of the GapOpen parameter
% and explain the results. 

% the default GapOpen value is 8

[score_lowgap, align_lowgap, start_lowgap] = swalign(seq1, seq2,'Alphabet','nt', 'GapOpen', 1, 'Showscore', true);
[score_highgap, align_highgap, start_highgap] = swalign(seq1, seq2, 'Alphabet','nt','GapOpen', 20, 'Showscore', true);

disp(score_lowgap);
disp(align_lowgap);
disp(start_lowgap);

disp(score_highgap);
disp(align_highgap);
disp(start_highgap);

% Lower gap penalties will favor the insertions of gaps in the sequence
% alignment, higher gap penalties will favor mismatches instead of the
% insertion of gaps. Both behavior are explained by the smith-waterman
% algorithm which will favor the smaller value obtained after testing for
% the score between the matches or the insertion of gaps in either seq1 or
% seq2.


% E. run swalign with a low value of GapOpen but a high value of ExtendGap,
% explain the result

[score_lowgap_highext, align_lowgap_highext, start_lowgap_highext] = swalign(seq1, seq2, 'Alphabet','nt','GapOpen', 1, 'ExtendGap', 20, 'Showscore', true);
disp(score_lowgap_highext);
disp(align_lowgap_highext);
disp(start_lowgap_highext);

% explained below

% F. run swalign align with the default value of GapOpen and a low value
% of ExtendGap and explain the result. 


[score_defaultgap_lowext, align_defaultgap_lowext, start_defaultgap_lowext] = swalign(seq1, seq2, 'Alphabet','nt', 'GapOpen', 8, 'ExtendGap', 1, 'Showscore', true);
disp(score_defaultgap_lowext);
disp(align_defaultgap_lowext);
disp(start_defaultgap_lowext);


% explanation for E and F
% Low gap scores will favor the opening of gaps, however the high extend
% gap score will favor the alignement of mismatches. 
% The default gap value of 8 as seen in the help for swalign function
% together with a low extend gap value will favor the extension of gaps
% whenever there is a gap being opened in the sequence as long as the smith
%-waterman algorithm identifies the extension as a score lower than the
% mismatch pairing of dna bases

