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
	
