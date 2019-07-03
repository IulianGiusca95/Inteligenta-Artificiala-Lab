% Giusca Iulian 242
% 11.3.2016

% Predicat care primeste ca parametru Temperatura, simptomul si categoria de varsta si repartizeaza pacientii la un spital(unde e cazul), determina modul in care sunt transportati si programul de ingrijire.
% M-am folosit de niste predicate ajutatoare:
% -setTemperatura: pe baza valorii in grade celsius am determinat febra severa,febra mare etc.
% -setStare: baza de cunostinte care asociaza diferitelor tipuri de simptom starea acestora
% -setSpital: in functie de temperatura, Stare si varsta decide la ce spital sunt pacientii repartizati
% -setTransport: in functie de spitalul unde sunt repartizati si de stare, se decide ce tip de transport e necesar
% -setProgram: pentru pacientii spitalizati, in functie de varsta si stare se decide de ce program de ingrijire beneficiaza 

/*
setTemperatura(+X,-Y)
-in X se afla temperatura in grade celsius
-in Y se va decide ce fel de temperatura e (febra,hipotermie etc.)
*/
setTemperatura(X,Y):- number(X), X>43, Y='febra severa'.
setTemperatura(X,Y):- number(X), X>=38, X<43, Y='febra mare'.
setTemperatura(X,Y):- number(X), X>=37.5, X<38, Y='febra'.
setTemperatura(X,Y):- number(X), X>=36.3, X<37.5, Y='temperatura normala'.
setTemperatura(X,Y):- number(X), X>=35, X<36.3, Y='temperatura scazuta'.
setTemperatura(X,Y):- number(X), X>=32, X<35, Y='hipotermie'.
setTemperatura(X,Y):- number(X), X<32, Y='hipotermie severa'.

/*
setStare(+X,-Y)
-in X este dat simptomul
-in Y se afla categoria din care face parte simptomul
*/
setStare('hemoragie','stare grava').
setStare('arsuri','stare grava').
setStare('inconstient','stare grava').
setStare('fara puls','stare grava').
setStare('foarte palid','stare posibil contagioasa').
setStare('tremuraturi','stare posibil contagioasa').
setStare('rani superficiale','afectiuni medii').
setStare('fara rani vizibile','afectiuni medii').

/*
setSpital(+Temp,+Stare,+Varsta,-H)
-Temp este clasa de temperatura determinata de setTemperatura
-Stare este categoria de afectiuni determinata de setStare
-Varsta (mai bine spus categoria de varsta) e data ca parametru de intrare
-in H se va decide spitalul unde sunt pacientii repartizati pe baza celor 3 parametri de mai sus
*/
setSpital(Temp,Stare,Varsta,H):- (Varsta=='adult';Varsta=='persoana in varsta'),(Temp=='febra';Temp=='hipotermie'),Stare='afectiuni medii',H='Spitalul general'.
setSpital(Temp,Stare,Varsta,H):- Stare=='stare grava';Temp=='febra mare';Temp=='febra severa',H='Spitalul de urgenta'.
setSpital(Temp,Stare,Varsta,H):- Varsta=='copil',(Temp=='temperatura normala';Temp=='temperatura scazuta'),Stare=='afectiuni medii',H='Spitalul pediatric'.
setSpital(Temp,Stare,Varsta,H):- Stare=='stare posibil contagioasa', H='Spitalul pentru boli contagioase'.
setSpital(Temp,Stare,Varsta,H):- (Varsta=='adult';Varsta=='persoana in varsta'),Stare=='afectiuni medii',(Temp=='temperatura normala';Temp=='temperatura scazuta'),H='Tratati la fata locului'.

