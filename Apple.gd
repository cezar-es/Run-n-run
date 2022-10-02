extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0
var speedDown = 0
var rng = RandomNumberGenerator.new()
var id = 0
signal AppleDied

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x-=speed*delta
	if (position.x<350):
		emit_signal("AppleDied")
		queue_free()




func _on_Apple_area_entered(area):
	queue_free()
