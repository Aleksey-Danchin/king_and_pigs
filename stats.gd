extends Resource
class_name StatsResource

@export var dic: Dictionary = {}

func take (key: String, default_value = 0.0):
	return dic.get(key, default_value)
