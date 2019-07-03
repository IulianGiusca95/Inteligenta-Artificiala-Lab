

%alphabeta(+Poz,+Alpha,+Beta,-PozBuna,-Val )  - predicat principal
%alphabeta(StareaJocului,
%          LimitaMin, LimitaMax,
%          Cel mai bun succesor, Scorul lui)
alphabeta(Poz,Alpha,Beta,PozBuna,Val ):-
mutari(Poz,ListaPoz),!, %calculeaza in ListaPoz toate mutarile posibile - Daca nu e frunza, trece de cut 
limitarebuna(ListaPoz,Alpha,Beta,PozBuna,Val); %Primestes lista de frati si calculeaza cel mai bun frate
staticval(Poz,Val). %caz de else: calculeaza scorul pentru frunze.

%limitarebuna(+ListaPoz,+Alpha,+Beta,-PozBuna,-ValBuna)
limitarebuna([Poz|ListaPoz],Alpha,Beta,PozBuna,
ValBuna):-
alphabeta(Poz,Alpha,Beta,_,Val), %extinde primul frate pentru a afla scorul val
destuldebun(ListaPoz,Alpha,Beta,Poz,Val,PozBuna, %primeste restul fratilor de la 2 incolo, ii compara cu acest poz si val si rezultatul il pune in pozBuna,valBUna
ValBuna).

%destuldebun(+ListaPoz,+Alpha,+Beta,+Poz,+Val,-PozBuna,-ValBuna)
destuldebun([ ],_,_,Poz,Val,Poz,Val):-!. %cand a terminat de parcurs toti fratii, a luat chiar poz si val 

destuldebun(_,Alpha,Beta,Poz,Val,Poz,Val):- %etapa de retezare a ramurilor
mutare_min(Poz),Val > Beta,!; %daca am mutare min(Poz) si Val > Beta, m-am oprit si acest PozVal e si succesorul pe care il pastrez
mutare_max(Poz),Val < Alpha,!.%se realizeaza taierea asociat cu desenul de  pe tabla

destuldebun(ListaPoz,Alpha,Beta,Poz,Val,PozBuna,
ValBuna):-
limitenoi(Alpha,Beta,Poz,Val,AlphaNou,BetaNou),%actualizarea intervalului
limitarebuna(ListaPoz,AlphaNou,BetaNou,Poz1,
Val1),%cu noile limite, se duce in restul fratilor si il calculeaza pe cel mai bun si-l pune in poz1 val1 
maibine(Poz,Val,Poz1,Val1,PozBuna,ValBuna).%compara primul frate cu cel mai bun din restul fratilor si pune rezultatul in poz buna val buna

%limitenoi(+Alpha,+Beta,+Poz,+Val,-AlphaNou,-BetaNou),
limitenoi(Alpha,Beta,Poz,Val,Val,Beta):-%actualizare interval
mutare_min(Poz),Val > Alpha,!.

limitenoi(Alpha,Beta,Poz,Val,Alpha,Val):-%actualizare interval
mutare_max(Poz),Val < Beta,!.

limitenoi(Alpha,Beta,_,_,Alpha,Beta).%cand toate numerele nu indeplinesc conditiile de mai sus

%maibine(+Poz,+Val,+Poz1,+Val1,-PozBuna,-ValBuna).
maibine(Poz,Val,Poz1,Val1,Poz,Val):-%compara poz1 val 1 cu poz val si spune ca pe prima clauza e cel mai bun
mutare_min(Poz),Val > Val1,!;%conditiile cand Poz e mai bun ca poz1
mutare_max(Poz),Val < Val1,!.
maibine(_,_,Poz1,Val1,Poz1,Val1).%daca prima vare verifica ca poz val a esuat, mai ramane poz1 val1 ca fiinda mai bun. nu repetam testele din cauza lui cut