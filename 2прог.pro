DOMAINS
    int_list = integer*

PREDICATES
    nondeterm read_list(integer, int_list)
    nondeterm member(integer, int_list)
    nondeterm subset(int_list, int_list)
    nondeterm one_is_subset(int_list, int_list)
    nondeterm check_subset(int_list, int_list)

CLAUSES
    
    read_list(0, []) :- !.
    read_list(N, [H|T]) :-
        write("Enter element: "),
        readint(H),
        N1 = N - 1,
        read_list(N1, T).

    
    member(H, [H|_]).
    member(H, [_|T]) :- member(H, T).

    
    subset([], _).
    subset([H|T], B) :- member(H, B), subset(T, B).

    
    one_is_subset(A, B) :- subset(A, B); subset(B, A).

   
    check_subset(A, B) :-
        one_is_subset(A, B),
        !,
        write("YES").
    check_subset(_, _) :-
        write("NO").

GOAL
    write("Enter count A: "),
    readint(N_A),
    read_list(N_A, A),
    write("Enter count B: "),
    readint(N_B),
    read_list(N_B, B),
    check_subset(A, B). 
