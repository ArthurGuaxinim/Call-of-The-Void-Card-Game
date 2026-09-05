extends Node2D
signal hovered
signal hovered_off
var is_hovered := false
var starting_position 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#All cars must be a child of CardManager or this will error
	get_parent().connect_card_signals(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_area_2d_mouse_entered() -> void:
	is_hovered = true
	emit_signal("hovered", self)

func _on_area_2d_mouse_exited() -> void:
	is_hovered = false
	emit_signal("hovered_off", self)
