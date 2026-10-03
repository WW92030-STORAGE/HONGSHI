extends Node2D

var initupdate = 100

func _physics_process(delta):
	if initupdate > 0:
		initupdate -= 1
		return
		
	for x in get_children():
		if x.is_in_group(HS.GROUP):
			x.update()
