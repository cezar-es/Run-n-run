extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var spawningRocks = 0
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_RockTimer_timeout():
	if (spawningRocks == 1):
		var newRock = $Rock.duplicate()
		if (get_parent().level == 12): #Ascend
			newRock.speedDown = 300
			newRock.position.x = rng.randi_range(430, 930)
			newRock.position.y = 0
			add_child(newRock)
		elif (get_parent().level == 9): #Side effects
			newRock.speed = 150
			newRock.position.x = 1024
			newRock.position.y = rng.randi_range(180,550)
			add_child(newRock)
		elif (get_parent().level == 5): # Mutations
			newRock.speed = rng.randi_range(150,450)
			newRock.speedDown = rng.randi_range(-30,30)
			newRock.scale.x = rng.randf_range(0.5,1.25)
			newRock.scale.y = rng.randf_range(0.5,1.25)
			newRock.position.x = 1024
			newRock.position.y = rng.randi_range(180,550)
			add_child(newRock)
		elif (get_parent().level == 14): #Shelter
			newRock.speed = 350
			newRock.position.x = 1024
			newRock.position.y = rng.randi_range(305,415)
			add_child(newRock)
		elif (get_parent().level == 15): #Making connections
			newRock.speed = 300
			newRock.position.x = 1024
			newRock.scale.x = 1.8
			newRock.position.y = rng.randi_range(180,550)
			add_child(newRock)
		elif (get_parent().level == 8&&rng.randi_range(1,6)==1): #Harvest
			var newApple = $Apple.duplicate()
			newApple.speed = 300
			newApple.position.x = 1024
			newApple.position.y = rng.randi_range(180,520)
			add_child(newApple)
		else:
			newRock.speed = 300
			newRock.position.x = 1024
			newRock.position.y = rng.randi_range(180,550)
			add_child(newRock)
		
		if (get_parent().level==16&&rng.randi_range(1,3)==1): # dont mix those
			var newAnti = $Antirock.duplicate()
			newAnti.speed = 300
			newAnti.position.x = 450
			newAnti.position.y = rng.randi_range(180,550)
			add_child(newAnti)
		
		if (get_parent().level==2): #Use it or lose it
			var newRock2 = $Rock.duplicate()
			newRock2.speed = 300
			newRock2.position.x = 1024
			newRock2.position.y = rng.randi_range(180,550)
			add_child(newRock2)
		
		if (rng.randi_range(1,2)==1&&(get_parent().level==5||get_parent().level==2)):
			_on_RockTimer_timeout()
		elif (rng.randi_range(1,3)==1&&(get_parent().level==9||get_parent().level==6)):
			_on_RockTimer_timeout()
		elif (rng.randi_range(1,4)==1&&(get_parent().level!=14&&get_parent().level!=8)):
			_on_RockTimer_timeout()
			
