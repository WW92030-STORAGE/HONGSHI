class_name HSWire
extends HSComponent

@onready var AREAS = [$AreaL, $AreaU, $AreaR, $AreaD, $AreaX]

func _ready():
	super._ready()

func updateSprite():
	var matrix = 0
	for i in range(4):
		if len(AREAS[i].get_overlapping_areas()) > 0:
			matrix |= (1<<i)
			
	$Sprite2D.texture.region = Rect2((matrix>>2)<<HS.ORDER, (matrix & 3)<<HS.ORDER, HS.SIDE, HS.SIDE)

func update():
	updateSprite()
	
	# Stuff goes here
	
	var highestPower = 0
	for i in range(5):
		for area in AREAS[i].get_overlapping_areas():
			if area.is_in_group(HS.OUTPUT):
				var object = area.get_parent()
				if object.is_in_group(HS.GROUP):
					var power = object.get_meta(HS.POWER)
					if power >= highestPower:
						highestPower = max(highestPower, object.get_meta(HS.POWER))
	
	if highestPower > 0:
		highestPower -= 1
	if get_meta(HS.POWER) != highestPower:
		set_meta(HS.POWER, highestPower)
	super.update()
