%Giusca Iulian 242
%6.5.2016

/*
Idee: Am folosit doua predicate dinamice, in care retin elementul care alcatuieste cea mai lunga sublista de un singur element,
si lungimea sublistei. 
Initial, lungimea maxima este 1 si elementul este primul element din lista data ca data de intrare.
Pe masura ce parcurg lista, daca elementul curent apartine sublistei, voi incrementa Nr.
Daca elementul apartine unei alte subliste, compar numarul din Elmax cu cel din parametrul predicatului "parcurge", si daca am gasit o 
sublista mai mare decat aceea retinuta in elmax/nrmax, actualizez aceste predicate.
*/

:-dynamic nrmax/1.
:-dynamic elmax/1.

%pred_subl(+Lista, -Elem, -Nr) - predicat principal
pred_subl([H|T],Elem,Nr):-retractall(nrmax(_)),assert(nrmax(1)),
                           retractall(elmax(_)),assert(elmax(H)),
						   parcurge(T,H,1),retract(nrmax(Nr)),retract(elmax(Elem)).

%parcurge(+Lista,+El,+Nr).
parcurge([H|T],El,Nr):- El == H, Nr1 is Nr+1, parcurge(T,El,Nr1).
parcurge([H|T],El,Nr):- \+(El == H),retract(nrmax(NrV)),
                         (NrV =< Nr ->assert(nrmax(Nr)),retract(elmax(ElV)),assert(elmax(El));assert(nrmax(NrV))),
						 parcurge(T,H,1).
parcurge([],El,Nr):-retract(nrmax(NrV)),
                    (NrV =< Nr ->assert(nrmax(Nr)),retract(elmax(ElV)),assert(elmax(El));assert(nrmax(NrV))).
					
/* Exemple de interogari
| ?- pred_subl( [1, 1, 1,2,2,2,2],Elem,Nr).                  
Elem = 2,
Nr = 4 ? y
yes
| ?- pred_subl( [1, 1, 1, a, a, b, c, 1, 1, 1, 1, 0, 0, 0, 0, a, a, b, b, b],Elem,Nr).
Elem = 0,
Nr = 4 ? y
yes
| ?- pred_subl( [1,2,3,4,5,6,7,8,9],Elem,Nr).                                         
Elem = 9,
Nr = 1 ? ;
no
*/