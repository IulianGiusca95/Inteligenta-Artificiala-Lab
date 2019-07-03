%Giusca Iulian 242
%24.4.2016


%pred(+Lista,+Pozitie,-Element)
pred([H|T],0,H).
pred([H|T],Poz,E):-Poz1 is Poz-1, pred(T,Poz1,E).


%l_el_nume(+ListaNume,Pozitie,Litera,-Nume).
l_el_nume([H|T],0,Litera,H):-atom_chars(H,[Litera|_]).
l_el_nume([H|T],0,Litera,Elem):-l_el_nume(T,0,Litera,Elem).
l_el_nume([H|T],N,Litera,Elem):-N>0, N1 is N-1,atom_chars(H,[Litera|_]),l_el_nume(T,N1,Litera,Elem).
l_el_nume([H|T],N,Litera,Elem):-N>0, N1 is N-1,l_el_nume(T,N,Litera,Elem).

