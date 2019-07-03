:-dynamic suma/1.

suma_nr(Suma,Mod):-
                   retractall(suma(_)),
				   assert(suma(0)),
                   repeat,
                     read(X),
					 %conditia daca este numar
					 (number(X),
					 ((X < 0 , -X >= Mod ; X >= Mod),once(retract(suma(Sv))),Sn is Sv + X, assert(suma(Sn)),fail; %modulul numarului e mai mare decat Mod
					 X>(-Mod),X<Mod,fail); %modulul nu e mai mare
					 %conditia daca nu e numar
					 \+ number(X),
					 (X == 'gata',retract(suma(Suma)), true; %X nu e numar, dar e gata.
					 X \== 'gata', write('eroare'),!,fail)). %X nu e numar si nu e nici gata, atunci iese cu eroare din repeat.
				   