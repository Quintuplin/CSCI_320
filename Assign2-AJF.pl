% CSCI 320 Assignment 2
% Pothering
% Jack Fraser
% 9/26/2019


% run by typing swipl prolog.pro
% commands are run by typing myLength([1,2,3],X)


% submethods (written by me)
% quick and ugly shared methods to implement core functionality
    % myTop(List, Head)
        % myTop is for multi-dereferencing head within a method
        myTop([Head|_], Head).


    % myTail(List, Tail)
        % myTail is for multi-dereferencing tail within a method
        myTail([_|Tail], Tail).


    % merge(List1, List2, MergeList)
        % merge lists with duplicates intact, but order altered
        % quick and ugly merge

        % base case
        merge([],X,X).

        % remove head from list1, appends to list2, recurse
        merge([Head|Tail], List2, MergeList) :-
            Sublist = [Head|List2],
            merge(Tail, Sublist, MergeList).


% 1. myLength(List, Len)
    % find length of list

    % base case
    myLength([], 0).

    % increment count, reduce, and recurse
    myLength([_|Tail], Len) :-
        myLength(Tail, X),
        Len is +(1, X).


% 2. myLast(List, L)
    % find last entry in list

    % base case
    myLast([L], L).

    % reduce and recurse
    myLast([_|Tail], L) :- myLast(Tail, L).


% 3. myMax(List, MaxVal)
    % find max val in list

    % base case
    myMax([MaxVal], MaxVal).

    % condition for ascending segment (e.g. [1,2])
    % remove current head and recurse
    myMax([Head|Tail], MaxVal) :-
        myTop(Tail, NextHead),
        NextHead >= Head,
        myMax(Tail, MaxVal).

    % condition for descending segment (e.g. [2,1])
    % remove next head, replace current head, and recurse
    myMax([Head|Tail], MaxVal) :-
        myTop(Tail, NextHead),
        NextHead < Head,
        myTail(Tail, NextTail),
        myMax([Head|NextTail],
        MaxVal).


% 4. myRemove(X, List, Redlist)
    % remove x from list

    % base case
    myRemove(_, [], []).

    myRemove(X, [Head|Tail], Redlist) :-
        X \= Head,
        Redlist = [Head|Redtail],
        myRemove(X, Tail, Redtail).

    myRemove(X, [Head|Tail], Redlist) :-
        X = Head,
        myRemove(X, Tail, Redlist).

% 5. myPerm(List1, List2)
    % evaluate if list2 is a permuation of list1

    % base case
    myPerm([], []).

    % check, reduce, and recurse
    myPerm(List1, List2) :-
        myLength(List1, Len1),
        myLength(List2, Len2),
        Len1 = Len2,
        myTop(List1, Head1),
        myRemove(Head1, List1, Rem1),
        myRemove(Head1, List2, Rem2),
        myPerm(Rem1, Rem2).

% 6. intersect(List1, List2, IntList)
    % obtain the intersect of two lists
    % intersect = list of all elements in both, no duplicates

    % base case
    intersect([], _, []).

    % reduce and recurse w/ match
    intersect([Head|Tail], List2, IntList) :-
        myLength(List2, Len2),
        myRemove(Head, List2, Rem2),
        myLength(Rem2, Rlen2),
        Len2 > Rlen2,
        IntList = [Head|IntersectTail],
        intersect(Tail, Rem2, IntersectTail).

    % reduce and recurse w/ no match
    intersect([Head|Tail], List2, IntList) :-
        myLength(List2, Len2),
        myRemove(Head, List2, Rem2),
        myLength(Rem2, Rlen2),
        Len2 = Rlen2,
        intersect(Tail, Rem2, IntList).

% 7. union(List1, List2, UnionList)
    % obtain the union of two lists
    % union = list of all elements in either, no duplicates

    % single case
    union(List1, List2, UnionList) :-
        merge(List1, List2, Combolist),
        intersect(Combolist, Combolist, UnionList).