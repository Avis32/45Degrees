extends StaticBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player: KinematicBody
var multiplier = 1
var distance_to_player
var mesh: MeshInstance
var before_trans: Transform
var after_trans: Transform

# Called when the node enters the scene tree for the first time.
func _ready():
	mesh = get_node("ObstacleMesh")
	player = get_node("../../../Player")
	after_trans = mesh.transform
	mesh.transform.origin.y -= 0.3
	mesh.rotate_y(180)
	mesh.scale = Vector3(0.1,0.1,0.1)
	before_trans = mesh.transform
	mesh.transform = before_trans

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	distance_to_player = player.transform.origin.distance_to(global_transform.origin)
	if distance_to_player<=4:
		interpolated_pos(delta)
	if multiplier <= 0:
		mesh.transform = after_trans
	if distance_to_player >= 15:
		queue_free()


func interpolated_pos(inter):
	multiplier -= inter * 2
	mesh.transform = after_trans.interpolate_with(before_trans, multiplier)
