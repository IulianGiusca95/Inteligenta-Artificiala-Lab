%Nr2
%------------------------------------------Problema 1---------------------------------------------------------
extraterestru(mikibazz,[marte, pamant, saturn, venus, marte]).
extraterestru(gogubazz,[mercur,uranus,mercur, pamant]).
extraterestru(galactis,[saturn, jupiter, uranus, mercur, pamant]).
extraterestru(bazzbazz,[]).
extraterestru(astrolulu,[mercur,pamant,mercur,pamant,mercur,pamant,jupiter]).
extraterestru(bazz,[marte]).

%Predicat care calculeaza lista extraterestrilor din baza de cunostinte

pred1(Lrez):-findall(X,extraterestru(X,_),L), setof(X,member(X,L),Lrez).

%Un predicat care returneaza toate numele (extraterestrilor) care se termina cu bazz.

pred2(Lrez):-findall(X,(extraterestru(X,_),atom_chars(X,Lb),bazz(Lb)),L), setof(X,member(X,L),Lrez).
bazz([H1,H2,H3,H4]):-H1=='b',H2=='a',H3=='z',H4=='z'.
bazz([H1,H2,H3,H4|T]):-bazz([H2,H3,H4|T]).

%Un predicat care returneaza o lista de structuri de forma vizitari(nume_extraterestru, numar_planete), ordonata crescator dupa numarul de planete vizitate.
/*de revenit la afisarea in ordine crescatoare*/

pred3(Lrez):-findall(vizitari(Nume,Numar),(extraterestru(Nume,L),length(L,Numar)),Lr),
             setof(vizitari(X,Nr),(member(vizitari(X,Nr),Lr)),Lrez).
			 
%Un prdeicat care afla planeta cea mai vizitata.
/*nu pare ok*/
pred4(Nume):-pred5(L),get_numar(0,Numar,"Nu am gasit",Nume,L).
get_numar(Max,Nr,Nume1,Nume,[H|T]):-findall(X,H^(extraterestru(X,L),member(H,L)),L1),length(L1,Lungime),(Lungime>Max,get_numar(Lungime,Nr,H,Nume,T);get_numar(Max,Nr,Nume1,Nume,T)).
get_numar(Max,Max,Nume,Nume,[]).

%Predicat care calculeaza lista de planete vizitate de extraterestri (din baza de cunostinte). Planetele trebuie sa apara o singura data in lista.

pred5(Lrez):-findall(X,(extraterestru(_,Lista_planete),member(X,Lista_planete)),L),setof(X,member(X,L),Lrez).

%Predicat care calculeaza cea mai frecventa planeta revizitata.
			 

%Sa se scrie in 2 moduri (recursiv si cu bagof/setof) un predicat care primeste o lista de numere si calculeaza lista tuturor numerelor distincte care incep si se termina cu aceeasi cifra.

mod1([H|T],Lrez):-get_prima(H),mod1(T,Lrez1),Lrez=[H|Lrez1];mod1(T,Lrez).
mod1([],[]).
get_prima(H):-number(H),number_chars(H,[Prima|T]),get_ultima(Prima,T).
get_ultima(Prima,[Prima]).
get_ultima(Prima,[H|T]):-get_ultima(Prima,T).

mod2(L,Lrez):-findall(X,(member(X,L),get_prima(X)),Lrez).

%-----------------------------------------Problema 2-----------------------------------------------------------
%Exercitiul 1
%concat(+Lista1,+Lista2,-Listarez)
:-dynamic nodp/2. /*aici retinem nodul parinte al unui nod. Daca e radacina, nodul parinte va fi egal cu 1*/
:-use_module(library(random)). /*librarie folosita pentru random*/
concat([],L,L).
concat([H|T],L,[H|T1]):-concat(T,L,T1).

