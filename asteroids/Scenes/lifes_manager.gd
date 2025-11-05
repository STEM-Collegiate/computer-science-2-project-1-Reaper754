extends Node

class_name LifesManager

signal player_life_lost(lifes_left: int)

@export var player_start_position: Vector2 = Vector2(0, 0)
@export var lifes = 3

var player_scene = preload("res://Scenes/player.tscn")
@onready var player = $"../Player" as Player


func _ready() -> void:
	player.on_player_died.connect(decrease_lifes)


func decrease_lifes():
	lifes -= 1;
	player_life_lost.emit(lifes)
	if lifes != 0:
		var player = player_scene.instantiate() as Player
		player.on_player_died.connect(decrease_lifes)
		get_tree().root.get_node("Main").add_child(player)
		player.global_position = player_start_position
		player.start_invincibility()
	
	
