DOMAINS
    digit = integer     
    number = integer   

PREDICATES
    nondeterm digit(digit)                   
    nondeterm different_digits(digit, digit, digit) 
    nondeterm make_number(digit, digit, digit, number) 
    nondeterm unique_digit_number(number)     

CLAUSES
    digit(0). digit(1). digit(2). digit(3). digit(4).
    digit(5). digit(6). digit(7). digit(8). digit(9).

    different_digits(D1, D2, D3) :-
        digit(D1), D1 >= 1, D1 <= 9,    
        digit(D2), D2 <> D1,            
        digit(D3), D3 <> D1, D3 <> D2.  

    make_number(D1, D2, D3, N) :-
        N = 100 * D1 + 10 * D2 + D3.    

    unique_digit_number(N) :-
        different_digits(D1, D2, D3),
        make_number(D1, D2, D3, N).

GOAL
    write("a list of all three-digit numbers with no identical digits in the decimal notation\n"),
    unique_digit_number(N),
    write(N), nl,    
    fail.            