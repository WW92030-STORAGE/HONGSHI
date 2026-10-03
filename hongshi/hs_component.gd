class_name HSComponent
extends Node2D

func _ready():
	modulate()
	
# super().Modulate should be called at the end of _process(delta)
func modulate():
	const ONEOVERFIFTEEN = 1.0 / 15.0
	var x = clamp(get_meta(HS.POWER), 0, 15) * ONEOVERFIFTEEN
	$Sprite2D.modulate = Color(x, x, x)

func update():
	modulate()
	
	if HS.HONGSHI_TICK == get_meta(HS.HS_TICK):
		return
	set_meta(HS.HS_TICK, HS.HONGSHI_TICK)
	
	var childs = get_children()
	for node in childs:
		if (node is not Area2D) or !(node.is_in_group(HS.OUTPUT)):
			continue
		for area in node.get_overlapping_areas():
			if area in childs:
				continue
			if !area.is_in_group(HS.INPUT):
				continue
			var object = area.get_parent()
			if object == self:
				continue
			if object.is_in_group(HS.GROUP):
				object.update()
