extends KinematicBody2D

const GRAVITY = 75.0
var velocity = Vector2()

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	var motion = velocity * delta
	move_and_collide(motion)
	
	if position.y > get_viewport().size.y + 100:
		queue_free()

onready var HUD = get_node("/root/Game/HUD")

export var speed = Vector2(0,3)
export var health = 100
export var points = 25
export var damage = 30

onready var Explosion = load("res://Explosion/Explosion.tscn")


func die():
	HUD.update_score(points)
	var explosion = Explosion.instance()
	explosion.position = position
	get_node("/root/Game/Explosions").add_child(explosion)
	explosion.get_node("Animation").play()
	queue_free()
