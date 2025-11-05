extends Node

@export var ufo_scene: PackedScene
@onready var timer = $Timer as UfoTimer

@onready var top_path = $PathTopLeftRight/PathToFollow
@onready var bottom_path = $PathBottomRightLeft/PathToFollow
@onready var explosion_audio_player: AudioStreamPlayer2D = $"../ExplosionAudioPlayer"


func _ready():
	timer.timeout.connect(spawn_ufo)

func spawn_ufo():
	var ufo = ufo_scene.instantiate() as Ufo
	var path_to_follow = top_path if randf() > 0.5 else bottom_path as  PathFollow2D
	ufo.ufo_destroyed.connect(on_ufo_destroyed)
	if(path_to_follow.get_child_count() != 0):
		return
	
	path_to_follow.progress = 0
	ufo.path = path_to_follow
	path_to_follow.add_child(ufo)
	timer.setup_timer()
	timer.start()
	timer.timeout.connect(spawn_ufo)

func on_ufo_destroyed():
	explosion_audio_player.play()
