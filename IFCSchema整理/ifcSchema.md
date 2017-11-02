+ IfcPoint(抽象实体)  
	抽象类型，表示1~3维笛卡尔坐标空间内的一个位置
	+ IfcCartesianPoint(子类实体)  
	代表笛卡尔空间坐标系中的一个点  
		- 1.Coordinates: (IfcLengthMeasure(Real实数)的列表)，Coordinates[1]代表X坐标，依此类推  
		- 2.Dim：(导出属性，类型为IfcDemensionCount(integer，值为1或2或3))维度
	+ IfcPointOnCurve(子类实体)  
	代表位于曲线上的一个点  
		- 1.BasicCurve: (类型为IfcCurve) 点所在的曲线
		- 2.PointParameter：(类型为IfcParameterValue(Real实数))点位置的参数值  
		- 3.Dim：维度  
	+ IfcPointOnSurface(子类实体)  
	代表位于参数化表面上的一个点  
		- 1.BasicSurface: (类型为IfcSurface) 点所在的表面
		- 2.PointParameterU: (类型为IfcParameterValue) 点位置的第一个参数
		- 3.PointParameterV：(类型为IfcParameterValue) 点位置的第二个参数
		- 4.Dim：维度
+ IfcBoundedCurve(抽象实体)
	抽象实体，表示带有确定端点的有限长度的曲线  
	+ IfcCompositeCurve(子类实体)  
	代表由一系列端对端连接的曲线组成的曲线

+ IfcRailing  
代表栏杆


