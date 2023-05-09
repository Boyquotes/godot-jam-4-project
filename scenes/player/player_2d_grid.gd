extends Sprite


export var tile_size := Vector2(64, 64)
export var tween_time := 0.3

onready var tween := $Tween
onready var ray_cast := $RayCast2D


func _ready() -> void:
	ray_cast.position = tile_size / 2


func _physics_process(_delta: float) -> void:
	if tween.is_active():
		return
	var input := Input.get_vector("move_left", "move_right", "move_up", "move_down") * tile_size
	input = input.snapped(tile_size)
	if input == Vector2.ZERO:
		return
	ray_cast.cast_to = input
	ray_cast.force_raycast_update()
	if ray_cast.is_colliding():
		tween.interpolate_property(self, "position", position, position + input / 4, tween_time / 2)
		tween.interpolate_property(self, "position", position + input / 4, position, tween_time / 2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, tween_time / 2)
	else:
		tween.interpolate_property(self, "position", position, position + input, tween_time)
	tween.start()
