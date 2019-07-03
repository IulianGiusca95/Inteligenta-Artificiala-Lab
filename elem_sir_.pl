% Giusca Iulian 242
% 17.3.2016

% Am aflat in mod recursiv cine sunt Sn-1 si Sn-2 apoi, aplicand conditiile, am stabilit cine este S

% sir(+Nr,-S) : Nr este al catalea termen al sirului se doreste a fi calculat, iar S returneaza valoarea termenului
sir(0,2).
sir(1,5).
sir(N,S):-number(N),N>=2, N1 is N-1, N2 is N-2, sir(N1,S1), sir(N2,S2),(S1>S2, S2=\=0,S is S1 div S2;S is S1+S2).

/* Exemple de interogari

| ?- sir(2,X).                                         
X = 2 ? y
yes
| ?- sir(3,X).
X = 7 ? y
yes
| ?- sir(4,X).
X = 3 ? y
yes
| ?- sir(5,X).
X = 10 ? y
yes
| ?- sir(-1,X).
no

*/