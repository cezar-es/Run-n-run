extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0
var id = 10
signal _on_Timer_Timeout


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x-=speed*delta


func _on_PainTrain_area_entered(area):
	if (area.id == 5):
		emit_signal("_on_Timer_Timeout")
