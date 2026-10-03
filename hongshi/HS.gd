extends Node

var ORDER = 4
var SIDE = (1<<ORDER)
var GROUP = "HongShi"

# Metadata
var HS_TICK = "HS_TICK"
var POWER = "POWER"

# Subgroups
var OUTPUT = "OUTPUT"
var INPUT = "INPUT"

var HONGSHI_TICK = 0
func _physics_process(delta):
	HONGSHI_TICK += 1
