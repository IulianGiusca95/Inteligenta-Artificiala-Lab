citire_fis(F):-open(F,read,Stream),repeat, get_char(Stream,X),write(X), at_end_of_stream(Stream),!,close(Stream).

citire_linii(F):-open(F,read,Stream), repeat,write('linie:'),citeste_linie(Stream),get_char(Stream,X),nl,at_end_of_stream(Stream),!,close(Stream).
citeste_linie(Stream):-repeat, get_char(Stream,X),write(X), at_end_of_line(Stream),!.

/* am adaugat un get_char(Stream,X) pe randul 3 deoarece streamul ramanea blocat pe end_of_line si de aceea pentru liniile de la 2 in jos, aparea un rand in plus la citire*/