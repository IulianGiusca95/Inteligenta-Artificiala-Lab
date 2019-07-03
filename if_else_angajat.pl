%angajat(nume, functie)
angajat(ionescu, vanzator).
angajat(popescu, vanzator).
angajat(georgescu, paznic).
angajat(florescu, paznic).
angajat(miaunel, 'prinzator de soareci').
angajat(chitz, soarece).
angajat(jerry, soarece).


%salariu(functie,salariu_lunar)
salariu(vanzator,ron(1500)).
salariu(paznic,ron(1300)).
salariu('prinzator de soareci', castroane_lapte(30)).
salariu(soarece, role_cascaval(4)).

%cost(tip_unitate, pret)
cost(castroane_lapte, ron(3)).
cost(role_cascaval, ron(20)).

%predicat care afiseaza costurile efective pentru fiecare salariat.
afis_salarii:-angajat(Nume,Functie),
if( salariu(Functie,ron(Sal)), %conditia
(format('~s ~15+# ~d ron \n',[Nume,Sal]) ),%ce se intampladaca e adevarata conditia
(salariu(Functie,P),%else
P=..[Unit,Nr],
cost(Unit, ron(C)),
Sal is Nr*C,
format('~s ~15+# ~d~` t~5+ ~15s = ~d ron \n',[Nume,Nr, Unit, Sal]))
), %sfarsit if
fail; true.
