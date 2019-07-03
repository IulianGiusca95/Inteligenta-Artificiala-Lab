:- op(1000,yf, *i).
:- op(100,xfy,este).

(Z + T *i) este (A + B *i) + (C + D *i) :- Z is A+C, T is B+D.
(Z + T *i) este (A + B *i) * (C + D *i) :- Z is (A*C - B*D), T is (A*D + B*C).
