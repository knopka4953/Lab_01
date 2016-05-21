-module(lab_01).
-export([hi/0, fac/1, fib/1, member/2, cost_v1/1, fac_v2/1, fib_v2/1, member_v2/2, cost_v2/1]).

hi() ->
    io:format("Hello, World!").
    
fac(0) -> 1;
fac(1) -> 1;
fac(N) ->
    N * fac(N-1).
   
fib(1) -> 1;
fib(2) -> 1; 
fib(N) -> 
    fib(N-2) + fib(N-1).
    
member(_, []) -> false;
member(X, [X | _]) -> true;
member(X, [_| Tail]) -> member(X, Tail).

price(apple) -> 100; 
price(pear) -> 150; 
price(milk) -> 70; 
price(beef) -> 400; 
price(pork) -> 300.

cost_v1([]) -> 0;
cost_v1([{Item, Count}| Tail]) -> 
    price(Item) * Count + cost_v1(Tail).
    
    
% вариация с if и case
fac_v2(N) ->
    case N of
        0 -> 1;
        1 -> 1;
        _ -> N * fac_v2(N-1)
    end.
    
fib_v2(N) ->
    if N < 2 -> 1;
    true -> fib(N-2) + fib_v2(N-1)
    end.

member_v2(_, []) -> false;
member_v2(X, [Head | Tail]) ->
    if X == Head -> true;
    true -> member_v2(X, Tail)
    end.
    
cost_v2([{Item, Count} | Tail]) ->
    case Item of
        apple -> 100 * Count + cost_v2(Tail);
        pear -> 150 * Count + cost_v2(Tail);
        milk -> 70 * Count + cost_v2(Tail);
        beef -> 400 * Count + cost_v2(Tail);
        pork -> 300 * Count + cost_v2(Tail)
    end.