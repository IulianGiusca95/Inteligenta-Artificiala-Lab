%Giusca Iulian 242
%24.4.2016


%ult_elem(+L,-UltElem)
ult_elem([H],H).
ult_elem([H|T],Elem):-ult_elem(T,Elem).

%list_nr(+ListadeListe,+Numar,-ListadeListeRezultate)
list_nr([H|T],Nr,Lr):- H == [], list_nr(T,Nr,Lr).
list_nr([H|T],Nr,Lr):-ult_elem(H,Elem),Nr>=Elem,list_nr(T,Nr,Lrn),Lr = [H|Lrn].
list_nr([H|T],Nr,Lr):-ult_elem(H,Elem),list_nr(T,Nr,Lr).
list_nr([],_,[]).

