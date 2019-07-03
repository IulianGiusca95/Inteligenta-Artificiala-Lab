%citeste_fis_r(+Fisin)
citeste_fis_r(Fisin):- seeing(Input_curent),
                       see(Fisin),
                       repeat,
                         read(X),
                           (X==end_of_file
                           ;
                           write(X),nl,fail),
                       !,
                       seen,
                       see(Input_curent).

citeste_fis_chr_redir(Fisin):-seeing(Input_curent),
                       see(Fisin),
                       repeat,
                         get_char(X),
                           (X==end_of_file
                           ;
                           write(X),fail),
                       !,
                       seen,
                       see(Input_curent).