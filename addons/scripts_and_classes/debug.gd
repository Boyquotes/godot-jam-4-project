tool
extends Reference

const PREFIX := "DEBUG: "

var _instance

func _init(instance) -> void:
	_instance = instance

func dprint(msg: String, args = null) -> void:
	if OS.has_feature('debug'):
		if args:
			print(str(PREFIX, _instance, ": "), msg % args)
		else:
			print(PREFIX, _instance, ": ", msg)
