% ����
mortal(X) :- person(X).

% ��ʵ
person(socrates).
person(plato).
person(aristotle).

% ���򣨰��������
mortal_report :-
write('Know mortals are:'), nl, mortal(X),
write(X), nl,
fail.