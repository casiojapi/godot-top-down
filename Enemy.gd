extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"e

export var speed = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")
	
	motion += Vector2(Player.position) - position
	look_at(Player.position)
	motion = motion.normalized() * speed
	move_and_collide(motion)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
