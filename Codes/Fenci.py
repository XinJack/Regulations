import os
import jieba

# 将[词典]目录下的多份词典整合为可被jieba分词使用的词典
# 输出位置为当前文件夹下的dict.txt文件
def generate_dict():
	# 获取词典列表
	dict_list = list()
	for root_name, dir_list, file_list in os.walk(os.path.join(os.path.abspath('..'), '词库')):
		if len(file_list) != 0:
			for file in file_list:
				dict_list.append(os.path.join(root_name, file))

	# 输出文件位置
	output_dict_path =  os.path.join(os.getcwd(), 'dict.txt')
	# 若文件已存在，则删除，因为下面输出文件内容使用的是追加模式
	if os.path.exists(output_dict_path):
		os.remove(output_dict_path)
	for dict_path in dict_list:
		with open(dict_path, 'r', encoding='utf-8') as reader, open(output_dict_path, 'a', encoding='utf-8') as writer:
			for line in reader.readlines():
				writer.write(line)

# 利用自定义词典对【规范】文件夹下的规范条文进行分词，输出结果到outputs文件夹下
def fenci():
	# 输出文件位置
	output_dict_path =  os.path.join(os.getcwd(), 'dict.txt')
	# 使用用户自定义词典
	jieba.load_userdict(output_dict_path)
	# 去掉某些本不应该划分在一块的词
	jieba.suggest_freq(('不', '宜'), True)
	jieba.suggest_freq(('宜', '为'), True)
	jieba.suggest_freq(('不', '应'), True)
	jieba.suggest_freq(('不', '得'), True)
	jieba.suggest_freq(('地面', '排水'), True)

	for file_name in os.listdir(os.path.join(os.path.abspath('..'), '规范')):
		print(os.path.join(os.path.abspath('..'), '规范', file_name))
		with open(os.path.join(os.path.abspath('..'), '规范', file_name), 'r', encoding='utf-8') as reader, \
		open(os.path.join(os.path.abspath('..'), 'outputs', file_name[0:-4] + '-处理后.txt'), 'w', encoding='utf-8') as writer:
			for line in reader.readlines():
				writer.write('[')
				for word in jieba.cut(line):
					if word == '\n':
						break
					writer.write('[' + word + ']')
				writer.write(']\n')



if __name__ == '__main__':
	generate_dict()

	fenci()

