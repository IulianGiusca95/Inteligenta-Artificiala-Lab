:-dynamic p/1.

p(a).
p(b).
p(c).
p(d).

afiseaza_tot2:-repeat, \+ (p(X),retract(p(X)), write(X),get_char(_),listing(p),assert(p(X)),get_char(_)),!.
/* Dezavantajul e acela ca in urma afisarii, au fost sterse cunostintele din cauza lui retract.
Putem rezolva, facand afisarea cu ...fail;true*/

afiseaza_tot_fail_true:-p(X),write(X),get_char(_),fail;true.
