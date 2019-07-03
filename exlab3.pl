% sum_nr_fis(+Cale_fis,-Suma,-lista)
:- dynamic suma/1.
:- dynamic lista_nr/1.


sum_nr_fis(Cale_fis,S,Lista):-open(Cale_fis,read,Stream),
retractall(suma(_)),retractall(lista_nr(_)),
assert(suma(0)),assert(lista_nr([])),


repeat,
      read(Stream,X),
	  (number(X),
	  once(retract(suma(Sv))),
	  Sn is Sv + X ,
	  assert(suma(Sn)),
	  once(retract(lista_nr(Lv))),
	  assert(lista_nr([X|Lv])),
	  fail ; X==end_of_file),!,
	         retract(suma(S)),retract(lista_nr(Lista)),
			 close(Stream).


