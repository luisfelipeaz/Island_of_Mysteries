extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$gato/AnimationPlayer.play("deitado")
	await get_tree().create_timer(5.0).timeout
	$gato/AnimationPlayer.play("parado")
	await get_tree().create_timer(5.0).timeout
	$gato/AnimationPlayer.play("patinha")
	await get_tree().create_timer(5.0).timeout
	$gato/AnimationPlayer.play("lambendo")
	await get_tree().create_timer(5.0).timeout
	$gato/AnimationPlayer.play("andando")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
