p(a).
p(b).
p(c).
p(d).

afiseaza_tot:-repeat, p(X), write(X),get_char(_),!.
%afiseaza_tot: cauta p(X) in baza de cunostinte, unifica X cu a, il scrie pe a, apeleaza si predicatul get_char(_), totul este true, se termina.


afiseaza_tot1:-repeat, \+ (p(X), write(X),get_char(_)),!.
/*afiseaza_tot1: similar ca si tot, insa conditia este mereu negata, va returna fail si deci se intoarce la repeat,
 dar nu este o intoarcere din backtracking ci o noua interogare, de aceea se afiseaza mereu primul element gasit(adica a)*/
 
afiseaza_true_fail:-p(X),write(X),fail;true. 
/*se deosebeste de repeat prin faptul ca parcurge toata baza de cunostinte,returnand true la final.
Repeat e folosit mai mult atunci cand se schimba mediul*/

 