%membru(+Element,+Lista)
membru(H,[H|_]).
membru(X,[_|T]):-membru(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b(Start, Sol):-retractall(nodp(_,_)),assert(nodp(Start,1)),breadthfirst([[Start]],Sol). /*asociem valoarea 1 nodului parinte pentru radacina */

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst([[Nod|Drum]|_], [Nod|Drum]):- scop(Nod).
breadthfirst([Drum|Drumuri], Sol) :- 
				extinde(Drum, DrumuriNoi),
				concat(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde([Nod|Drum],DrumuriNoi):-s(Nod,L), /*Imi formez succesorul in exterior, L fiind o lista de succesori*/
				bagof([X,Nod|Drum], L^(member(X,L),\+(membru(X,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde(_,[]).

scop(Nod):- Nod >= 10, 15 >= Nod.
s(Nod,[NodNou]):-V is mod(Nod,3),V==0,A is div(Nod,3), B is sqrt(Nod),C is truncate(B),D is A+C,NodNou is mod(D,40),assert(nodp(NodNou,Nod)). /*nod = 3k */
s(Nod,[NodNou]):-Nod1 is Nod+1,V is mod(Nod1,3), V==0, A is Nod-2, B is div(A,3), (B > Nod,random(Nod,B,NodNou);random(B,Nod,NodNou)),assert(nodp(NodNou,Nod)). /*nod=3k+2*/
s(Nod,[NodNou1,NodNou2]):-retract(nodp(Nod,NP)),A is Nod+NP, (V is mod(A,2),V==0, NodNou1 is div(A,2) ; C is div(A,2), NodNou1 is C+1),
                          assert(nodp(Nod,NP)),
						  D is Nod * 7, NodNou2 is mod(D,40).
						  assert(nodp(NodNou1,Nod)),assert(nodp(NodNou2,Nod)). /*nod=3k+1*/



%Exercitiul2
%concat(+Lista1,+Lista2,-Listarez)
concat2([],L,L).
concat2([H|T],L,[H|T1]):-concat2(T,L,T1).

%membru(+Element,+Lista)
membru2(H,[H|_]).
membru2(X,[_|T]):-membru2(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b2(L,Start,Final,N,Sol):-breadthfirst2(L,[[Start]],Final,N,Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst2(_,[[Final|Drum]|_],Final,_, [Final|Drum]).
breadthfirst2(L,[Drum|Drumuri],Final,N,Sol) :- 
				extinde2(L,Drum,N,DrumuriNoi),
				concat2(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst2(L,Drumuri1,Final,N,Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde2(L,[Nod|Drum],N,DrumuriNoi):- /*pentru fiecare element din lista, verific daca exista un atom alcatuit din 2 caractere care sa il contina pe Nod, daca da, adaug NodNou in Drumuri noi(daca respecta conditiile)*/
				bagof([NodNou,Nod|Drum], L^X^(member(X,L),(atom_chars(X,[Nod,NodNou]);atom_chars(X,[NodNou,Nod])),char_code(Nod,C1),char_code(NodNou,C2),(C1>C2, D is C1 - C2, D >=4 ; D is C2 - C1 , D >=4 ),\+(membru(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde2(_,_,_,[]).
	

%-----------------------------------------Problema 3-----------------------------------------------------------
%rezolva_d(+Nod,-DrumSolutie)
cost(a,4).
cost(b,7).
cost(c,7).
cost(d,2).
cost(e,10).
cost(f,7).
cost(g,5).
sd(a,b).
sd(a,f).
sd(a,g).
sd(b,c).
sd(c,d).
sd(c,g).
sd(d,f).
sd(e,d).
sd(f,c).
sd(f,e).
sd(g,a).
sd(g,c).
scopd(c).
scopd(d).
rezolva_d(N,Cost,[N]):-20>=Cost,scopd(N).
rezolva_d(N,Cost,[N|Sol1]):- 20 >= Cost, sd(N,N1),cost(N1,C), Cost1 is Cost+C,rezolva_d(N1,Cost1,Sol1).


rezolva_d2([],[]).
rezolva_d2([H1,H2|T],Sol):-A is mod(H1,2),
                       (A == 0,(rezolva_par([H2|T],Sol1),Sol=[H1|Sol1];NH1 is H1-1, NH2 is H2+1, rezolva_impar([NH2|T],Sol1),Sol=[NH1|Sol1]);
                        A == 1,(rezolva_impar([H2|T],Sol1),Sol=[H1|Sol1];NH1 is H1-1, NH2 is H2+1, rezolva_par([NH2|T],Sol1),Sol=[NH1|Sol1])).
						
rezolva_par([H1,H2|T],Sol):- A is mod(H1,2),
                          (A == 0, rezolva_par([H2|T],Sol1),Sol=[H1|Sol1];
						   A == 1, NH1 is H1 - 1, NH2 is H2 + 1, rezolva_par([NH2|T],Sol1),Sol=[NH1|Sol1]).
rezolva_par([H],[H]):-A is mod(H,2), A == 0.

rezolva_impar([H1,H2|T],Sol):- A is mod(H1,2),
                            (A == 1, rezolva_impar([H2|T],Sol1),Sol=[H|Sol1];
							A == 0, NH1 is H1 - 1, NH2 is H2 + 1, rezolva_impar([NH2|T],Sol1),Sol=[NH1|Sol1]).
rezolva_impar([H],[H]):-A is mod(H,2), A == 1.
%-----------------------------------------Problema 4-----------------------------------------------------------
%concat(+Lista1,+Lista2,-Listarez)
concat4([],L,L).
concat4([H|T],L,[H|T1]):-concat4(T,L,T1).

%membru(+Element,+Lista)
membru4(H,[H|_]).
membru4(X,[_|T]):-membru4(X,T).

%rezolva_b(+Start,- Sol)
rezolva_b4(Start, Sol):-breadthfirst4([[Start]],Sol).

%breadthfirst(+Listadrumuri,-DrumSolutie)
breadthfirst4([[Nod|Drum]|_], [Nod|Drum]):- scop4(Nod).
breadthfirst4([Drum|Drumuri], Sol) :- 
				extinde4(Drum, DrumuriNoi),
				concat4(Drumuri, DrumuriNoi, Drumuri1),
				breadthfirst4(Drumuri1, Sol).

%extinde(+StareDrum,-ListaDrumuriDerivate)
extinde4([Nod|Drum],DrumuriNoi):-
				bagof([NodNou,Nod|Drum], (s4(Nod,NodNou), \+(membru4(NodNou,[Nod|Drum]))),
				DrumuriNoi),
				!.
extinde4(_,[]).
%-----------------------------------------Problema 5-----------------------------------------------------------



			 
