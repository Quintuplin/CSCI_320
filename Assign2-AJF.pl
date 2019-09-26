% CSCI 320 Assignment 2.
% Pothering.
% Jack Fraser.
% 9/26/2019.


% run by typing swipl prolog.pro.
% commands are run by typing myLength([1,2,3],X).


% 1. myLength(List, Len).
    % find length of list (done).

    myLength([], 0).
    myLength([_|Rest], Len) :- myLength(Rest, X), Len is +(1, X).


% 2. myLast(List, L).
    % find last entry in list (done).

    myLast([L], L).
    myLast([_|Rest], L) :- myLast(Rest, L).


% 3. myMax(List, MaxVal).
    % find max val in list.

    % submethods.
    % myTop is for double-dereferencing head within a single main loop.
    myTop([], 0).
    myTop([Head|_], Head).
    % myRest is for double-dereferencing rest within a single main loop.
    myRest([_], []).
    myRest([_|Rest], Rest).

    % base condition.
    % the last item left in the list is the largest.
    myMax([MaxVal], MaxVal).

    % condition for ascending segment.
    % removes head and repeats.
    myMax([Head|Rest], MaxVal) :- myTop(Rest, X), X >= Head, myMax(Rest, MaxVal).

    % condition for descending segment.
    % removes next head, puts current head back in, then repeats.
    myMax([Head|Rest], MaxVal) :- myTop(Rest, X), X < Head, myRest(Rest, Y), HeadZ = [Head|Y], myMax(HeadZ, MaxVal).


% 4. myRemove(X, List, Redlist).
    % remove x from list, return as Redlist.

    % base condition.
    myRemove(_, [], _).

    myRemove(X, [Head|Rest], Redlist) :- X != Head, myRemove(X, Rest, [Redlist|Head]).
    myRemove(X, [Head|Rest], Redlist) :- X == Head, myRemove(X, Rest, Redlist).
