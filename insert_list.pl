%Giusca Iulian 242
%24.4.2016


%insert_list(+Element,+Pozitie,+Lista,-ListaRezultata)
insert_list(E,0,[H|T],[E,H|T]).
insert_list(E,Poz,[H|T],Lr):- Poz1 is Poz-1, insert_list(E,Poz1,T,Ln),Lr=[H|Ln].


%Predicat principal
%insert_nr(+Lista,+Numar,-ListaRezultat)
insert_nr(L,N,Lr):-N>=1,parcurge(L,2,N,N,Lrn), Lr = [1|Lrn].

%parcurge(+Lista,+Element,+Interval,+PozInInterval,-Lr)
parcurge([H|T],E,N,0,Lr):-E1 is E + 1, parcurge([H|T],E1,N,N,Lrn), Lr = [E|Lrn].
parcurge([H|T],E,N,Poz,Lr):- Poz1 is Poz-1, parcurge(T,E,N,Poz1,Lrn),Lr = [H|Lrn].
parcurge([],E,_,0,[E]).
parcurge([],E,_,Poz,[]):- Poz =\=0. 

/* Exemple de compilare


| ?- insert_nr([a,b,c,d,e,f,g],2,Lr).
Lr = [1,a,b,2,c,d,3,e,f,4|...] ? 
yes
| ?- insert_nr([a,b,c,d,e,f,g],3,Lr).
Lr = [1,a,b,c,2,d,e,f,3,g] ? 
yes
| ?- insert_nr([a,b,c,d,e,f],3,Lr).  
Lr = [1,a,b,c,2,d,e,f,3] ? y
yes
| ?- insert_nr([a,b,c,d,e,f],1,Lr).
Lr = [1,a,2,b,3,c,4,d,5,e|...] ? y
yes
*/