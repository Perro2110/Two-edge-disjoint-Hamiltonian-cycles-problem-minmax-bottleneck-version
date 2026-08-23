:- use_module(library(clpfd)).

hams(Vs) :- length(Vs, 5), circuit(Vs), label(Vs).

inc(H1, N, C) :- nth1(H1, C, N), !.
inc(H1, N, C) :- nth1(N, C, H1), !.

div(_, [], _)  :- !.
div([], _, _)  :- !.
div([_], _, _) :- !.
div([H1|C1], C2, I) :- \+ inc(H1, I, C2), I2 is I+1, div(C1, C2, I2).

comb(C1, C2) :- hams(C1), hams(C2), div(C1, C2, 1).

prendiXY(X, Y, M, V) :- nth1(X, M, N), nth1(Y, N, V).

calcPesoIn(_, [], _, 0).
calcPesoIn(I, [H1|C], PESI, PESO) :- prendiXY(H1, I, PESI, N), I2 is I + 1, calcPesoIn(I2, C, PESI, PESO2), PESO is PESO2 + N.

calcPeso(C, PESI, PESO) :- calcPesoIn(1, C, PESI, PESO).

calcPesi(C1, C2, PESI, PESO1, PESO2) :- comb(C1, C2), calcPeso(C1, PESI, PESO1), calcPeso(C2, PESI, PESO2).