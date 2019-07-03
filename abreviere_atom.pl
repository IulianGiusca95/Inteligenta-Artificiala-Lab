%Giusca Iulian 242
%6.5.2016

%abreviaza(+Atom,-Abr)
/*
Transform Atom in lista de caractere, adaug primul element gasit(dupa ce fac verificarea daca este scris cu litera mare),
iar apoi continui cu cel de-al doilea predicat care parcurge lista pana gaseste un spatiu, apoi adauga elementul de dupa spatiu
in lista abrevierilor(dupa ce transforma litera mica in litera mare, daca e cazul).
*/

abreviaza(Atom,Abr):-atom_chars(Atom,[H|T]),abr(T,Abr1),
                      char_code(H,Nr),
					  (Nr>=97 -> NrNou is Nr - 32 ; NrNou is Nr),
					  char_code(HNou,Nr),
                      Abreviat=[HNou|Abr1],atom_chars(Abr,Abreviat).
		
%abr(+Lista,-Abr)		
abr([H1,H2|T],Abr):-H1==' ',abr([H2|T],Abr1),
                    char_code(H2,Nr),
					(Nr>=97 -> NrNou is Nr - 32 ; NrNou is Nr),
                    char_code(H2Nou,NrNou),
                    Abr=[H2Nou|Abr1];abr([H2|T],Abr).
abr([H],[]).

/*Exemple de interogari
| ?- abreviaza('Ceata lui pitigoi',L). 
L = 'CLP' ? y
yes
| ?- abreviaza('Organizatia adormita a pisicilor sforaitoare',L).
L = 'OAAPS' ? y
yes
*/
