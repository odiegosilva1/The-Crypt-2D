extends KinematicBody2D

const GRAVITY = 4000
var velocity = Vector2.ZERO
var speed = 300
var jump_force = 1200
#var jump = false
var jump_count = 1
onready var limit_right = $"limit_right"

func _ready():
	$cam.limit_right = limit_right.position.x
	pass
	
func _process(delta):
	#gravity const
	velocity.y += GRAVITY * delta
	
	#left right
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	#var dir = Input.get_vector("left","right","top","down")
	#velocity.x = dir * speed
	if dir != 0:
		#player aceleration
		velocity.x = lerp(velocity.x,dir * speed,0.1)
	else:
		if is_on_floor():
			velocity.x = lerp(velocity.x,0,0.1)
		else:
		   velocity.x = lerp(velocity.x,0,0.001)	
			
	velocity = move_and_slide(velocity,Vector2.UP)
	
	if is_on_floor():
		#jump = false
		jump_count = 2
		pass
		
		
	
	#jump
	if Input.is_action_just_pressed("jump") and jump_count > 0:
		jump_count -= 1
		#jump = true
		jump()
		
	# If you perform the jump and you are on the ground, do not use a double jump.
	if Input.is_action_just_pressed("jump") and !is_on_floor() and jump_count > 0:
		 jump_count -= 2
		 jump()
		
			
func jump():
 velocity.y = -jump_force		
