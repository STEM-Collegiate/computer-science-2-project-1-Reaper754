extends CPUParticles2D

@onready var timer = $Timer

func _ready() -> void:
	timer.wait_time = lifetime
	timer.timeout.connect(queue_free)



func _process(delta: float) -> void:
	if emitting && timer.is_stopped():
		timer.start()
		
