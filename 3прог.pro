DOMAINS
    int_list = integer*

PREDICATES
    nondeterm input_list_size(integer)
    nondeterm input_list_elements(integer, int_list)
    nondeterm calculate_min(int_list, integer, integer)
    nondeterm get_min(int_list, integer)
    nondeterm calculate_max(int_list, integer, integer)
    nondeterm get_max(int_list, integer)

CLAUSES
    input_list_size(ListSize) :-
        write("Count of elements in list(>0): "),
        readint(ListSize).

    input_list_elements(0, []) :- !.
    input_list_elements(Remaining, [Element|Rest]) :-
        write("Enter element ", Remaining, ": "),
        readint(Element),
        NextRemaining = Remaining - 1,
        input_list_elements(NextRemaining, Rest).

    calculate_min([], CurrentMin, CurrentMin) :- !.
    calculate_min([Head|Tail], TempMin, FinalMin) :-
        Head < TempMin, !,
        calculate_min(Tail, Head, FinalMin).
    calculate_min([Head|Tail], TempMin, FinalMin) :-
        calculate_min(Tail, TempMin, FinalMin).

    get_min([FirstElement|RestList], MinValue) :-
        calculate_min(RestList, FirstElement, MinValue).

    calculate_max([], CurrentMax, CurrentMax) :- !.
    calculate_max([Head|Tail], TempMax, FinalMax) :-
        Head > TempMax, !,
        calculate_max(Tail, Head, FinalMax).
    calculate_max([Head|Tail], TempMax, FinalMax) :-
        calculate_max(Tail, TempMax, FinalMax).

    get_max([FirstElement|RestList], MaxValue) :-
        calculate_max(RestList, FirstElement, MaxValue).

GOAL
    input_list_size(Size),
    input_list_elements(Size, Numbers),
    get_min(Numbers, MinElement),
    get_max(Numbers, MaxElement),
    Difference = MaxElement - MinElement,
    write("Difference between max and min elements: ", Difference), nl.
