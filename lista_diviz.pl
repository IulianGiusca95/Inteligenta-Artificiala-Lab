%Giusca Iulian 242
%24.4.2016

:-dynamic lista/1.


%pred(+N,-L).
%predicatul principal
pred(N,L):-retractall(lista(_)),assert(lista([])),divizori(N,1),retract(lista(L)).

%divizori(+Numar,+Divizor)
divizori(N,Divizor):-Divizor =< N,0 is mod(N,Divizor), %verific daca Divizor e mai mic decat numarul, si daca il divide
                       Div1 is Divizor+1, divizori(N,Div1),
					   retract(lista(Lv)),Ln = [Divizor|Lv],assert(lista(Ln)). %daca il divide, reactualizeaza lista divizorilor
divizori(N,Divizor):-Divizor =< N, Div1 is Divizor+1,divizori(N,Div1). %Divizor e mai mic decat N, dar nu divide N
divizori(N,Divizor):- Divizor > N.

%suma_lista(+L,-S)
suma_lista([],0).
suma_lista([H|T],S):-suma_lista(T,S1),S is S1+H.

%perfect(+Nr)
%Formeaza lista divizorilor ajutandu-se de predicatul anterior
%Pentru a verifica daca e perfect, calculam suma elementelor din lista(de la care scadem numarul insusi).
perfect(Nr):-pred(Nr,L),suma_lista(L,S), Nr =:= S - Nr.