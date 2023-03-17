extends Node



signal no_health
signal health_changed(value)
signal max_health_changed(value)

@export var max_health = 1: set = _set_max_health, get = _get_max_health
var health = max_health: set = _set_health, get = _get_health

func _set_max_health(new_value):
	max_health = new_value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)

func _set_health(new_value):
	health = new_value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
	
func _get_health():
	return health

func _get_max_health():
	return max_health


func _ready():
	self.health = max_health
