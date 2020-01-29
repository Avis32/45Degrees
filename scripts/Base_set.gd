extends Spatial

export var player_path: NodePath
export var CameraPos_path: NodePath
var player: KinematicBody
var cameraPos: Position3D
var base: Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)
	cameraPos = get_node(CameraPos_path)
	var base = get_child(0)
	var new_base = base.duplicate()
	new_base.translate(Vector3(0,0,2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(player.translation)
	#cameraPos.transform(Vector3(0,0,player.translation.z))
	cameraPos.translation.z = player.translation.z - 0.5
	

	
