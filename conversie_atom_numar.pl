conversie(AtomNr,Nr):-atom(AtomNr),atom_codes(AtomNr,Sir),number_codes(Nr,Sir).
conversie(AtomNr,Nr):-number(Nr),number_codes(Nr,Sir),atom_codes(AtomNr,Sir).
