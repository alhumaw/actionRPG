3/6/2023:
	
	This is the first day that I start my project!
	I first created a world, where we defined our borders
	I then imported a sprite sheet split of the animations as well as created the animations
	I got a little bit ahead by creating the animations, but i think they look cool!
	I learned quite a bit about movement using vectors in game development:
		Think about a graph: 
			Right = (1,0), Left = (-1,0)
			

3/7/2023:
	
	Today I added a more natural feel to the movements by adding:
		Friction
		Acceleration
		Max speed
	There was an issue with the speed multiplying when moving diagonally:
		This was fixed by implementing normalization:
			The vector is capped, it used to go beyond our x,y coordinates
			using normalization our point is set to the max of our x,y coordinate
		
	I added collisions, very easy
	
	Added bush collisions using capsule boxes
	created bush scene then inserted bush
	y-sort so player stays on top of bush until behind
	
	ANIMATION TREES!
	This is my first taste of building state machines to create automations
	I created an idle->Run state machine. we had some issue with our h-flip bandaid solution, it seems to have fixed itself..
	Once our state machine was created, we began the code by directly calling our animation tree
	We then said, "hey move our blend positions for whatever our vector is at for all animations"
	e.g: if our vector is at (1,0), set our blend position to (1,0) for idle and run
	this will allow us to move right and also idle right
	
	AUTOTILING:
	Sort of writing this the day after, but I figured out autotiling
	First we need a tile atlas. Then create a new tilemap node under our world tree
	Right side, click tileset dropdown->new tileset
	drag our tile atlas in, then on the right go to:
		Terrain Sets->New Terrain
		Mode=Match corners
		Go to TileSet tab below, click paint->terrain:
			terrain set 0
			terrain 0
			highlight the entire atlas
			then block by block just select all the pieces that don't have pixel imperfections
			
3/8/2023

	Added a cliff tileset. Kind of having a hard time understanding how tilesets work now
	Added collision as well:
		Right side tab, Physics Layers-> new
		Click on TileSet tab
		select the entire thing why not
		scroll down Physics->Physics layer 0
		press F and it will highlight everything
		done collisions added vry ez
		
	set up attack animations
	state machine in animation tree
	moved movement code into it's own state functions
	using ENUMs to switch between MOVE and ATTACK
	switch statement in our physics to either call move or attack
	method call key insert to stop looping of attack (switch back to MOVE)
	also learned about input maps

3/9/2023

	Learning how to instance scenes by creating a grass effect animation when player swings
	Using animatedSprite2D to handle our animations, then created a script which essentially says "play this when called"
	and delete this when the animation is done.
	I then loaded the scene in our grass scripted, instantiated an object for it
	then played the animation on top of the grass!
	
	Created hurtboxes for the grass and hitboxes for the player attack zone
	Used rotational key automation to switch the direction of the hitbox to the direction of the player swing
	Utlized signals to say "hey when the hitbox overlaps with the hurtbox, destroy grass"
	

3/9/2023
	Made a bat! obtained a greater understanding of 'move_and_slide'.
	constantly have to pass in velocity for knockback to work.
	

3/15/2023
	Inheritance stuff.
	getters and setter
	Enemy health
	
	Made the slime look like it's recoiling in the opposite direction of the hit.
	In the idle_state function, checking the direction of the knockback and setting 
	the dir.x value accordingly. This will allow us to use the dir vector as the blend_position 
	parameter to control the direction that the slime is facing in the idle animation.
	However, there's a small issue with the idle_state function. The set function expects a Vector2 
	parameter for the blend_position argument, but you're passing in a single float value (dir.x). 
	To fix this, you can create a Vector2 with the X value set to dir.x and the Y value set to 0.0, 
	since the slime is facing horizontally.
	
	
3/17/2023
	Finally got the AI to be at a comfortable speed
	Added health bar functionality (and player health)
	Added tree :D
	Added camera :O
	Lighting now needs to be sorted out. generally just want to have a sun effect
	Soft collisions added so bats no longer overlap.
	Don't know if it is quite necessary yet for slimes
	
	
	
	
		
		
