% CSCI 320 Assignment 3
% Pothering
% Jack Fraser
% 10/03/2019


% run by typing (e.g.) swipl Assign3-AJF.pl
% commands are run by typing (e.g.) myLength([1,2,3],X).


% submethods
% quick and ugly shared methods to implement core functionality
    % myTop(List, Head)
        % myTop is for multi-dereferencing head within a method
        myTop([Head|_], Head).


    % myTail(List, Tail)
        % myTail is for multi-dereferencing tail within a method
        myTail([_|Tail], Tail).


    % merge(List1, List2, MergeList)
        % merge lists with duplicates intact in no particular order
        % quick and ugly merge

        % base case
        merge([],X,X).

        % remove head from list1, appends to list2, recurse
        merge([Head|Tail], List2, MergeList) :-
            Sublist = [Head|List2],
            merge(Tail, Sublist, MergeList).


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
    % may utilize functors from previous assignment

    mergesort([X], [X]).
    mergesort(List, MSorted) :- len(List, Lenlist), R is Lenlist/2, mergesort(List, 1, R).
    mergesort(List, L, R) :- M is (L+R)/2, mergesort(List, L, M, Sort1), mergesort(List, M+1, R, Sort2).

    merge([X], [], [X]).
    merge([], [Y], [Y]).
    merge([X], [Y], List) := X > Y, List is [X, Y].
    merge([X], [Y], List) := X <= Y, List is [Y, X].
    merge([Xhead|Xtail], [Yhead|Ytail], List) := 
        merge([Xhead], [Yhead], S1),
        

% 4a. tree(Tree)
    % given a binary tree represented in sublists of sublists, return True or False
    % tree is in the form [root leftbranch rightbranch]
    % example; [a [b [] [c [] []]] [d [] [e [f [] []] []]]]

    tree([]).
    tree(_).
    tree[Head|Taila, Tailb] :- tree[Taila], tree[Tailb].

% 4b. preorder(Tree, PreorderList)
    % given a binary tree Tree, return a preorder traversal of the tree
    % preorder displays first root, then leftbranch, then rightbranch, recursively

    % base case
    preorder([], []).
    preorder(X, [X|Rest]).
    preorder([Head|Taila, Tailb], [Head|Rest]) := 
        preorder([Tailb], Rest),
        preorder([Taila], Rest).
