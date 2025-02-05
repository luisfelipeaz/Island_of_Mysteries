extends CharacterBody2D
@export_category("Variables")
@export var _move_speed: float = 64.0
@onready var sprite = $Animacao
@onready var anima = $Animacao

const SPEED = 50.0

func _physics_process(delta: float) -> void:
	_move()
	move_and_slide()
	
func _move() ->void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("direita","esquerda"),
		Input.get_axis("cima","baixo")
	)	
	velocity = _direction.normalized() * _move_speed
	if _direction.x > 0:
		sprite.flip_h = false 
		sprite.play("andando_frente")
	elif _direction.x <0:
		sprite.flip_h = true 
		sprite.play("andando_tras")
		
	elif _direction == Vector2.ZERO:
		sprite.play("Parado")
		
	move_and_slide()
	
func _ready() -> void:
	$com_roupa.hide()
	
func _process(delta: float) -> void:
	#contador de peixes
	$peixecont.text = "peixes: " + str($"/root/Dados".peixes)
	_move()
	if Input.is_action_just_released("roupa"):
		$com_roupa.show()
		$Animacao.hide()
		anima = $com_roupa


func _on_milho_body_entered(body: Node2D) -> void:
	pass 
	
func _on_milho_body_exited(body: Node2D) -> void:
	pass 

func _on_sementes_body_entered(body: Node2D) -> void:
	pass

#funcao pra entrar na casa 
func _on_porta_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://dentro_de_casa.tscn").call_deferred()
#funcao pra sair da casa
func _on_porta_sair_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://principal.tscn").call_deferred()
#funcao mensagem cama 	
func _on_cama_body_entered(body: Node2D) -> void:
	$"../dialogo_cama".show()
	$"../dialogo_cama".text = str("Só pode dormir a noite")	

func _on_cama_body_exited(body: Node2D) -> void:
	$"../dialogo_cama".hide()	
	
func _on_trufle_body_entered(body: Node2D) -> void:
	$"../dialogo_trufle".show()
	$"../dialogo_trufle".text = str("Olá bem vindo a Island Of Myteries")

func _on_trufle_body_exited(body: Node2D) -> void:
	$"../dialogo_trufle".hide()

func _on_jorge_o_fazendeiro_body_entered(body: Node2D) -> void:
	$"../dialogo_jorge".show
	$"../dialogo_jorge".text = str("Não vá pra cidade nem para a mina")
	
func _on_jorge_o_fazendeiro_body_exited(body: Node2D) -> void:
	$"../dialogo_jorge".hide()
	
func _on_ovo_body_entered(body: Node2D) -> void:
	$"../dialogo_ovo".show
	$"../dialogo_ovo".text = str("As galinhas estão botando ovos gigantes , estranho")

func _on_ovo_body_exited(body: Node2D) -> void:
	$"../dialogo_ovo".hide()
#funcao mostra o coracao gato
func _on_gato_body_entered(body: Node2D) -> void:
	$"../gato/coracao".show()
#funcao esconde coracao do gato 	
func _on_gato_body_exited(body: Node2D) -> void:
	$"../gato/coracao".hide()

func _on_pescaria_body_entered(body: Node2D) -> void:
	$peixecont.visible = true
	$sistema_pescaria.visible = true
	Dados.pode_pescar="sim"

func _on_pescaria_body_exited(body: Node2D) -> void:
	$peixecont.visible = false
	$sistema_pescaria.visible = false
	Dados.pode_pescar="nao"
