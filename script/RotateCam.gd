extends MeshInstance3D

var targetRot
var currentRot

# Called when the node enters the scene tree for the first time.
func _ready():
	currentRot = get_transform().basis.y
	targetRot = get_transform().basis.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("RotateCamLeft"):
		targetRot += 90
		
	rotateToTarget()


func rotateToTarget():
	currentRot = get_transform().basis.y
	if targetRot != currentRot:
		rotate_object_local(Vector3.UP, 1)
