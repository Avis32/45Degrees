extends Spatial

export var player_path: NodePath
export var CameraPos_path: NodePath
var player: KinematicBody
var cameraPos: Position3D
var base: MeshInstance
var last_position_instantiated: float = 2
export var new_instance_parameter = 40
var grounds

func _ready():
	grounds = Array()
	player = get_node(player_path)
	cameraPos = get_node(CameraPos_path)
	base = get_child(0)

func _process(delta):
	cameraPos.transform.origin.z = player.transform.origin.z + 0
	if cameraPos.transform.origin.z >= last_position_instantiated - new_instance_parameter:
		var new_base = base.duplicate(8)
		last_position_instantiated += 2
		new_base.transform.origin.z = last_position_instantiated
		grounds.append(new_base)
		add_child(new_base)
		if len(grounds) > 40:
			var base_to_delete: MeshInstance = grounds.pop_front()
			base_to_delete.queue_free()
