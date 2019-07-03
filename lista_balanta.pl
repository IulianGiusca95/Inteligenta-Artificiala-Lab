%Giusca Iulian 242
%24.04.2016

/*Idee: am calculat la inceput suma tutuor elementelor din lista.
M-am folosit de faptul ca suma elementelor din stanga e egala cu suma elementelor din dreapta.
Intr-o variabila, retin suma din stanga(initial e 0) si o actualizez pe masura ce parcurg lista. Astfel aflu usor ce valoare am in dreapta listei.
Aflu care e modulul dintre partea stanga si dreapta, si daca e mai mic decat valoarea din predicatul dinamic, reactualizez valoarea.*/ 

:-dynamic modul_minim/2.


%suma_elem(+L,-Suma)
suma_elem([],0).
suma_elem([H|T],S):-number(H),suma_elem(T,S1), S is S1+H.


%predicat principal
%lista_balanta(+Lista,-Pozitia)
lista_balanta(L,Poz):-suma_elem(L,Suma), %calculez suma
                       retractall(modul_minim(_,_)),assert(modul_minim(Suma,0)), %aloc predicatul dianmic
					   parcurge(L,0,Suma,0),retract(modul_minim(Modul,Poz)).
					   
%parcurge(+L,+SumaStanga,+SumaTotala,+Pozitia)					   
parcurge([H|T],SumaPrev,Suma,Poz):-(SumaPrev + H < Suma, E is Suma - SumaPrev-H ; E is SumaPrev + H - Suma), %Aflu suma din partea dreapta
                                   (E < SumaPrev+H, Mod is SumaPrev+H - E ; Mod is E - SumaPrev-H), %Aflu modulul dintre partea stanga si dreapta
                                    retract(modul_minim(OldMod,Oldpoz)),
								   (Mod < OldMod, assert(modul_minim(Mod,Poz));assert(modul_minim(OldMod,Oldpoz))), %verific daca modulul e mai mic decat valoarea din predicatul dinamic
								    Poz1 is Poz+1,SumaPrev1 is SumaPrev+H,parcurge(T,SumaPrev1,Suma,Poz1).%parcurg lista mai departe, actualizand suma din partea stanga cu elementul curent si pozitia cu 1 element
parcurge([],_,_,_).