+ IfcPoint(实体)  
	抽象类型，表示1~3维笛卡尔坐标空间内的一个位置
	+ IfcCartesianPoint(子类实体)  
	代表笛卡尔空间坐标系中的一个点  
		- 1.Coordinates: (IfcLengthMeasure(Real实数)的列表)，Coordinates[1]代表X坐标，依此类推  
		- 2.Dim：(导出属性，类型为IfcDemensionCount(integer，值为1或2或3))维度
	+ IfcPointOnCurve(子类实体)  
	代表位于曲线上的一个点  
		- 1.BasicCurve: (类型为IfcCurve)
		- 2.PointParameter：(类型为IfcParameterValue(Real实数))点位置的参数值  
		- 3.Dim： ()


