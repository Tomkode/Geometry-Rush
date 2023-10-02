extends CharacterBody2D

@export var speed = 175
@export var jump_force = 350
@export var gravity = 15
@export var game_started = false
var on_ground 
var coins_collected = 0
var startX 
@onready var level = get_node("../")
signal death
signal finish
# Called when the node enters the scene tree for the first time.
func _ready():
	startX = position.x
#	flip_self()
#	gravity *= -1
#	jump_force *= -1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if game_started:
		if velocity.x == 0 and on_ground:
			velocity.x = speed
		apply_gravity()
		if Input.is_action_just_pressed("jump") and on_ground:
			jump()
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.get_name().begins_with("Tile"):
		on_ground = true


func _on_area_2d_body_exited(body):
	if body.get_name().begins_with("Tile") :
		on_ground = false
		
func apply_gravity():
	velocity.y += gravity
	
func jump(multiplier = 1):
	velocity.y = -multiplier * jump_force
	on_ground = false
	$AudioStreamPlayer2D.play()
func flip_self():
	for i in range(45):
			get_node("Sprite2D").rotation += PI/45
			await get_tree().create_timer(0.0005).timeout
func start_movement():
	on_ground = true
	velocity.x = speed
	game_started = true

func stop_movement():
	velocity.x = 0
	velocity.y = 0
	game_started = false
func collect_coin():
	coins_collected += 1

func distance_traveled() -> int:
	var distanceTraveled = position.x - startX
	return distanceTraveled * 100 / level.levelTotalDistance
