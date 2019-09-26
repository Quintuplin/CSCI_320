% CSCI 320 Assignment 2.
% Pothering.
% Jack Fraser.
% 9/26/2019.


% run by typing swipl prolog.pro.
% commands are run by typing myLength([1,2,3],X).


% submethods.
    % myTop is for multi-dereferencing head within a single main loop.
    myTop([Head|_], Head).

    % myRest is for multi-dereferencing tail within a single main loop.
    myRest([_|Tail], Tail).


% 1. myLength(List, Len).
    % find length of list (done in class).

    myLength([], 0).
    myLength([_|Tail], Len) :- myLength(Tail, X), Len is +(1, X).


% 2. myLast(List, L).
    % find last entry in list (done in class).

    myLast([L], L).
    myLast([_|Tail], L) :- myLast(Tail, L).


% 3. myMax(List, MaxVal).
    % find max val in list.

    % base condition.
    % the last item left in the list is the largest.
    myMax([MaxVal], MaxVal).

    % condition for ascending segment.
    % removes head and repeats.
    myMax([Head|Tail], MaxVal) :- myTop(Tail, X), X >= Head, myMax(Tail, MaxVal).

    % condition for descending segment.
    % removes next head, puts current head back in, then repeats.
    myMax([Head|Tail], MaxVal) :- myTop(Tail, X), X < Head, myRest(Tail, Y), myMax([Head|Y], MaxVal).


% 4. myRemove(X, List, Redlist).
    % remove x from list, return as Redlist.

    % base condition.
    myRemove(_, [], []).

    myRemove(X, [Head|Tail], Redlist) :- X \= Head, Redlist = [Head|Redtail], myRemove(X, Tail, Redtail).
    myRemove(X, [Head|Tail], Redlist) :- X = Head, myRemove(X, Tail, Redlist).

% 5. myPerm(List1, List2).
    % evaluate if list2 is a permuation of list1.

    % base case
    myPerm([], []).

    % check and recurse
    myPerm(List1, List2) :- myLength(List1, Len1), myLength(List2, Len2), Len1 = Len2, myTop(List1, Head1), myRemove(Head1, List1, Rem1), myRemove(Head1, List2, Rem2), myPerm(Rem1, Rem2).

% 6. intersect(List1, List2, IntList).
    % obtain a list of common elements between lists 1 and 2.

    % base case.
    intersect([], _, []).

    % recurse w/ match.
    intersect([Head|Tail], List2, IntList) :- myLength(List2, Len2), myRemove(Head, List2, Rem2), myLength(Rem2, Rlen2), Len2 > Rlen2, IntList = [Head|IntersectTail], intersect(Tail, Rem2, IntersectTail).

    % recurse w/ no match.
    intersect([Head|Tail], List2, IntList) :- myLength(List2, Len2), myRemove(Head, List2, Rem2), myLength(Rem2, Rlen2), Len2 = Rlen2, intersect(Tail, Rem2, IntList).

% 7. union(List1, List2, UnionList).
    % obtain the union of two lists (containing elements from both but no duplicates).

    % merge lists.
    merge(List1, [Head|Tail], MergeList) :-
        Sublist = [Head|List1],
        merge(Sublist, Tail, MergeList).

    % main case.
    union(List1, List2, UnionList) :-
        merge(List1, List2, Combolist),
        intersect(Combolist, Combolist, UnionList).