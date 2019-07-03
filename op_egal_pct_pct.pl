structuri([H|T],Lista2):- H=..[Profesie,Nume,Prenume],structuri(T,Lista_noua),Y=[Prenume,Nume,Profesie],Lista2=[Y|Lista_noua].
structuri([],[]).