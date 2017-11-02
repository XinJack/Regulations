
input_file = '待检查的规范-最终.txt'
output_file = 'rules.pro'

comparatorMap = {
	'不低于': '>=',
	'不高于': '=<',
	'不小于': '>=',
	'不大于': '=<',
	'低于': '<',
	'高于': '>',
	'小于': '<',
	'大于': '>',
	'为': '=:='
}

def str2list(string):
	'''
		将格式化的字符串转为列表
		string: 输入字符串，结构为"[null, null, 测试]"的信息
		return: 列表
	'''
	result = list()
	for item in string[1: -1].split(','):
		try:
			item = str2num(item.strip())
		except:
			pass
		finally:
			result.append(item)
	return result

def str2num(string):
	'''
		将字符串转成数字
		string: 输入的字符串
		return: num or str
	'''
	num = None
	if string.find('%') != -1:
		index = string.find('%')
		num = float(string[:index])
		return num / 100
	if string.find('/') != -1:
		index = string.find('/')
		left = float(string[:index])
		right = float(string[index+1:])
		return left / right
	if string.find(':') != -1:
		index = string.find(':')
		left = float(string[:index])
		right = float(string[index+1:])
		return left / right
	try:
		num = float(string)
		return num
	except:
		return string

def list2rule(original_code, codelist):
	'''
		根据将规范主体列表自动生成prolog逻辑规则
		original_code: 原始规范条文
		codelist: 规范主体列表，如['null', 'null', 'null', 'null', '卧室', '局部净高', '不低于', 2.1, 'm']
		return: str， prolog逻辑规则
	'''
	[object1, subject, action, object2, object3, attribute, comparator, value, unit] = codelist # 规范主体的各部分
	variables = [item for item in reversed('ABCDEFGHIJKLMNOPQRSTUVWXYZ')] # 变量列表[A - Z]
	variable_dict = dict() # 名称与变量的对应表
	result = 'check :- write("正在检查条文：{0}"), nl, '.format(original_code)
	sublist = list() # 存放子句的列表，目的是为了剔除重复地子句
	if object1 != 'null' and subject != 'null':
		for key in [object1, subject]:
			variable_dict.setdefault(key, variables.pop())
		for item in ['{0}({1})'.format(object1, variable_dict[object1]), 
			'{0}({1})'.format(subject, variable_dict[subject]), 
			'组成成分({0}, {1})'.format(variable_dict[object1], variable_dict[subject])]:
			if item not in sublist:
				sublist.append(item)
		# result += '{0}({2}), {1}({3}), 组成成分({2}, {3}), '.format(object1, subject, variable_dict[object1], variable_dict[subject])
	if subject != 'null' and action != 'null' and object2 != 'null':
		for key in [subject, object2]:
			variable_dict.setdefault(key, variables.pop())
		for item in ['{0}({1})'.format(subject, variable_dict[subject]),
			'{1}({1})'.format(object2, variable_dict[object2]),
			'{0}({1}, {2})'.format(action, variable_dict[subject], variable_dict[object2])]:
			if item not in sublist:
				sublist.append(item)
		# result += '{1}({3}), {2}({4}), {0}({3}, {4}), '.format(action, subject, object2, variable_dict[subject], variable_dict[object2])
	for key in [object3, attribute, 'guid']:
		variable_dict.setdefault(key, variables.pop())
	for item in ['{0}({1})'.format(object3, variable_dict[object3]),
		'guid({0}, {1})'.format(variable_dict[object3], variable_dict['guid']),
		'{0}({1}, {2})'.format(attribute, variable_dict[object3], variable_dict[attribute]),
		'not({0} {1} {2})'.format(variable_dict[attribute], comparatorMap.get(comparator), value),
		'tab(4)', 'write("{0}(")'.format(object3), 'write({0})'.format(variable_dict['guid']), 'write(")不通过")', 'nl', 'fail']:
		if item not in sublist:
			sublist.append(item)
	# result += '{0}({2}), guid({2}, {6}), {1}({2}, {3}), not({3} {4} {5}), tab(4), write("不通过"), nl, fail.'.format(object3,
	 # attribute, variable_dict[object3], variable_dict[attribute], comparatorMap.get(comparator), value, variable_dict['guid'])
	result += ', '.join(sublist)
	result += '.'
	return result

with open(input_file, 'r', encoding='utf-8') as f:
	original_code = None # 规范条文
	code = None # 结构体列表
	while True:
		# strip用于去除最后的换行符
		original_code = f.readline().strip()
		code = str2list(f.readline().strip())
		if original_code == '' or len(code) == 0:
			break
		print(original_code)
		print(code)
		print(list2rule(original_code, code))
		print('\n')
