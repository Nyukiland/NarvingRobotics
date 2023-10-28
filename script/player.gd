extends CharacterBody3D

var robot_node

var SPEED = 1.0

var animBallSpeed = 10.0
var targetBallState = 0.0
var ballState = 0.0


func _physics_process(_delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	
	#changement of ball state
	if Input.is_action_just_pressed("ChangeBall"):
		if targetBallState == 0:
			targetBallState = 1.0
		else:
			targetBallState = 0.0
	BallAnim()
	
func BallAnim():
	var step = animBallSpeed * get_process_delta_time()
	ballState = lerp(ballState, targetBallState, step)
	$Visu/robot.set("blend_shapes/ball",ballState)
