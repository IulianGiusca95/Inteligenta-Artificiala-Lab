%nota: este asemanator cu exemplul din help insa un pic modificat pt a se potrivi cu acest exercitiu 
%(recomand sa cititi si exemplul acela din help)
%Atentie, cand va veti face fisierele de intrare sa le faceti cat mai simple, aici e facut astfel pt a exemplifica mai multe lucruri
citeste_graf(Fisier) :- %se va da calea fisierului
seeing(Input_curent), % ca sa salvam intr-o variabila stream-ul curent de input
see(Fisier), % deschide fisierul dat prin calea respectiva
read(Numegraf),
repeat,
read(Tip), % citeste tipul de informatie
((Tip==nod) -> 
(read(Nod),assert(nod(Numegraf,Nod)))
;( 
(Tip==muchie)->
(read(N1),read(N2),assert(muchie(Numegraf,N1,N2)))
;
true)
), 
write(Tip), nl,
Tip == end_of_file, % verifica daca a ajuns la sfarsit de fisier
!,
seen, % Inchide fisierul
see(Input_curent).%revine la fostul stream de input
