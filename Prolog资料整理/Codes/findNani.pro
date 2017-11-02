% 定义房间
房间(厨房).
房间(办公室).
房间(大厅).
房间(餐厅).
房间(地下室).

% 定义物品的位置
位于(桌子, 办公室).
位于(苹果, 厨房).
位于(手电筒, 桌子).
位于(洗衣机, 地下室).
位于(nani, 洗衣机).
位于(西兰花, 厨房).
位于(饼干, 厨房).
位于(电脑, 办公室).

/*
% 定义房间的联系，由于Prolog能够区分door(office, hall)和door(hall, office)， 所以如果我们想要表达一种双向的联系，就必须把每种联系都定义一遍。
% 这里目前只设置了单向门
*/
门(办公室, 大厅).
门(厨房, 办公室).
门(大厅, 餐厅).
门(餐厅, 地下室).
门(餐厅, 厨房).

% 使用规则来实现双向门
相连(X, Y) :- 门(X, Y).
相连(X, Y) :- 门(Y, X).

% 定义物体属性
可食用(苹果).
可食用(饼干).

% 定义手电筒状态和玩家初始位置
关闭(手电筒).
位置(厨房).

% 定义列出房间信息规则
房间信息(Room) :- 位于(Thing, Room), tab(2), write(Thing), nl, fail. 房间信息(_).

% 定义列出相连房间信息规则
相邻房间(Room) :- 相连(Room, Room2), tab(2), write(Room2), nl, fail. 相邻房间(_).

% 定义查看房间信息规则
查看 :- 位置(Room), write("你现在位于 "), nl, tab(2), write(Room), nl, write("你可以看到的东西:"), nl, 房间信息(Room), write("你能够到达的房间："), nl, 相邻房间(Room).
