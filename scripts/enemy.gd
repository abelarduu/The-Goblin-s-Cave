extends KinematicBody2D
var health:= 100
var speed:= 200

func _physics_process(_delta):
	$lifeBar.value= health
	var distance= $"../".get_parent().player_position - position
	var inputs = distance.normalized()
	inputs= move_and_slide(inputs * speed)
	animate(inputs)
	
func animate(inputs):
	if inputs:
		if inputs.x < 0: $AnimatedSprite.flip_h= true
		elif inputs.x > 0: $AnimatedSprite.flip_h= false

func damage(amount: int):
	if health <= 0: queue_free()
	else: health-= amount
	
	modulate_color_damage()
	position-= position/5
	
func modulate_color_damage():
	#add cor de dano
	modulate= Color.red
	#modulando a cor de dano
	var tween= create_tween()
	tween.tween_property(self, "modulate",Color.white, 0.3)
