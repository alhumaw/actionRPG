extends Control

#THIS IS THE WAY
var hearts = 4: set = _set_hearts, get = _get_hearts

@onready var heartUIFULL = $HeartUIFull
@onready var heartUIEMPTY = $HeartUIEmpty

func _set_hearts(new_value):
	hearts = clamp(new_value, 0, max_hearts)
	if heartUIFULL != null:
		heartUIFULL.set_size(Vector2(hearts * 15,11))
		
func _get_hearts():
	return hearts
	
var max_hearts = 4: set = _set_max_hearts, get = _get_max_hearts

func _set_max_hearts(new_value):
	max_hearts = max(new_value,1)
	self.hearts = min(hearts, max_hearts)
	if heartUIEMPTY != null:
		heartUIEMPTY.set_size(Vector2(hearts * 15, 11))

func _get_max_hearts():
	return max_hearts

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.health_changed.connect(_set_hearts)
	PlayerStats.max_health_changed.connect(_set_max_hearts)
