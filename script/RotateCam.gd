extends MeshInstance3D


var rot = 45.0
var target_rot = 45.0  # The target rotation
var rotation_speed = 10.0  # The speed at which the rotation occurs (degrees per second)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("RotateCamRight"):
		target_rot += 90  

	if Input.is_action_just_pressed("RotateCamLeft"):
		target_rot -= 90
			
	rotateToTarget()

func rotateToTarget():	
	var step = rotation_speed * get_process_delta_time()
	rot = lerp(rot, target_rot, step)
	rotation_degrees = Vector3(0, rot, 0)
