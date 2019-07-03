%Giusca Iulian 242
%24.04.2016

/*Idee: Am folosit un predicat dinamic care incrementa de fiecare data cand gasea un element divizibil cu valoarea data*/

%lungime(+Lista,-Lungime Lista)
lungime(L,Nr):-length(L,Nr).


:-dynamic nr_elem/1.

%Predicat principal
%nr_elem(+Lista,+Elementul,-NrElem)
nr_elem(L,Divizor,NrElem):-retractall(nr_elem(_)),assert(nr_elem(0)),parcurge_lista(L,Divizor),retract(nr_elem(NrElem)).

%Parcurge_lista(+L,+Divizor):verifica daca este numar si se divide cu 2. daca nu, trece mai departe pana epuizeaza lista.
parcurge_lista([H|T],Divizor):-number(H), 0 is mod(H,Divizor), retract(nr_elem(Oldnr)),Newnr is Oldnr +1 , assert(nr_elem(Newnr)),parcurge_lista(T,Divizor).
parcurge_lista([H|T],Divizor):-parcurge_lista(T,Divizor).
parcurge_lista([],Divizor).