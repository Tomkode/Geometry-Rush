extends CanvasLayer

signal play
signal switch_skin
signal andrew_selected
signal steve_selected
signal axel_selected
signal goofy_selected
# Called when the node enters the scene tree for the first time.
func _ready():
	hide_countdown()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var startTimeLeft = $StartTimer.get_time_left()
	if startTimeLeft:
		$StartTimer/Countdown.text = "%2d" % startTimeLeft


func _on_play_button_pressed():
	play.emit() # Replace with function body.


func _on_switch_skin_button_pressed():
	switch_skin.emit() # Replace with function body.

func hide_self():
	$Title.hide()
	$PlayButton.hide()
	$SwitchSkinButton.hide()
func hide_countdown():
	$StartTimer/Countdown.hide()
func show_countdown():
	$StartTimer/Countdown.show()
	
func start_timer():
	$StartTimer.start()
	

func _on_switch_skin_button_item_selected(index):
	match index:
		0:
			andrew_selected.emit()
		1:
			steve_selected.emit()
		2:
			axel_selected.emit()
		3:
			goofy_selected.emit()
