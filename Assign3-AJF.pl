% CSCI 320 Assignment 3
% Pothering
% Jack Fraser
% 10/03/2019


% run by typing (e.g.) swipl Assign3-AJF.pl
% commands are run by typing (e.g.) myLength([1,2,3],X).

% imports from prev homworks
    % myLength(List, Len)
    % find length of list

    % base case
    myLength([], 0).

    % increment count, reduce, and recurse
    myLength([_|Tail], Len) :-
        myLength(Tail, X),
        Len is +(1, X).


% 1. fib(N, FN)
    % fibonacci sequence
    % N is the index of the fibonacci number along the sequence (starting at 1)
    % FN is the value at that index

    % base case (1st and 2nd fibonacci numbers)
    fib(1, 1).
    fib(2, 1).

    % recursive case
    fib(N, FN) :-
        X is N-1, fib(X, V1),
        Y is N-2, fib(Y, V2),
        S = V1 + V2, FN = S.

% 2. ack(X, Y, A)
    % ackermann function
    % given integers X, Y, return the ackermann value A

    % formula cases
    ack(0, Y, Y+1).
    ack(X, 0, A) :- ack(X-1, 1, A).
    ack(X, Y, A) :- ack(X, Y-1, SS), ack(X-1, SS, A).

% 3. mergesort(List, MSorted)
    % integer list merge sort algorithm
    % accepts unsorted List, returns sorted MSorted
    % may utilize functors from previous assignments
    mergesort([X], [X]).
    mergesort(List, MSorted) :-
        myLength(List, Lenlist),
        R is Lenlist/2,
        sublist(List, R, LeftList, RightList),
        mergesort(LeftList, LeftSorted),
        mergesort(RightList, RightSorted),
        merge2(LeftSorted, RightSorted, MSorted).

    % supporting functions
    % sublist(List, R, Sublist, Rest)
        % accepts a list and an index
        % splits the list by the index in no particular order
        sublist([], _, [], []).
        sublist(X, 0, [], X).

        sublist([Head|Rest], R, Sublist, Rest) :-
            M is R-1,
            Sublist is [Head|Subrest],
            sublist(Rest, M, Subrest, Rest).

    % merge2(List1, List2, MergedSorted)
        % accepts two sorted lists of any length
        % appends elements to the merged list one at a time recursively
        merge2([], [], []).
        merge2([X], [], [X]).
        merge2([], [Y], [Y]).

        merge2([X|Xtail], [Y|Ytail], Rel) :=
            Rel = [X|Ltail],
            X > Y,
            merge2(Xtail, [Y|Ytail], Ltail).

        merge2([X|Xtail], [Y|Ytail], Rel) :=
            Rel = [Y|Ltail],
            X <= Y,
            merge2([X|Xtail], Ytail, Ltail).

% 4a. tree(Tree)
    % given a binary tree represented in sublists of sublists, return True or False
    % tree is in the form [root leftbranch rightbranch]
    % example; [a [b [] [c [] []]] [d [] [e [f [] []] []]]]

    single(_).
    single([]).
    tree(X) :- single(X).
    tree([Head, Taila, Tailb]) :-
        single(Head),
        tree(Taila), tree(Tailb).

% 4b. preorder(Tree, PreorderList)
    % given a binary tree Tree, return a preorder traversal of the tree
    % preorder displays first root, then leftbranch, then rightbranch, recursively

    % base case
    preorder([], []).
    preorder(X, [X]).
    preorder([Head, Taila, Tailb], List) :=
        List = [Head| Resta, Restb],
        preorder(Tailb, Resta),
        preorder(Taila, Restb).
