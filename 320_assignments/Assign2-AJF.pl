% this is prolog, not perl.

% find length of list
myLength([], 0).
myLength([X|Rest], Len) :- myLength(Rest, X), Len is +(1, X).

% find last entry in list
myLast(List, L).
myLast([Head|Rest], L) :- myLast(Rest,L).

% find max val in list
etc