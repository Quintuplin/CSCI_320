% this is prolog, not perl.

% find length of list.
myLength([], 0).
myLength([_|Rest], Len) :- myLength(Rest, X), Len is +(1, X).

% find last entry in list.
myLast([Last], Last).
myLast([_|Rest], Last) :- myLast(Rest, Last).

% find max val in list.
% run by typing swipl prolog.pro.
% commands are run by typing myLength([1,2,3],X).