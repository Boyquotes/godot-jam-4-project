tool
extends Node2D

export var font: Font setget set_font
export var text := "" setget set_text
export var color := Color.white setget set_color

func _draw() -> void:
	if not text or not is_instance_valid(font):
		return
	
	var size := (font as Font).get_string_size(text)
	draw_string(font, -(size / 2.0), text)

func set_text(_text: String) -> void:
	text = _text
	update()
	update_configuration_warning()

func set_font(_font: Font) -> void:
	font = _font
	update()
	update_configuration_warning()

func set_color(_color: Color) -> void:
	color = _color
	update()
	update_configuration_warning()

func _get_configuration_warning() -> String:
	if not text:
		return "No text was provided. It will not be rendered."
	
	return ._get_configuration_warning()
