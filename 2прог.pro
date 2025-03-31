DOMAINS
    int_list = integer*

PREDICATES
    nondeterm read_list(integer, int_list)
    nondeterm minus(int_list, int_list, int_list)
    nondeterm symmetry(int_list, int_list, int_list)
    nondeterm member(integer, int_list)
    nondeterm append(int_list, int_list, int_list)

CLAUSES
    read_list(0, []) :- !.
    read_list(N, [H|T]) :-
        write("Enter the element: "),
        readint(H),
        N1 = N - 1,
        read_list(N1, T).

    member(H, [H|_]).
    member(H, [_|T]) :- member(H, T).

    append([], L, L).
    append([H|T], L, [H|Result]) :- append(T, L, Result).

    minus([], _, []).
    minus([H|T], L, Result) :-
        member(H, L),
        !,
        minus(T, L, Result).
    minus([H|T], L, [H|Result]) :-
        minus(T, L, Result).

    symmetry(A, B, SM) :-
        minus(A, B, A_B),
        minus(B, A, B_A),
        append(A_B, B_A, SM).

GOAL
    write("Enter the number of elements of the set A: "),
    readint(N_A),
    read_list(N_A, A),
    write("Enter the number of elements of set B: "),
    readint(N_B),
    read_list(N_B, B),
    symmetry(A, B, SM),
    write("Symmetric difference of sets: ", SM), nl.