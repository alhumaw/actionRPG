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
		
		
		
