extends Node2D

var player_position: Vector2
var pre_enemy= preload("res://scenes/Enemy.tscn")

func _ready():
	if get_tree().get_nodes_in_group("Enimies").size() < 6:
		for _i in range(6):
			var enemy= pre_enemy.instance()
			var randi_pos= Vector2(randi() % 600 - 100, randi() % 600 - 100)
			enemy.add_to_group("Enemies")
			enemy.position= randi_pos
			$nodes_enemies.add_child(enemy)
