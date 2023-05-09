tool
extends EditorPlugin

const TilemapInspectorPlugin = preload("res://addons/scripts_and_classes/tilemap_inspector_plugin.gd")

var tilemap_inspector_plugin: EditorInspectorPlugin

func _enter_tree() -> void:
	add_custom_type("PlaceholderSprite", "Node2D",
		preload("res://addons/scripts_and_classes/placeholder_sprite.gd"),
		null)
	tilemap_inspector_plugin = TilemapInspectorPlugin.new()
	add_inspector_plugin(tilemap_inspector_plugin)

func _exit_tree() -> void:
	remove_inspector_plugin(tilemap_inspector_plugin)
	tilemap_inspector_plugin = null
	remove_custom_type("PlaceholderSprite")
