mananca(ion,_). %Orice ii este atribuit celui de-al doilea parametru, atat timp cat primul parametru este ion, redicatul va returna yes.
obiect(_). %Returneaza Yes pentru orice valoare ia parametrul
obiect2(_):- obiect(_), 3=2. %Returneaza no daca obiect(_) returneaza yes. Pentru a obtine no am folosit o conditie despre care stiu sigur ca e falsa.



culoare(rosu).
culoare(oranj).
culoare(verde).
culoare(albastru).
culoare(indigo).
culoare(violet).

%contine(+obiect,:structura_de_tip_culoare) e corect?
%contine(curcubeu, culoare(_)). nu e corect deoarece as obtie yes pentru orice parametru i-as fi dat lui culoare
contine(curcubeu, culoare(X)):- culoare(X).
