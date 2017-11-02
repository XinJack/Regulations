% 规则
mortal(X) :- person(X).

% 事实
person(socrates).
person(plato).
person(aristotle).

% 规则（包含输出）
mortal_report :-
write('Know mortals are:'), nl, mortal(X),
write(X), nl,
fail.