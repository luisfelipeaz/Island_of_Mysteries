extends Area2D
var semente = Dados.semente

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass
	
	hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"../segunda_info/semente".text =str ("Sementes de milho: ",semente)
	pass


func _on_body_entered(body: Node2D) -> void:
	if Dados.semente>=1:
		show()
		Dados.semente -=1
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(5.0).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(10.0).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(20.0).timeout
		$AnimatedSprite2D.frame = 4
		await get_tree().create_timer(30.0).timeout
		$AnimatedSprite2D.frame = 5
	

func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
