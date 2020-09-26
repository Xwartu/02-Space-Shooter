extends Control

onready var global = get_node("/root/Global")

func _ready():
	update_score(0)
	update_health(50)
	

func _on_Score_high():
	get_tree().change_scene("res://Levels/Level4.tscn")


func update_score(s):
	global.score += s
	$Score.text = "Score: " + str(global.score)
	if global.score >= 400:
		_on_Score_high()

func update_health(h):
	global.health += h
	$Health.text = "Health: " + str(global.health)
	if global.health <= 0:
		get_tree().change_scene("res://Menu/Die.tscn")
