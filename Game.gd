extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var gameStarted = 0
var level = 1
var levelsPassed = 0
var lvl2 = 0
var lvl3 = 0
var lvl4 = 0
var lvl5 = 0
var lvl6 = 0
var lvl7 = 0
var lvl8 = 0
var lvl9 = 0
var lvl10 = 0
var lvl11 = 0
var lvl12 = 0
var lvl13 = 0
var lvl14 = 0
var lvl15 = 0
var lvl16 = 0
var lives = 0

#DONE1Every 10 seconds - nothing
#DONE2Use it or lose it - Way more rocks, you have the rocket launcher
#DONE3Parasite - Reverse controls
#DONE4Split - Rocks split at the middle of the map
#DONE5Mutations - Rocks are weird
#DONE6Corruption - Rocks jump instead of moving fluidly
#DONE7Keep it moving - You can't stop / You are chased by a rock
#DONE/REWORK8Harvest - Collect fruits or lose
#DONE9Side effect - Game is slower
#DONE10Nothing is permanent - Some rocks become invisible, some are fake
#DONE11Overgrown - You can't see much
#DONE12Ascend - Rocks fall down
#DONE13Duplication - Two characters
#DONE14Shelter - Small corridor
#DONE15Making connections - Rocks come in pairs
#DONE16You shouldn't mix those - Antirocks from the left, explode when rock touches them
#17Delay the inevitable - Train comes from the left, instakills
#DONE18Break - break

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("ui_accept")&&gameStarted==0):
		level = 1
		lives = 0
		levelsPassed = 0
		lvl2 = 0
		lvl3 = 0
		lvl4 = 0
		lvl5 = 0
		lvl6 = 0
		lvl7 = 0
		lvl8 = 0
		lvl9 = 0
		lvl10 = 0
		lvl11 = 0
		lvl12 = 0
		lvl13 = 0
		lvl14 = 0
		lvl15 = 0
		lvl16 = 0
		gameStarted = 1
		$Timer.start()
		$Timer.paused = 0
		$Player.visible = true
		$Player.position.x = 480
		$Player.position.y = 300
		$StartScreen.visible = false
		$StartScreen.animation = "Start"
		$RockSpawner.spawningRocks = 1
		$RockSpawner.visible = true
		$EventTimer.start()
		$GameTheme.text = "Every 10 seconds"
		$GameDesc.text = "Every 10 seconds something is going to happen?"
		$Player/PlayerClone.visible = false
		$Player/PlayerClone/PlayerColl.disabled = true
		$Player/OvergrownSprite.visible = false
		$Player.neutralSpecial = 0
		$Player/GunSprite.visible=false
		$PainTrain.position.x = 1100
		$PainTrain/TrainColl.disabled = true
		$Background.animation="Background1"
	if (Input.is_action_just_pressed("ui_restart")&&gameStarted==1):
		endGame()


func _on_Player_area_entered(area):
	if (area.id == 1||area.id == 2):
		lives +=1
		$Player.neutralSpecial = 0
		$Player/GunSprite.visible=false
		if (lives == -1):
			endGame()


func _on_Timer_timeout():
	endGame()
	
func _on_Apple_AppleDied():
	lives +=1
	if (lives == -1):
		endGame()

func endGame():
	gameStarted = 0
	$Timer.paused = 1
	$Player.visible = false
	$StartScreen.visible = true
	$RockSpawner.spawningRocks = 0
	$RockSpawner.visible = false
	$EventTimer.stop()
	$PainTrain.speed = 0
	$PainTrain/TrainColl.disabled = true
	$PainTrain.position.x = 1100
	$GameTheme.text = "Thanks for playing!"
	$GameDesc.text = ":)"


func _on_EventTimer_timeout():
	$Player/OvergrownSprite.visible = false
	$Player/PlayerClone.visible = false
	$Player/PlayerClone/PlayerColl.disabled = true
	$RockSpawner.spawningRocks = 1
	$Player.neutralSpecial = 0
	$Player/GunSprite.visible=false
	levelsPassed+=1
	if (levelsPassed == 8):
		level = 18
		$Background.animation="Background18"
		$GameTheme.text = "Ad Break!"
		$GameDesc.text = "This game is sponsored by Laid: Shallow Errands"
		$RockSpawner.spawningRocks = 0
	elif (levelsPassed == 17):
		level = 17
		$Background.animation="Background17"
		$GameTheme.text = "Delay the inevitable"
		$GameDesc.text = "Wait, that's the theme from last Ludum Dare!"
		$RockSpawner.spawningRocks = 0
		$PainTrain.speed = 200
		$PainTrain/TrainColl.disabled = false
	else:
		zmienlevel()

