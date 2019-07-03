copil(ion, [bulbasaur, charmander, rattata, charmander]).
copil(liliana, [rattata, pichu, bulbasaur]).
copil(monica, [pidgey, charmander, caterpie, bulbasaur, machop]).
copil(andrei, [bulbasaur, pichu, bulbasaur, caterpie]).
copil(gogu, [slowpoke, bulbasaur, slowpoke, slowpoke]).
copil(alexandra, [bulbasaur, magnemite]).
copil(marius, [bulbasaur, pidgey]).


nr_copii(Nr):-setof(X,G^copil(X,G),L),length(L,Nr).
lista_poke(L):-setof(X, Lp^(copil(G1,Lp),member(X,Lp)),L).

get_copil(Nume,Initiala):- copil(Nume,_),atom_chars(Nume,[Initiala|_]).
lista_nume(Initiala,L):-setof(Nume,get_copil(Nume,Initiala),L).

/* Mai intai am creat o lista de pokemoni distincti, ordonati lexocografic, apoi, pentru fiecare pokemon in parte, am aflat ce copii il detin */
pokemon_list(L):-findall(X,(copil(_,Lp), member(X,Lp)),L1), setof(Y,member(Y,L1),L).
verifica_poke_copil(NumeC,NumeP):-copil(NumeC,L),member(NumeP,L).
pokemon_listcp(NumePokemon,ListaCopii):-pokemon_list(L),setof(NumeCopil,(member(NumePokemon,L),verifica_poke_copil(NumeCopil,NumePokemon)), ListaCopii).

:-dynamic max/2.


verif_max(X,G):-length(G,Nr), (retract(max(Max,NumeMax));assert(max(0,nume))), (Nr > Max, assert(max(Nr,X)); assert(max(Max,NumeMax))).
nume_cp_max(X):-copil(X,G),verif_max(X,G),retract(max(Nr,NumeCopil)).
						  