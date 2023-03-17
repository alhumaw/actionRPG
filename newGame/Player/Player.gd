extends CharacterBody2D

# Vector2 is a x and y position combined.
# Represents the change in position
#MAXSPEED is needed because if we are multiplying by delta(1/60) we will be very slow
@export var ACCELERATION = 500
@export var MAX_SPEED = 80
@export var FRICTION = 500
var stats = PlayerStats
const CONNECT_ONESHOT = 1
#constants. 
enum{
	MOVE,
	ATTACK
}
var move_vector = Vector2.DOWN

var state = MOVE
@onready var animationTree = $AnimationTree
#access to state machine
@onready var animationState = animationTree.get("parameters/playback")
@onready var swordHitbox = $HitboxPivot/SwordHitbox
@onready var hurtbox = $Hurtbox
func _ready():
	# Assuming that 'PlayerStats' is an autoloaded singleton.
	
	stats.no_health.connect(func(): queue_free())
	animationTree.active=true
	swordHitbox.knockback_vector = move_vector

func _process(delta):
	match state: 
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
	
func move_state(delta):
		motion_mode = 1
		var input_vector = Vector2.ZERO
	#MOVE RIGHT = (1,0)
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#regulates vector graph to keep vector normalized to avoid faster sprites when running diagonal
		input_vector = input_vector.normalized()
	
	#if player is moving
		if input_vector != Vector2.ZERO:
			swordHitbox.knockback_vector = input_vector
			move_vector = input_vector
		# This will set the blend position whenever we move for all of our animations
			animationTree.set("parameters/Idle/blend_position", input_vector)
			animationTree.set("parameters/Run/blend_position", input_vector)
			#player must attack in that direction
			animationTree.set("parameters/Attack/blend_position",input_vector)
			animationState.travel("Run")
			velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION *delta)
	#stop
		else:
			animationState.travel("Idle")
		# this will make it so the player doesn't instantly stop, they kind of slide
		# the amount they slide is based on the friction we give
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		move_and_slide()
		
		if Input.is_action_just_pressed("attack"):
			state = ATTACK

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE

func extra_state(delta):
	velocity = move_vector * MAX_SPEED * 1.5


func _on_hurtbox_area_entered(area):
	stats.health -= 1
	hurtbox.start_invincibility(0.5)
	hurtbox.create_hit_effect()
