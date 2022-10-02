extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprsize = -0.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	scale.y+=sprsize*delta
	if (scale.y<0.8):
		sprsize = 0.8
	if (scale.y>1.2):
		sprsize = -0.8
