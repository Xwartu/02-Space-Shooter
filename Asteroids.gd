extends Node2D

onready var Enemy = load("res://Asteroids/Asteroid.tscn")
export var prob = 0.7

onready var width = get_viewport().size.x

func _on_Timer_timeout():
	if randf() < prob:
		var enemy = Enemy.instance()
		enemy.position.x = randi() % int(width)
		enemy.speed = Vector2(0, (randi() % 5)+1)
		add_child(enemy)
