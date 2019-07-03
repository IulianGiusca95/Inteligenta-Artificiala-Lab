%Giusca Iulian 242
%8.5.2016


:-dynamic lista/1. %lista in care retin output-ul programului
:-dynamic indice/1. %valoare care decrementeaza pana la 0, ma ajuta la adaugarea celor X-1 elemente in lista
:-dynamic ok/1. %daca intru pe un caz de exceptie, valoarea lui ok e 0, altfel e 1

%cit_scr_fis(+Input,+Output) : predicat principal
cit_scr_fis(In,Out):-retractall(lista(_)),assert(lista([])),retractall(ok(_)),assert(ok(1)), 
                  seeing(Input_curent), %am salvat input-ul curent pentru a reveni la el dupa terminarea citirii din fisier
                  see(In), %am redirectionat citirea catre citirea din fisier
				  repeat,
				    read(X), %citesc elemente din fisierul directionat
					((X==end_of_file;X==0)->true; %daca X e end of file sau e 0, iese din repeat
					X1 is X-1, %aici intra pe cazul cand X nu e 0 sau EOF. Decrementeaza cu o unitate X-ul si da valoarea ca parametru(atatea numere sunt de adaugat in lista)
					adauga_lista(X1), 
					retract(ok(Val)), %verific valoarea din ok
					Val==0 -> assert(ok(0)),true; %daca e 0, inseamna ca am intalnit end_of_file cand citeam elemente pentru a le adauga in lista, ies din repeat.
					assert(ok(1)),fail),!, %daca e 1, totul e ok, merge mai departe
					seen, %inchid fisierul
					see(Input_curent), %revin la inputul anterior
					retract(ok(Val)),Val==1, %reverific valoarea din ok acum ca am iesit din repeat. Daca e 1, trece mai departe. Daca e 0, predicatul returneaza no.
					telling(Output_curent), %salvez output-ul curent
					tell(Out), %redirectionez output-ul catre un fisier deiesire
					retract(lista(L)),afiseaza(L). %transcriu lista in fisier
					told, %ichid fisierul de iesire
					tell(Output_curent). %revin la output-ul anterior

%adauga_lista(+Nr)					
adauga_lista(Nr):-retractall(indice(_)),assert(indice(Nr)), %in predicatul indice transmit valoarea din parametru
                      repeat, retract(indice(I)), %in variabila I verific ce valoare am in predicatul indice
                      (I==0 -> true; %daca valoarea e 0, am terminat de adaugat elemente in lista, ies din repeat
					  read(X), %daca nu, citesc din fisier
					  (X==end_of_file -> retract(ok(_)),assert(ok(0)),true; %daca am ajuns la end of file in acest punct, lui ok ii transmit valoarea 0, ca predicatul principal sa returneze no
					  retract(lista(OldL)),NewL=[X|OldL],assert(lista(NewL)),I1 is I-1,assert(indice(I1)),fail)),!.
%afiseaza(+Lista)					  
afiseaza([H|T]):-afiseaza(T),format('~d ',H). %efectuez afisarea
afiseaza([]).

/* Exemple de interogari

| ?- cit_scr_fis('in.txt','out.txt'). 
yes
| ?- cit_scr_fis('in2.txt','out2.txt').
no
| ?- cit_scr_fis('in3.txt','out3.txt').
yes

in.txt : 3. 2. 4. 5. 2. 2. 0. 3. 1. 3. 2. 4. 4. 1. 2. 3. 0. 2. 5. 3.
out.txt : 2 4 2 2 0 3 2 4 1 2 3 

in2.txt : 3. 2. 4. 5. 2. 2. 0. 3. 1. 3. 2. 4. 4. 1. 2. 3. 7. 2. 5. 3.

in3.txt: 3. 2. 4. 5. 2. 2. 0. 3. 1. 3. 2. 4. 4. 1. 2. 3. 7. 2. 5. 3. 6. 6. 6.
out3.txt: 2 4 2 2 0 3 2 4 1 2 3 2 5 3 6 6 6 

*/