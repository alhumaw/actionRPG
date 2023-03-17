extends CharacterBody2D

var knockback = Vector2.ZERO
var knockback_velocity = Vector2.ZERO
const EnemyDeathEffect = preload("res://Effects/bat_death_effect.tscn")
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var playerDetection = $PlayerDetection

@export var ACCELERATION = 25
@export var MAX_SPEED = 25
@export var FRICTION = 800
enum{
	MOVE,
	IDLE,
	HIT,
	CHASE
	
}


var state = CHASE
@onready var stats = $stats
var dir = Vector2.RIGHT
var old = 0
func _ready():
	animationTree.active=true

@onready var hurtbox = $Hurtbox
func _process(delta):
	# how fast does the knockback reach it's end?
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	# move and slide is only affected by the variable velocity
	# constantly pass values into velocity
	velocity += knockback
	move_and_slide()
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO,FRICTION * delta)
			seek_player()
			idle_state(delta)
		HIT:
			hit_state(delta)
		CHASE:
			var player = playerDetection.player
			if player != null:
				# difference between the positions
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION *delta)
			else:
				state = IDLE
	move_and_slide()
		
func seek_player():
	if playerDetection.can_see_player():
		state = CHASE

		
func hit_state(delta):
	animationTree.set("parameters/Hit/blend_position",-knockback_velocity)
	animationState.travel("Hit")
	

func idle_state(delta):
	animationTree.set("parameters/Idle/blend_position", dir)
	animationState.travel("Idle")

func _on_hurtbox_area_entered(area):
	state = HIT
	stats.health -= area.damage
	knockback = area.knockback_vector * 28

func attack_animation_finished():
	state = IDLE

func _on_stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instantiate()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
