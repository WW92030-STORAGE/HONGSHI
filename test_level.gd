extends Node2D

var initupdate = 10

func _ready():
	Engine.physics_ticks_per_second = 10

func _physics_process(delta):
	if initupdate > 0:
		initupdate -= 1
		return
		
	for x in get_children():
		if x.is_in_group(HS.GROUP):
			x.update()
