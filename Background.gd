extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_parent().level == 9):
		position.x -=150*delta
	else:
		position.x -=300*delta
	if (position.x<380):
	#if (position.x<362):
		position.x=980