func zmienlevel():
	#var tempLevel = rng.randi_range(14,14)
	var tempLevel = rng.randi_range(2,16)
	match tempLevel:
		2:
			if (lvl2 == 1):
				zmienlevel()
			else:
				lvl2 = 1
				level = 2
				$Background.animation="Background2"
				$GameTheme.text = "Use it or lose it"
				$GameDesc.text = "You have a gun, use it! Press SPACE to shoot, but you lose it when hit."
				$Player.neutralSpecial = 1
				$Player/GunSprite.visible=true
		3:
			if (lvl3 == 1):
				zmienlevel()
			else:
				lvl3 = 1
				level = 3
				$Background.animation="Background3"
				$GameTheme.text = "Parasite"
				$GameDesc.text = "Parasite has taken over your brain! Control lost, movement reversed!"
		4:
			if (lvl4 == 1):
				zmienlevel()
			else:
				lvl4 = 1
				level = 4
				$Background.animation="Background4"
				$GameTheme.text = "Split"
				$GameDesc.text = "Prepare for trouble and make it double!"
		5:
			if (lvl5 == 1):
				zmienlevel()
			else:
				lvl5 = 1
				level = 5
				$Background.animation="Background5"
				$GameTheme.text = "Mutations"
				$GameDesc.text = "Are these even rocks anymore?"
		6:
			if (lvl6 == 1||lvl4 == 0||lvl10 == 0):
				zmienlevel()
			else:
				lvl6 = 1
				level = 6
				$Background.animation="Background6"
				$GameTheme.text = "Corruption"
				$GameDesc.text = "translation_english_string_10"
		7:
			if (lvl7 == 1):
				zmienlevel()
			else:
				lvl7 = 1
				level = 7
				$Background.animation="Background7"
				$GameTheme.text = "Keep it moving"
				$GameDesc.text = "You can't stop."
		8:
			if (lvl8 == 1):
				zmienlevel()
			else:
				lvl8 = 1
				level = 8
				$Background.animation="Background8"
				$GameTheme.text = "Harvest"
				$GameDesc.text = "Collect apples (or die)!"
		9:
			if (lvl9 == 1):
				zmienlevel()
			else:
				lvl9 = 1
				level = 9
				$Background.animation="Background9"
				$GameTheme.text = "Side effect"
				$GameDesc.text = "Rocks are slower! Wait, that also makes patterns more dense..."
		10:
			if (lvl10 == 1):
				zmienlevel()
			else:
				lvl10 = 1
				level = 10
				$Background.animation="Background10"
				$GameTheme.text = "Nothing is permanent"
				$GameDesc.text = "Rocks aren't too. Remember what you can't see, ignore what you can."
		11:
			if (lvl11 == 1):
				zmienlevel()
			else:
				lvl11 = 1
				level = 11
				$Background.animation="Background11"
				$GameTheme.text = "Overgrown"
				$GameDesc.text = "It's hard to see in all this foliage."
				$Player/OvergrownSprite.visible = true
		12:
			if (lvl12 == 1):
				zmienlevel()
			else:
				lvl12 = 1
				level = 12
				$Background.animation="Background12"
				$GameTheme.text = "Ascend"
				$GameDesc.text = "You can't do a barrel roll."
		13:
			if (lvl13 == 1):
				zmienlevel()
			else:
				lvl13 = 1
				level = 13
				$Background.animation="Background13"
				$GameTheme.text = "Duplication"
				$GameDesc.text = "Now neither of us will be running alone!"
				$Player/PlayerClone.visible = true
				$Player/PlayerClone/Timer.start()
		14:
			if (lvl14 == 1):
				zmienlevel()
			else:
				lvl14 = 1
				level = 14
				$Background.animation="Background14"
				$GameTheme.text = "Shelter"
				$GameDesc.text = "It's cramped here."
				$Player/PlayerColl.disabled = true
				$Player/PlayerClone/Timer.start()
		15:
			if (lvl15 == 1):
				zmienlevel()
			else:
				lvl15 = 1
				level = 15
				$Background.animation="Background15"
				$GameTheme.text = "Making connections"
				$GameDesc.text = "Rocks found some new friends! You should too."
		16:
			if (lvl16 == 1):
				zmienlevel()
			else:
				lvl16 = 1
				level = 16
				$Background.animation="Background16"
				$GameTheme.text = "You shouldn't mix those"
				$GameDesc.text = "Antirocks explode when in contact with rocks."





func _on_PainTrain__on_Timer_Timeout():
	endGame()