/*
setTransport(+H,+S,-Tr)
-in H se regaseste spitalul aflat prin predicatul setSpital
-in S e categoria de afectiuni(Starea)
-in Tr se va determina modul de transport in functie de cei 2 parametri
*/
setTransport(H,S,Tr):- S=='stare grava', ((H\=='Spitalul pentru arsuri',Tr='Ambulanta de reanimare');Tr='Elicopter').
setTransport(H,S,Tr):- S=='stare posibil contagioasa';(S=='afectiuni medii',H\=='Tratati la fata locului'),Tr='Ambulanta normala'.
setTransport(H,S,Tr):- Tr='nimic'.
/*
setTransport(+Stare,+V,-Program)
-Stare este categoria de afectiuni determinata de setStare
-in V este Varsta (mai bine spus categoria de varsta) data ca parametru de intrare
-in Program se va determina programul de ingrijire a pacientilor spitalizati
*/
setProgram(Stare,V,Program):- V=='adult',Stare=='afectiuni medii',Program='O data pe zi'.
setProgram(Stare,V,Program):- (((V=='copil';V=='persoana in varsta'),Stare=='afectiuni medii');(V=='adult',Stare=='stare posibil contagioasa')),Program='2-3 ori pe zi'.
setProgram(Stare,V,Program):- (Stare=='stare grava';((V=='copil';V=='persoana in varsta'),Stare=='stare posibil contagioasa')),Program='foarte des'.

/* --- Predicat principal ---
pacient(+Temp,+S,+V,-H,-Tr,-Pr)
-Temp:temperatura in grade celsius
-S:simptomul
-V:categoria de varsta
-H:spitalul unde sunt pacientii repartizati
-Tr:Modul de transport
-Pr:Programul de ingrijire
in Temp1 se afla tipul de temperatura, in S1 tipul de stare.
Daca in S aveam 'arsuri' atunci H devenea automat 'Spitalul pentru arsuri'. Altfel, apelam setSpital.
Apoi determin modul de transport.
Daca pacientii sunt spitalizati(in H am altceva decat 'Tratati la fata locului' sau 'Nu e spitalizat') atunci se determina si un program de ingrijire.
*/
pacient(Temp,S,V,H,Tr,Pr):- setTemperatura(Temp,Temp1),setStare(S,S1),((S=='arsuri',H='Spitalul pentru arsuri');setSpital(Temp1,S1,V,H)),setTransport(H,S1,Tr),((H\=='Nu e spitalizat',H\=='Tratati la fata locului',setProgram(H,S1,V,Pr));Pr='nu are program').

/*
Exista caz cand problema nu are solutie? DA!
Pot ajunge in situatia in care, prin criteriile date, unui pacient sa nu ii fie repartizat niciun spital.De exemplu:

| ?- pacient(30,'fara rani vizibile','copil',H,Tr,Pr).
no


Exista cazuri cand sunt doua solutii?
Da. Cand nu reuseste sa determine un spital, dar apeleaza functia de setTransport si setProgram, incearca sa ghiceasca care ar putea fi modul de transport sau programul apeland backtracking.
| ?- pacient(32,'hemoragie','persoana in varsta',H,Tr,Pr).           
Tr = 'Ambulanta de reanimare',
Pr = 'foarte des' ? ;                                                    
Tr = 'Ambulanta de reanimare',
Pr = 'nu are program' ? ;
Tr = 'Elicopter',
Pr = 'foarte des' ? ;
Tr = 'Elicopter',
Pr = 'nu are program' ? ;
Tr = nimic,
Pr = 'foarte des' ? ;
Tr = nimic,
Pr = 'nu are program' ? ;
no


| ?- pacient(36,'arsuri','adult',H,Tr,Pr).
H = 'Spitalul pentru arsuri',
Tr = 'Elicopter',
Pr = 'foarte des' ? y
yes

| ?- pacient(37.8,'rani superficiale','adult',H,Tr,Pr).              
H = 'Spitalul general',
Tr = 'Ambulanta normala',
Pr = 'O data pe zi' ? ;
H = 'Spitalul general',
Tr = 'Ambulanta normala',
Pr = 'nu are program' ? ;
H = 'Spitalul general', //Daca nu aleg niciun mod de transport, intra pe cazul cand la transport alege 'nimic' => mai multe posibilitati

*/