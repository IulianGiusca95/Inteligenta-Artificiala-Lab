%Giusca Iulian 242
%18.4.2016

/* Idee:Am un predicat dinamic unde voi retine lista de elemente simple. Pe masura de cescopar un element simplu, il adaug in lista.
Parcurg elementul X dat ca parametru pana cand ajung la un element simplu. daca nu e lista vida, il adaug in lista de solutii la final
*/

:-dynamic lista/1.

%descomp_list(+X,-L)
descomp_list(X,L):- retractall(lista(_)),assert(lista([])),verifica(X),retract(lista(L)).


verifica([]).
verifica(X):-simple(X), X \== [], retract(lista(Lv)),adauga_final(Lv,X,Ln),assert(lista(Ln)).
verifica([H|T]):-verifica(H), verifica(T).

adauga_final([],X,[X]).
adauga_final([H|T],X,Ln):-adauga_final(T,X,Ln1),Ln=[H|Ln1].

/*Exemple de interogari
| ?-  descomp_list([1,[[2,3,[4,[5,[]],6,7],8],9],[[[[]]]],[3],1,[],[[2,[3,[4,[5,[[[]]],0],0]]]],10],L),write('Lista descompusa: '),write(L).
Lista descompusa: [1,2,3,4,5,6,7,8,9,3,1,2,3,4,5,0,0,10]
L = [1,2,3,4,5,6,7,8,9,3|...] ? y
yes
| ?- descomp_list([[1],[2,3,[4,5]]],L).
L = [1,2,3,4,5] ? y
yes
| ?- descomp_list([[1],[2]],L).
L = [1,2] ? y
yes
| ?
*/