extends HSComponent
class_name HSLever

func _ready():
	super._ready()
	
func toggle():
	var power = 0
	if get_meta(HS.POWER) != 16:
		power = 16
	set_meta(HS.POWER, power)
	super.update()

func _on_button_button_down() -> void:
	toggle()


func _on_area_x_body_entered(body: Node2D) -> void:
	toggle()
