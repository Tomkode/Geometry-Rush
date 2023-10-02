extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.get_name() == "Player" :
		body.on_ground = true


func _on_body_exited(body):
	if body.get_name() == "Player" :
		body.on_ground = false
