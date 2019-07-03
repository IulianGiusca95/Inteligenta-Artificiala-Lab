scriere_fis(F):-open(F,write,Stream), put_char(Stream,'a'),nl(Stream),write(Stream,'bla bla'),format(Stream,'\n~d este un numar intreg, iar ~f e un numar in format cu virgula', [3,1.1]),close(Stream).
adauga_fis(F):-open(F,append,Stream),write(Stream, '\nceva adaugat'),close(Stream).

scrie_fis(F):-open(F,write,Stream),
               repeat, read(X),
			   (X==0 -> true ;
			   write(Stream,X),write(Stream,'\n'),fail),
			   !,close(Stream).
