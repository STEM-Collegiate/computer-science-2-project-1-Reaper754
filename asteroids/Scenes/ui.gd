extends CanvasLayer

var life_texture = preload("res://Assets/Sprites/Lives.png")
var empty_life_texture = preload("res://Assets/Sprites/Player.png")

@onready var lifes_manager: LifesManager = $"../LifesManager"
@onready var lifes_container: HBoxContainer = $MarginContainer/LifesContainer
@onready var game_over_label: Label = $%GameOverLabel
@onready var points_label: Label = $%PointsLabel
@onready var asteroid_spawner: AsteroidsSpawner = $"../AsteroidsSpawner"

func _ready() -> void:
	var lifes_count = lifes_manager.lifes
	for i in range(lifes_count):
		var life_texture_rect = TextureRect.new()
		life_texture_rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		life_texture_rect.stretch_mode = TextureRect.STRETCH_SCALE
		life_texture_rect.texture = life_texture
		life_texture_rect.custom_minimum_size = Vector2(32, 32)
		lifes_container.add_child(life_texture_rect)
		
	lifes_manager.player_life_lost.connect(life_lost)
	asteroid_spawner.points_updated.connect(set_points)
	asteroid_spawner.game_won.connect(on_game_won)

func life_lost(lifes_left):
	var life_texture_rect: TextureRect =  lifes_container.get_child(lifes_left)
	life_texture_rect.texture = empty_life_texture
	if lifes_left == 0:
		game_over_label.visible = true

func set_points(points: int):
	points_label.text = "%d" % points

func on_game_won():
	game_over_label.visible = true
	game_over_label.text = "You have won!"
	game_over_label.add_theme_font_size_override("font_size", 90)
	game_over_label.add_theme_color_override("font_color", Color.CHARTREUSE)
