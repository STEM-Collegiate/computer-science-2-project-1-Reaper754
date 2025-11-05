extends CharacterBody2D

class_name Player

signal on_player_died

@export var max_speed = 10
@export var rotation_speed = 3.5
@export var velocity_damping_factor = 0.5
@export var linear_velocity = 200

@onready var invincibility_timer = $InvincibilityTimer
@onready var blinking_timer = $BlinkingTimer
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var enginge_sprite = $EngineSprite
@onready var engine_audio_player = $EngineAudioPlayer

var is_invincible = false
var input_vector: Vector2

var rotation_direction: int

func _ready():
	blinking_timer.timeout.connect(toggle_visibility)
	invincibility_timer.timeout.connect(stop_invincibility)

func _process(_delta): 
	input_vector.x = Input.get_action_strength("rotate_left") - Input.get_action_strength("rotate_right")
	input_vector.y = Input.get_action_strength("thrust")
	
	if Input.is_action_pressed("rotate_left"):
		rotation_direction = -1
	elif Input.is_action_pressed("rotate_right"):
		rotation_direction = 1
	else:
		rotation_direction = 0
	
	if input_vector.y != 0:
		if !engine_audio_player.playing:
			engine_audio_player.play()
		animation_player.play("engine_animation")
	else: 
		if engine_audio_player.playing:
			engine_audio_player.stop()
		animation_player.stop()
		enginge_sprite.visible = false

func _physics_process(delta):
	rotation += rotation_direction * rotation_speed * delta
	
	if (input_vector.y > 0):
		accelerate_forward(delta)
	elif input_vector.y == 0 && velocity != Vector2.ZERO:
		slow_down_and_stop(delta)
	
	move_and_collide(velocity * delta)

func accelerate_forward(delta: float):
	velocity += (input_vector * linear_velocity * delta).rotated(rotation)
	velocity.limit_length(max_speed)

func slow_down_and_stop(delta: float):
	velocity = lerp(velocity, Vector2.ZERO, velocity_damping_factor * delta)
	
	if velocity.y >= -0.1 && velocity.y <= 0.1:
		velocity.y = 0

func start_invincibility():
	is_invincible = true
	blinking_timer.start()
	invincibility_timer.start()

func toggle_visibility():
	if sprite.visible:
		sprite.visible = false
	else:
		sprite.visible = true

func stop_invincibility():
	is_invincible = false
	sprite.visible = true
	blinking_timer.stop()
	invincibility_timer.stop()
