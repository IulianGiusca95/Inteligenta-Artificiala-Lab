
:-use_module(library(system)).
test_sleep(N):-N>0,write('\r'),write(N),sleep(1),write('\b'),write('\r'), N1 is N-1, test_sleep(N1).
test_sleep(0):-write('\rBUUUUM!').

/*Ultimul numar pare ca lipseste fiindca mai intai se apela sleep, apoi afisa numarul, iar cand sa afiseze ultimul numar, il afisa prea repede si parea ca nu e acolo.*/
/*Daca avem un numar cu mai multe cifre, ramane 0 in consila fiindca noua cifra va fi scrisa preste vechiul continut, "neacoperind" tot numarul. */