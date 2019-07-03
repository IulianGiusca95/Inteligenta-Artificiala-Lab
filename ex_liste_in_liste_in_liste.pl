%Giusca Iulian
%18.4.2016

/*Ideea: Avem un predicat dinamic in care retinem adancimea maxima. Initial, adancimea e 0, si se reactualizeaza de fiecare data cand 
ajungem intr-un "punct mort" : termen simplu sau lista vida. Ne vom folosi de un predicat auxiliar care va contine o adancime curenta,care
se incrementeaza de fiecare data cand ajungem intr-un termen compus.
*/

%predicat dinamic in care retinem adancimea maxima
:-dynamic numar/1.

%adancime(+X,-Nr)
adancime(X,Nr):-retractall(numar(_)),assert(numar(0)),verifica(X,0),retract(numar(Nr)). %initial atribuim adancimii maxime valoarea 0

%verifica(+X,+Nr) - predicat auxiliar
%Acesta e cazul cand X = []. In nr avem adancimea curenta, o crestem cu o unitate, apoi comparam adancimea curenta+1(fiindca lista vida are adancime 1) si adancimea maxima din predicatul dinamic. 
verifica([],Nr):-retract(numar(Oldmax)),Nrn is Nr + 1,(Oldmax < Nrn, assert(numar(Nrn));assert(numar(Oldmax))).

%Acesta e cazul cand X e un termen simplu, comparam adancimea curenta si adancimea maxima din predicatul dinamic
verifica(X,Nr):-simple(X), X \== [], retract(numar(Oldmax)), (Oldmax < Nr , assert(numar(Nr)) ; assert(numar(Oldmax))).

%Acesta este cazul cand X era un termen compus. Crestem adancimea curenta cu +1 si continuam verificarea
verifica([H|T],Nr):-Nr1 is Nr + 1, verifica(H,Nr1), verifica(T,Nr).