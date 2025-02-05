extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pescaria_mouse_entered() -> void:
		$"/root/Dados".pescar = true


func _on_pescaria_mouse_exited() -> void:
	$"/root/Dados".pescar = false
