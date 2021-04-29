extends KinematicBody2D

const FRICTION = 1024
const ACCELERATION = 1024
const MAX_SPEED = 52

var velocity = Vector2.ZERO

var playerAnim
var anim = ""
var animNew = ""

var player_pos = Vector2.ZERO
var new_position = Vector2.ZERO
var next_door_position = Vector2.ZERO

func _ready():
	self.global_position = Vector2.ZERO
	playerAnim = get_node("Sprite")
	set_process_input(true)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if (Input.is_action_pressed("ui_up")):
		anim = "Walk_U"
	elif (Input.is_action_pressed("ui_down")):
		anim = "Walk_D"
	elif (Input.is_action_pressed("ui_left")):
		anim = "Walk_D"
		$Sprite.flip_h = true
	elif (Input.is_action_pressed("ui_right")):
		anim = "Walk_D"
		$Sprite.flip_h = false
	else: 
		anim = "Idle_D"
	
	if anim != animNew:
		animNew = anim
		playerAnim.play(anim)

func _input(event):
	if event.is_action_pressed("interact"):
		if $InteractArea.items_in_range.size() > 0:
			var pickup_item = $InteractArea.items_in_range.values()[0]
			pickup_item.pick_up_item(self)
			$PickupItem.play()
			$InteractArea.items_in_range.erase(pickup_item)
