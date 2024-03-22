extends CharacterBody3D


@export var speed = 14
@export var fall_acc = 75
@export var jump_impulse = 20
@export var turn_speed = 2

var direction = Vector3.ZERO

func _physics_process(delta):
	
	var target_direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		target_direction.x += 1
	if Input.is_action_pressed("move_left"):
		target_direction.x -= 1
	if Input.is_action_pressed("move_back"):
		target_direction.z += 1
	if Input.is_action_pressed("move_forward"):
		target_direction.z -= 1
		
	if target_direction != Vector3.ZERO:
		direction = direction.lerp(target_direction, delta*turn_speed)
		$Pivot.basis = Basis.looking_at(direction)
		
		
	

#var target_vel = Vector3.ZERO
#
#func _physics_process(delta):
#	# We create a local variable to store the input direction.
#	var direction = Vector3.ZERO
#
#	# We check for each move input and update the direction accordingly.
#	if Input.is_action_pressed("move_right"):
#		direction.x += 1
#	if Input.is_action_pressed("move_left"):
#		direction.x -= 1
#	if Input.is_action_pressed("move_back"):
#		direction.z += 1
#	if Input.is_action_pressed("move_forward"):
#		direction.z -= 1
#
#	if direction != Vector3.ZERO:
#		direction = direction.normalized()
#		# Setting the basis property will affect the rotation of the node.
#		$Pivot.basis = Basis.looking_at(direction)
#
#	# Ground Velocity
#	target_vel.x = direction.x * speed
#	target_vel.z = direction.z * speed
#
#	# Vertical Velocity
#	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
#		target_vel.y = target_vel.y - (fall_acc * delta)
#	if is_on_floor() and Input.is_action_just_pressed("jump"):
#		target_vel.y = jump_impulse
#
#	# Moving the Character
#	velocity = target_vel
#	move_and_slide()









#const SPEED = 5.0
#const JUMP_VELOCITY = 4.5
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
#
#
#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y -= gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
#	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
#	if direction:
#		velocity.x = direction.x * SPEED
#		velocity.z = direction.z * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#		velocity.z = move_toward(velocity.z, 0, SPEED)
#
#	move_and_slide()
