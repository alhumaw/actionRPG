extends AnimatedSprite2D


@onready var animatedSprite = $AnimatedSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	animatedSprite.play("Animate")
	# Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		animatedSprite.play("Animate")

func _on_animation_finished():
	pass # Replace with function body.
