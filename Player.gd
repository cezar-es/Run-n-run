extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 300
var level = 0
var keepItMoving = 0
var neutralSpecial = 0
var id = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_use_accumulated_input(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (get_parent().level==3): #parasite modifier
		if (Input.is_action_pressed("ui_left")):
			position.x+=speed*delta
		if (Input.is_action_pressed("ui_right")):
			position.x-=speed*delta
		if (Input.is_action_pressed("ui_up")):
			position.y+=speed*delta
		if (Input.is_action_pressed("ui_down")):
			position.y-=speed*delta
	elif (get_parent().level==7): #Keep it moving
		keepItMoving = 0
		if (Input.is_action_pressed("ui_left")):
			position.x-=speed*delta
			keepItMoving = 1
		if (Input.is_action_pressed("ui_right")):
			position.x+=speed*delta
			keepItMoving = 1
		if (Input.is_action_pressed("ui_up")):
			position.y-=speed*delta
			keepItMoving = 1
		if (Input.is_action_pressed("ui_down")):
			position.y+=speed*delta
			keepItMoving = 1
		if (keepItMoving == 0):
			position.x+=speed*delta
	else:
		if (Input.is_action_pressed("ui_left")):
			position.x-=speed*delta
		if (Input.is_action_pressed("ui_right")):
			position.x+=speed*delta
		if (Input.is_action_pressed("ui_up")):
			position.y-=speed*delta
		if (Input.is_action_pressed("ui_down")):
			position.y+=speed*delta
	if (get_parent().level==14): #Shelter
		position.x=clamp(position.x,430,930)
		position.y=clamp(position.y,295,385)
	else:
		position.x=clamp(position.x,430,930)
		position.y=clamp(position.y,160,520)
	
func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")&&neutralSpecial==1):
		var newBullet = $Bullet.duplicate()
		newBullet.speed = 300
		newBullet.position.x = self.position.x+30
		newBullet.position.y = self.position.y-15
		get_parent().add_child(newBullet)


func _on_Timer_timeout():
	if (get_parent().level==13):
		$PlayerClone/PlayerColl.disabled = false
	$PlayerColl.disabled = false
