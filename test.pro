:- use_module(library(clpfd)).

hams(Vs) :- length(Vs, 6), circuit(Vs), label(Vs).

pacman(H1, H2, [H1|C]) :- last(C, H2), !.
pacman(H1, H2, [H2|C]) :- last(C, H1).
pacman(_, _, [_|_]) :- false.

incIn(_, _, []) :- false.
incIn(H1, H2, [H2,H1|_]) :- !.
incIn(H1, H2, [H1,H2|_]) :- !.
incIn(H1, H2, [_|C]) :- incIn(H1, H2, C).

inc(H1, H2, C) :- pacman(H1, H2, C), !.
inc(H1, H2, C) :- incIn(H1, H2, C).

div(_, []) :- !.
div([], _) :- !.
div([_], _) :- !.
div([H1,H2|C1], C2) :- \+ inc(H1, H2, C2), div([H2|C1], C2).

comb(C1, C2) :- hams(C1), hams(C2), div(C1, C2).
