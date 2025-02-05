extends Area2D
var pegar = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("rightClick"):
		if pegar == true:
			$"/root/Dados".peixes += 1
			print($"/root/Dados".peixes)
			print("peguei peixe")


func _on_peixe_area_entered(area: Area2D) -> void:
	pegar = true
	


func _on_peixe_area_exited(area: Area2D) -> void:
	pegar = false
