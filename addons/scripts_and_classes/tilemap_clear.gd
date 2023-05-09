tool
extends Control

onready var confirmation: VBoxContainer = $"%Confirmation"

func _ready() -> void:
	confirmation.hide()

func _on_yes() -> void:
	confirmation.hide()
	$ClearButton.disabled = false
	
	# Clear tilemap
	var tilemap: TileMap = get_meta('tilemap')
	assert(is_instance_valid(tilemap))
	tilemap.clear()
	
	hide()

func _on_no() -> void:
	confirmation.hide()
	$ClearButton.disabled = false

func _on_ask_clear() -> void:
	confirmation.show()
	$ClearButton.disabled = true
