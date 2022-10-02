extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0
var id = 0
var exploded = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x+=speed*delta
	if (position.x>1500):
		queue_free()



func _on_Antirock_area_entered(area):
	if (area.id == 1&&exploded == 0):
		exploded = 1
		$ARockSprite.animation="Explode"
		speed = 0
		id = 2
		$ARockColl.shape.radius = 30
		$ARockSprite.scale.x = 3
		$ARockSprite.scale.y = 3
		$Timer.start()
	elif (area.id != 1):
		queue_free()


func _on_Timer_timeout():
	queue_free()
