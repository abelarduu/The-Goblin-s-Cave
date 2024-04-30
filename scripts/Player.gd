extends KinematicBody2D
var health:= 100
var speed:= 350
var attack= false
var torch_damage:= 25
onready var torch_area= $torch_area

func _physics_process(_delta):
	#Globalizando a posição do player 
	get_parent().player_position= position
	$lifeBar.value= health
	
	#Inputs/mov do Player
	var inputs= Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	inputs= move_and_slide(inputs * speed)
	animate(inputs)
	check_atack()

#Função de verificação para animações
func animate(inputs):
	if inputs:
		if inputs.x < 0: $sprite.flip_h= true
		elif inputs.x > 0: $sprite.flip_h= false
		if not attack: $Anim.play("run")
	else: 
		if not attack:$Anim.play("idle")
	
func check_atack():
	if Input.is_action_pressed("atack"):
		deal_damage_to_enimies()
		$Anim.play("atack_side_1")
		attack= true
	else: attack= false

func deal_damage_to_enimies():
	var entity_bodies= $torch_area.get_overlapping_bodies()
	for entity in entity_bodies:
		if entity.is_in_group("Enemies"):
			pass

func _on_torch_area_body_entered(body):
	if attack and body.is_in_group("Enemies"):
		body.damage(torch_damage)
