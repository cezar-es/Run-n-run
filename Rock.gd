extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0
var speedDown = 0
var rng = RandomNumberGenerator.new()
var id = 1
var level = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	$RockSprite.animation = str(get_parent().get_parent().level)
	rng.randomize()
	if (get_parent().get_parent().level==6):
		$Timer.wait_time=0.2
		$Timer.one_shot=false
	if (get_parent().get_parent().level==10||get_parent().get_parent().level==4||get_parent().get_parent().level==6):
		$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x-=speed*delta
	position.y+=speedDown*delta
	if (position.x<0||position.y>650||position.y<-300):
		queue_free()



func _on_Rock_area_entered(area):
	queue_free()


func _on_Timer_timeout():
	if (get_parent().get_parent().level==10): #Nothing is permanent
		if (rng.randi_range(1,2)==1):
			visible = false
		else:
			$RockColl.disabled = true
	elif (get_parent().get_parent().level==4): #Split
		var newRock = self.duplicate()
		var newRock2 = self.duplicate()
		newRock.speedDown=300
		newRock.speed = 400
		newRock.position.x=self.position.x
		newRock.position.y=self.position.y+10
		newRock2.speedDown=-300
		newRock2.speed = 400
		newRock2.position.x=self.position.x
		newRock2.position.y=self.position.y-10
		get_parent().add_child(newRock)
		get_parent().add_child(newRock2)
		$RockColl.disabled = true
		$RockSprite.visible = false
	elif (get_parent().get_parent().level==6): #Corruppppppppppppppppption
		position.x += rng.randi_range(-20,20)
