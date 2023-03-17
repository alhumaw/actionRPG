extends Area2D

func is_colliding():
	var areas = get_overlapping_areas()
	# if array is greater than 0, we are colliding, return true
	return areas.size() > 0
	
func get_push_vector():
	var areas=  get_overlapping_areas()
	var push_vector = Vector2.ZERO
	if is_colliding():
		# get first area we collide with
		var area = areas[0]
		push_vector = area.global_position.direction_to(global_position)
		push_vector = push_vector.normalized()
	# return 0 if we're not colliding with anything
	return push_vector
	
