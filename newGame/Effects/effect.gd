extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.

func _ready():
	self.animation_finished.connect(_on_animation_finished)
	play("Animate")


#when animation is done, delete animation
func _on_animation_finished():
	queue_free()
	
