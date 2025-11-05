extends Node

class_name AsteroidsSpawner

signal points_updated(points: int)
signal game_won

@export var asteroid_scene: PackedScene
@export var count = 6
@export var base_asteroid_points_value = 50

@onready var explosion_audio_player: AudioStreamPlayer2D = $"../ExplosionAudioPlayer"

var total_asteroids_count = 0
var destroyed_asteroids_count = 0;
var points = 0


const Utils = preload("res://Scenes/Utils/utils.gd")

func _ready() -> void:
	total_asteroids_count = count * 7
	for i in range(count):
		var random_spawn_position = get_random_position_from_screen_rect()
		spawn_asteroid(Utils.AsteroidSize.BIG, random_spawn_position)

func get_random_position_from_screen_rect() -> Vector2:
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	var zoom = camera.zoom
	var camera_position = camera.position
	var size = rect.size / zoom
	var bounds = {}
	
	bounds.top = (camera_position.y - size.y) /2
	bounds.bottom = (camera_position.y + size.y) /2
	bounds.right = (camera_position.x + size.x) /2
	bounds.left = (camera_position.x - size.x) /2
	
	var x = randf_range(bounds.left, bounds.right)
	var y = randf_range(bounds.top, bounds.bottom)
	
	return Vector2(x,y)

func spawn_asteroid(size: Utils.AsteroidSize, position: Vector2):
	var asteroid = asteroid_scene.instantiate() as Asteroid
	get_tree().root.add_child.call_deferred(asteroid)
	asteroid.global_position = position
	asteroid.size = size
	asteroid.on_asteroid_destroyed.connect(asteroid_destroyed)
	
func asteroid_destroyed(size: int, position: Vector2):
	explosion_audio_player.play()
	points += base_asteroid_points_value * (size + 1)
	points_updated.emit(points)
	destroyed_asteroids_count += 1
	if destroyed_asteroids_count == total_asteroids_count:
		game_won.emit()
	if(size <= 2):
		for i in range(2):
			spawn_asteroid(size, position)
