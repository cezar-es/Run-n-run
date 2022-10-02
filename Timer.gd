extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (int(time_left)%60>9):
		$TimerText.text = str(int(time_left)/60)+":"+str(int(time_left)%60)
	else:
		$TimerText.text = str(int(time_left)/60)+":0"+str(int(time_left)%60)
