extends ToolButton

var dialog: ConfirmationDialog

func _ready() -> void:
	text = "Clear Tilemap"
	dialog = ConfirmationDialog.new()
	dialog.get_cancel().connect("pressed", self, "_on_cancel_pressed")
	dialog.connect("confirmed", self, "_on_confirmed")

func _pressed() -> void:
	
	dialog.popup_centered()

func _on_confirmed() -> void:
	print("confirmed")
#	var tilemap: TileMap = get_meta('tilemap')
#	tilemap.clear()

func _on_cancel_pressed() -> void:
	print("cancel")
