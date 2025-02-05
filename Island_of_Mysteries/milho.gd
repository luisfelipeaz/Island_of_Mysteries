extends Area2D
var semente = Dados.semente
var pode_colher = "nao"
var ta_perto_milho = "nao"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	hide()
	
func _on_body_entered(body: Node2D) -> void:
	if Dados.semente>=1:
		show()
		Dados.semente -=1
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(5.0).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(6.0).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(7.0).timeout
		$AnimatedSprite2D.frame = 4
		await get_tree().create_timer(8.0).timeout
		$AnimatedSprite2D.frame = 5
		pode_colher = "sim"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("colher") and pode_colher=="sim":
		queue_free()
