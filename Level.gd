extends Node2D

@onready var hud = get_node("Player/Camera2D/HUD")
@onready var player = get_node("Player")
@onready var playerSprite = get_node("Player/Sprite2D")
@onready var startTimer = get_node("Player/Camera2D/HUD/StartTimer")
var gameOverHUD
@onready var levelTotalDistance = $Tile/Sprite2D.get_texture().get_width() * $Tile.scale.x
var Andrew = load("res://art/Player/Andrew.png")
var Steve = load("res://art/Player/Steve.png")
var Axel = load("res://art/Player/Axel.png")
var Goofy = load("res://art/Player/Goofy.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	gameOverHUD = $Player/Camera2D/GameOverHUD
	gameOverHUD.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_play():
	hud.hide_self()
	hud.show_countdown()
	hud.start_timer()
	await startTimer.timeout
	hud.hide_countdown()
	player.start_movement()




func _on_hud_andrew_selected():
	playerSprite.set_texture(Andrew)


func _on_hud_axel_selected():
	playerSprite.set_texture(Axel)


func _on_hud_steve_selected():
	playerSprite.set_texture(Steve)

func _on_hud_goofy_selected():
	playerSprite.set_texture(Goofy)


func _on_player_death():
	reset_game()


func _on_player_finish():
	reset_game()
	var percentageLabel = gameOverHUD.get_node("Percentage")
	percentageLabel.text = "Level Completed: 100% "

func reset_game():
	player.hide()
	player.stop_movement()
	$AudioStreamPlayer2D.stop()
	gameOverHUD.show()
	var coinsLabel = gameOverHUD.get_node("Coins")
	coinsLabel.text = "Coins Collected: %d / 3" % player.coins_collected
	var percentageLabel = gameOverHUD.get_node("Percentage")
	percentageLabel.text = "Level Completed: %d " % player.distance_traveled() + "%"



