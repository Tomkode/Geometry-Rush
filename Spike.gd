extends Area2D

@export var SpikeType = 1
var SpikeUp = load("res://art/SpikeUp.png")
var SpikeRight = load("res://art/SpikeRight.png")
var SpikeDown = load("res://art/SpikeDown.png")
var SpikeLeft = load("res://art/SpikeLeft.png")
signal death
# Called when the node enters the scene tree for the first time.
func _ready():
	match SpikeType:
		1:
			$Sprite2D.set_texture(SpikeUp)
			$CollisionPolygon2D.set_rotation(0)
		2:
			$Sprite2D.set_texture(SpikeRight)
			$CollisionPolygon2D.set_rotation(PI/2)
		3:
			$Sprite2D.set_texture(SpikeDown)
			$CollisionPolygon2D.set_rotation(PI)
		4:
			$Sprite2D.set_texture(SpikeLeft)
			$CollisionPolygon2D.set_rotation(-PI/2)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.get_name() == "Player":
		body.death.emit()
		

