extends HSComponent
class_name HSDiode

func _ready():
	super._ready()

func update():
	
	# Stuff goes here
	
	var isPowered = false
	for i in range(4):
		for area in $AreaD.get_overlapping_areas():
			if area.is_in_group(HS.OUTPUT):
				var object = area.get_parent()
				if object.is_in_group(HS.GROUP):
					if object.get_meta(HS.POWER):
						isPowered = true
						break
	
	var power = 0
	if isPowered:
		power = 16
	if get_meta(HS.POWER) != power:
		set_meta(HS.POWER, power)
		super.update()
	
