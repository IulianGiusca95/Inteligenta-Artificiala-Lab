nr(N):- N<10, write(N),nl, N1 is N+1, nr(N1).

scrie_1_N(Fisier) :- %se va da calea fisierului
telling(Output_curent), % ca sa salvam intr-o variabila stream-ul curent de output
tell(Fisier), % deschide fisierul dat prin calea respectiva

\+ (nr(0)), 

told, % Inchide fisierul
tell(Output_curent).%revine la fostul stream de output
