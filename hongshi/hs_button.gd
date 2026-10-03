extends HSComponent
class_name HSButton

@onready var BODIES = {}
@onready var isPressed = false

func _ready():
	super._ready()
	
func toggle():
	var power = 0
	if len(BODIES) > 0 or isPressed:
		power = 16
	set_meta(HS.POWER, power)
	super.update()

func _on_button_button_down() -> void:
	isPressed = true
	toggle()

func _on_button_button_up() -> void:
	isPressed = false
	toggle()

func _on_area_x_body_entered(body: Node2D) -> void:
	BODIES[body] = 0
	toggle()

func _on_area_x_body_exited(body: Node2D) -> void:
	if body in BODIES:
		BODIES.erase(body)
	toggle()
