%Giusca Iulian 242
%7.5.2016

/*
Am matricea retinuta ca o lista de liste, cu un nume. Pentru a parcurge alternat matricea de sus-jos, in predicatul principal dau numele matricei
ca parametru de intrare,extragand apoi lista de liste care urneaza sa fie afisata alternat.

Am 2 predicate separate, unul care afiseaza o coloana de sus in jos, si unul care afiseaza de jos in sus. 
In predicatul principal se incepe apeland preducatul pentru afisarea sus-jos.

Sus-jos are 3 parametri:
1)pozitia din lista de afisat
2)Lista de liste care urmeaza sa fie parcursa
3)Lista de liste care nu se modifica, dar trebuie trimisa ca parametru cand parametrul 2 devine nul.

Se apeleaza predicatul pana cand cel de-al doilea parametru devine lista vida, se incrementeaza pozitia de afisat si urmeaza afisarea de jos in sus.

Pentru afisarea de jos in sus, am folosit 2 predicate:
-unul care parcurge lista recursiv, afisand elementele in ordinea inversa a parcurgerii
-al doilea care, atunci cand s-a terminat parcurgerea jos-sus, trece din nou la parcurgerea sus-jos

Programul se opreste cand nu mai gaseste elemente de afisat(verificarea se face in predicatul afiseaza)
***Am avut nevoie de 2 predicate pentru jos-sus fiindca, dupa ce termina recursivitatea, omite sa mai afiseze aceste elemente***

*/


matrice(m1,[[a,b,c,d],[e,f,g,h],[i,j,k,l],[m,n,o,p]]).

%predicat principal
%parcurge_alternat(+Nume)
parcurge_alternat(M1):-matrice(M1,L),sus_jos(0,L,L).

%sus_jos(+Pozitie,+Lista de liste,+Lista de liste)
sus_jos(Nr,[H|T],L):-afiseaza(Nr,H),sus_jos(Nr,T,L).
sus_jos(Nr,[],L):-Nr1 is Nr+1,parcurge_jos_sus(Nr1,L,L).

%parcurge_jos_sus(+Pozitie,+Lista de liste, +Lista de liste)
parcurge_jos_sus(Nr,L,L):-jos_sus(Nr,L,L),Nr1 is Nr+1, sus_jos(Nr1,L,L).
%jos_sus(+Pozitie,+Lista de liste, +Lista de liste)
jos_sus(Nr,[H|T],L):-jos_sus(Nr,T,L),afiseaza(Nr,H).
jos_sus(Nr,[],L).

%afiseaza(+Pozitie,+Lista)
afiseaza(0,[H|T]):-write(H),write(' ').
afiseaza(Nr,[H|T]):-Nr1 is Nr-1,afiseaza(Nr1,T).

/*
| ?- parcurge_alternat(m1).                                             
a e i m n j f b c g k o p l h d 
no
*/