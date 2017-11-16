'住宅'(X) :- 'IFC类型'(X, 'IfcBuilding'), '建筑物功能'(X, '住宅').
'新区'(X) :- 'IFC类型'(X, 'IfcBuilding'), '场地用途'(X, '新区').
'卧室'(X) :- 'IFC类型'(X, 'IfcSpace'), '房间功能'(X, '卧室').
'走廊'(X) :- 'IFC类型'(X, 'IfcSpace'), '房间功能'(X, '走廊').
'起居室'(X) :- 'IFC类型'(X, 'IfcSpace'), '房间功能'(X, '起居室').
'厨房'(X) :- 'IFC类型'(X, 'IfcSpace'), '房间功能'(X, '厨房').
'卫生间'(X) :- 'IFC类型'(X, 'IfcSpace'), '房间功能'(X, '卫生间').
'楼梯'(X) :- 'IFC类型'(X, 'IfcStair').
'阳台栏杆'(X) :- 'IFC类型'(X, 'IfcRailing'), '栏杆功能'(X, '阳台栏杆').
'防护栏杆'(X) :- 'IFC类型'(X, 'IfcRailing'), '栏杆功能'(X, '防护栏杆').
'排气道'(X) :- 'IFC类型'(X, 'IfcFlowSegment'), '管道类型'(X, '排气道').
check :- write('正在检查条文：新区的绿地率不应低于30%。'), nl, '新区'(A), '绿地率'(A, B), not(B >= 0.3), tab(4), write('新区('), write(A), write(')的'), write('绿地率为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：防护栏杆的垂直杆件间净距不应大于0.11m。'), nl, '防护栏杆'(A), '垂直杆件净距'(A, B), not(B =< 0.11), tab(4), write('防护栏杆('), write(A), write(')的'), write('垂直杆件净距为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卧室的室内净高不应低于2.40m。'), nl, '卧室'(A), '室内净高'(A, B), not(B >= 2.4), tab(4), write('卧室('), write(A), write(')的'), write('室内净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室的室内净高不应低于2.40m。'), nl, '起居室'(A), '室内净高'(A, B), not(B >= 2.4), tab(4), write('起居室('), write(A), write(')的'), write('室内净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卧室的局部净高不应低于2.10m。'), nl, '卧室'(A), '局部净高'(A, B), not(B >= 2.1), tab(4), write('卧室('), write(A), write(')的'), write('局部净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室的局部净高不应低于2.10m。'), nl, '起居室'(A), '局部净高'(A, B), not(B >= 2.1), tab(4), write('起居室('), write(A), write(')的'), write('局部净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：走廊的净宽不应小于1.20m。'), nl, '走廊'(A), '净宽'(A, B), not(B >= 1.2), tab(4), write('走廊('), write(A), write(')的'), write('净宽为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：楼梯梯段净宽不应小于1.10m。'), nl, '楼梯'(A), '梯段净宽'(A, B), not(B >= 1.1), tab(4), write('楼梯('), write(A), write(')的'), write('梯段净宽为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：楼梯踏步宽度不应小于0.26m。'), nl, '楼梯'(A), '踏步宽度'(A, B), not(B >= 0.26), tab(4), write('楼梯('), write(A), write(')的'), write('踏步宽度为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：楼梯踏步高度不应大于0.175m。'), nl, '楼梯'(A), '踏步高度'(A, B), not(B =< 0.175), tab(4), write('楼梯('), write(A), write(')的'), write('踏步高度为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：楼梯扶手高度不应小于0.90m。'), nl, '楼梯'(A), '扶手高度'(A, B), not(B >= 0.9), tab(4), write('楼梯('), write(A), write(')的'), write('扶手高度为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：住宅结构的设计使用年限不应少于50年。'), nl, '住宅结构'(A), '设计使用年限'(A, B), not(B >= 50.0), tab(4), write('住宅结构('), write(A), write(')的'), write('设计使用年限为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：住宅结构用混凝土的强度等级不应低于C20。'), nl, '住宅结构'(A), '混凝土'(B), '属于'(B, '住宅结构'), '强度等级'(B, D), not(D >= 20.0), tab(4), write('混凝土('), write(B), write(')的'), write('强度等级为'), write(D), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卧室窗地面积比不应小于1/7。'), nl, '卧室'(A), '窗地面积比'(A, B), not(B >= 0.14285714285714285), tab(4), write('卧室('), write(A), write(')的'), write('窗地面积比为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室窗地面积比不应小于1/7。'), nl, '起居室'(A), '窗地面积比'(A, B), not(B >= 0.14285714285714285), tab(4), write('起居室('), write(A), write(')的'), write('窗地面积比为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：厨房窗地面积比不应小于1/7。'), nl, '厨房'(A), '窗地面积比'(A, B), not(B >= 0.14285714285714285), tab(4), write('厨房('), write(A), write(')的'), write('窗地面积比为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：双人卧室的使用面积不应小于9㎡。'), nl, '双人卧室'(A), '使用面积'(A, B), not(B >= 9.0), tab(4), write('双人卧室('), write(A), write(')的'), write('使用面积为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：单人卧室的使用面积不应小于5㎡。'), nl, '单人卧室'(A), '使用面积'(A, B), not(B >= 5.0), tab(4), write('单人卧室('), write(A), write(')的'), write('使用面积为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：兼起居的卧室的使用面积不应小于12㎡。'), nl, '卧室'(A), 'B'(B), '兼'(A, B), '使用面积'(A, D), not(D >= 12.0), tab(4), write('卧室('), write(A), write(')的'), write('使用面积为'), write(D), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室的使用面积不应小于10㎡。'), nl, '起居室'(A), '使用面积'(A, B), not(B >= 10.0), tab(4), write('起居室('), write(A), write(')的'), write('使用面积为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：单排布置设备的厨房净宽不应小于1.50m。'), nl, '厨房'(A), 'B'(B), '单排布置'(A, B), '净宽'(A, D), not(D >= 1.5), tab(4), write('厨房('), write(A), write(')的'), write('净宽为'), write(D), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：双排布置设备的厨房其两排设备之间的净距不应小于0.90m。'), nl, '厨房'(A), 'B'(B), '双排布置'(A, B), '两排设备'(C), '净距'(C, D), not(D >= 0.9), tab(4), write('两排设备('), write(C), write(')的'), write('净距为'), write(D), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：住宅层高宜为2.80m。'), nl, '住宅'(A), '层高'(A, B), not(B =:= 2.8), tab(4), write('住宅('), write(A), write(')的'), write('层高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卧室的室内净高不应低于2.40m。'), nl, '卧室'(A), '室内净高'(A, B), not(B >= 2.4), tab(4), write('卧室('), write(A), write(')的'), write('室内净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室的室内净高不应低于2.40m。'), nl, '起居室'(A), '室内净高'(A, B), not(B >= 2.4), tab(4), write('起居室('), write(A), write(')的'), write('室内净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卧室的局部净高不应低于2.10m。'), nl, '卧室'(A), '局部净高'(A, B), not(B >= 2.1), tab(4), write('卧室('), write(A), write(')的'), write('局部净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室的局部净高不应低于2.10m。'), nl, '起居室'(A), '局部净高'(A, B), not(B >= 2.1), tab(4), write('起居室('), write(A), write(')的'), write('局部净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：厨房的室内净高不应低于2.20m。'), nl, '厨房'(A), '室内净高'(A, B), not(B >= 2.2), tab(4), write('厨房('), write(A), write(')的'), write('室内净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卫生间的室内净高不应低于2.20m。'), nl, '卫生间'(A), '室内净高'(A, B), not(B >= 2.2), tab(4), write('卫生间('), write(A), write(')的'), write('室内净高为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：阳台栏杆的垂直杆件间净距不应大于0.11m。'), nl, '阳台栏杆'(A), '垂直杆件净距'(A, B), not(B =< 0.11), tab(4), write('阳台栏杆('), write(A), write(')的'), write('垂直杆件净距为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：楼梯平台净宽不得小于1.20m。'), nl, '楼梯'(A), '平台净宽'(A, B), not(B >= 1.2), tab(4), write('楼梯('), write(A), write(')的'), write('平台净宽为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：厨房排气道接口直径应大于150mm。'), nl, '厨房'(A), '排气道'(B), '属于'(B, '厨房'), '接口直径'(B, D), not(D > 150.0), tab(4), write('排气道('), write(B), write(')的'), write('接口直径为'), write(D), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卫生间排气道接口直径应大于80mm。'), nl, '卫生间'(A), '排气道'(B), '属于'(B, '卫生间'), '接口直径'(B, D), not(D > 80.0), tab(4), write('排气道('), write(B), write(')的'), write('接口直径为'), write(D), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：卧室的采光系数不应低于1%。'), nl, '卧室'(A), '采光系数'(A, B), not(B >= 0.01), tab(4), write('卧室('), write(A), write(')的'), write('采光系数为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：起居室的采光系数不应低于1%。'), nl, '起居室'(A), '采光系数'(A, B), not(B >= 0.01), tab(4), write('起居室('), write(A), write(')的'), write('采光系数为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
check :- write('正在检查条文：厨房的采光系数不应低于1%。'), nl, '厨房'(A), '采光系数'(A, B), not(B >= 0.01), tab(4), write('厨房('), write(A), write(')的'), write('采光系数为'), write(B), write('，不符合规范要求。不通过'), nl, fail.
