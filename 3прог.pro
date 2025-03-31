DOMAINS
    int_list = integer*

PREDICATES
    nondeterm input_list_size(integer)
    nondeterm input_list_elements(integer, int_list)
    nondeterm calculate_min(int_list, integer, integer, integer)
    nondeterm get_min(int_list, integer)
    nondeterm calculate_max(int_list, integer, integer, integer)
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

    calculate_min([], CurrentMin, _, CurrentMin) :- !.
    calculate_min([Head|Tail], TempMin, TempCount, FinalMin) :-
        Head < TempMin, !,
        calculate_min(Tail, Head, 1, FinalMin).
    calculate_min([Head|Tail], TempMin, TempCount, FinalMin) :-
        Head = TempMin, !,
        UpdatedCount = TempCount + 1,
        calculate_min(Tail, TempMin, UpdatedCount, FinalMin).
    calculate_min([_|Tail], TempMin, TempCount, FinalMin) :-
        calculate_min(Tail, TempMin, TempCount, FinalMin).

    get_min([FirstElement|RestList], MinValue) :-
        calculate_min(RestList, FirstElement, 1, MinValue).

    calculate_max([], CurrentMax, _, CurrentMax) :- !.
    calculate_max([Head|Tail], TempMax, TempCount, FinalMax) :-
        Head > TempMax, !,
        calculate_max(Tail, Head, 1, FinalMax).
    calculate_max([Head|Tail], TempMax, TempCount, FinalMax) :-
        Head = TempMax, !,
        UpdatedCount = TempCount + 1,
        calculate_max(Tail, TempMax, UpdatedCount, FinalMax).
    calculate_max([_|Tail], TempMax, TempCount, FinalMax) :-
        calculate_max(Tail, TempMax, TempCount, FinalMax).

    get_max([FirstElement|RestList], MaxValue) :-
        calculate_max(RestList, FirstElement, 1, MaxValue).

GOAL
    input_list_size(Size),
    input_list_elements(Size, Numbers),
    get_min(Numbers, MinElement),
    get_max(Numbers, MaxElement),
    Difference = MaxElement - MinElement,
    write("Difference between max and min elements: ", Difference), nl.