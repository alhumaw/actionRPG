extends CharacterBody2D

@export var ACCELERATION = 60
@export var MAX_SPEED = 40
@export var FRICTION = 400
var knockback = Vector2.ZERO
const EnemyDeathEffect = preload("res://Effects/bat_death_effect.tscn")

enum{
	IDLE,
	WANDER,
	CHASE
}
@onready var sprite = $Sprite2D
@onready var stats = $Stats
@onready var playerDetection = $PlayerDetection
var state = CHASE
@onready var hurtbox = $Hurtbox
@onready var softCollision = $SoftCollision
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
		WANDER:
			pass
		CHASE:
			var player = playerDetection.player
			if player != null:
				# difference between the positions
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION *delta)
			else:
				state = IDLE
			sprite.flip_h = velocity.x < 0
	if softCollision.is_colliding():
		velocity += softCollision.get_push_vector() * delta * 100
	move_and_slide()
		

func seek_player():
	if playerDetection.can_see_player():
		state = CHASE

func _on_hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 8


func _on_stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instantiate()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
