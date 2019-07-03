s(a,b,7).
s(a,c,4).
s(a,d,5).
s(b,f,6).
s(b,g,3).
s(g,i,2).
s(g,j,3).
s(c,b,2).
s(c,e,8).
s(c,f,5).


h(b,9).
h(c,10).
h(d,11).
h(e,6).
h(f,10).
h(g,6).
h(h,0).
h(i,4).
h(j,3).

scop(h).



%bestfirst(+Nod_initial,-Solutie)
bestfirst(Nod_initial,Solutie):-expandeaza([],l(Nod_initial,0/0),9999999,_,da,Solutie).
%porneste de la nodul initial, cu F/G=0/0
%Solutie = nodurile in ordine cronologica
%Expandeaza(Istoric,
%leaf(Nod,F/G),
%limita,
%Arbore_expandat,
%flag(da:am gasit / nu: drum cu cost mai mare decat minim / imposibil:dead-end),
%Solutie).

%expandeaza(+Drum,+Arbore,+Limita,-A1,-Rezultat,-Solutie),


expandeaza(Drum,l(N,_),_,_, da,[N|Drum]):-scop(N).


expandeaza(Drum,l(N,F/G),Limita,Arb1,Rez,Sol):-
F=<Limita,%are sens sa calculeze succesor
(bagof(M/C,(s(N,M,C), \+ (membru(M,Drum))),Succ),!,%in succ sunt toti fii lui N
listasucc(G,Succ,As),%transformam lista calculata in bagof in structuri de tipul l
cea_mai_buna_f(As,F1),%se alege cea mai buna varianta din lista de succesori pentru a se expanda
expandeaza(Drum,t(N,F1/G,As),Limita,Arb1, Rez,Sol);
Rez=imposibil).%e deadend daca nu am succesori

expandeaza(Drum,t(N,F/G,[A|As]),Limita,Arb1,Rez,Sol):- %trebuie sa obtinem minimul dintre frati
F=<Limita,
cea_mai_buna_f(As,BF),
min(Limita,BF,Limita1),%minimul dintre Limia si BF e pus in Limita1
expandeaza([N|Drum],A,Limita1,A1,Rez1,Sol),%S-a adaugat la istoric radacina,A1 este A-ul expandat
continua(Drum,t(N,F/G,[A1|As]),Limita,Arb1, Rez1,Rez,Sol).%reordoneaza dupa expandarea primului fratii in functie de f

expandeaza(_,t(_,_,[]),_,_,imposibil,_):-!.%lista de succesori e vida, deci nu duce nicaieri. Rezultat imposibil.


expandeaza(_,Arb,Limita,Arb,nu,_):-%drum in asteptare
f(Arb,F),
F>Limita.


%continua(+Drum,+Arb,+Limita,-Arb1,-Rez1,-Rez,-Sol)

continua(_,_,_,_,da,da,Sol).

continua(P,t(N,F/G,[A1|As]),Limita,Arb1,nu,Rez,Sol):- %cand rezultatul e nu, are loc reordonarea fratilor
insereaza(A1,As,NAs),%NAs = NouAs
cea_mai_buna_f(NAs,F1),%Noul set de fii,preia valoarea lui f
expandeaza(P,t(N,F1/G,NAs),Limita,Arb1,Rez,Sol).%Expandeaza ca sa aiba un nou fiu de expandat, P-ul e drumul de dinainte, istoricul.

continua(P,t(N,F/G,[_|As]),Limita,Arb1,imposibil,Rez,
Sol):-cea_mai_buna_f(As,F1),
expandeaza(P,t(N,F1/G,As),Limita,Arb1,Rez,Sol).


%listasucc(+G,+Succesori,-Arbore)
listasucc(_,[],[]).

listasucc(G0,[N/C|NCs],Ts):-%pentru fiecare nod in parte, se calculeaza scorul lui F si G 
G is G0+C,
h(N,H),
F is G+H,
listasucc(G0,NCs,Ts1),
insereaza(l(N,F/G),Ts1,Ts).%insereaza fiecare nod in ordinea scorului obtinut


%insereaza(+Arb,+ListArb, -ListArbrez)
insereaza(A,As,[A|As]):-%il ataseaza pe A in capul listei daca scorul lui A e mai mic decat primul element gasit(care e cel mai mic),altfel mai parcurge un element
f(A,F),%ia valoarea lui F pentru nodul A
cea_mai_buna_f(As,F1),%ia valoarea lui F pentru cel mai bun nod din lista de succesori
F=<F1,!.%compara F-urile

insereaza(A,[A1|As],[A1|As1]):-insereaza(A,As,As1).%faca asta pana cand ajunge cel mult la multimea vida, care are scorul limita(999999)

%min(+X,+Y,-M)
min(X,Y,X):-X=<Y,!.
min(_,Y,Y).

%f(+Arb, -F)
f(l(_,F/_),F). 
f(t(_,F/_,_),F). 

%cea_mai_buna_f(+Lista,-F)
cea_mai_buna_f([A|_],F):-f(A,F).%cea mai buna solutie e cea din capul listei, se extrage valoarea F corespunzatoare
cea_mai_buna_f([],999999).




%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

