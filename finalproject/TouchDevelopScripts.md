	As mentioned in the paper, Microsoft has been developing a platform called TouchDevelop that allows users to create applications with relative ease. As this is introduced, the scripts are fairly easy to get a hang of and this makes it so that incorporating security into these scripts also fairly easy. Below are some examples of how to create simple games with TouchDevelop scripts.

//These are scripts for TouchDevelop and can be run on 
//https://www.touchdevelop.com

//The game involves tapping an alien to score as high as you 
// can before it dies 3 times by falling.

![Alt text](/aliengame.png)
action main ()
	wall → set background picture(✿ jungle)
	var board := ♻ game → start
	var sprite := board → create picture(✿ monster)
	sprite → set height(200)
	sprite → on tap(tapped)
		where tapped(x : Number , y : Number) is
			sprite → set speed y( - 200)
			✿ laser sound effect → play
			♻ game → add score(100)
	board → set gravity(0, 400)
	board → add on every frame(perform)
		where perform() is
			if sprite → y > board → height then
				sprite → set speed y( - 500)
				✿ magic sound → play
				var vx := math → random range( - 100, 100) * 3
				sprite → set speed x(vx)
				♻ game → remove life(1)
		else do nothing
		if sprite → x < 0 or sprite → x > board → width then
			sprite → set speed x( - sprite → speed x)
			✿ magic sound → play
		else do nothing

art jungle : Picture
with url: "https://az31353.vo.msecnd.net/pub/nslthwge"
art laser sound effect : Sound
with url: "https://az31353.vo.msecnd.net/pub/hpaoizlg"
art magic sound : Sound
with url: "https://az31353.vo.msecnd.net/pub/bkhlopxr"
art monster : Picture
with url: "https://az31353.vo.msecnd.net/pub/ymggwtmn"
import game
published phqub


![Alt text](/turtle.png)
//This script has a turtle draw boxes in rainbow colors
action main ()
	♻ turtle → forward(200)
	♻ turtle → left turn(90)
	♻ turtle → set pen color(colors → random)
	♻ turtle → forward(200)
	♻ turtle → left turn(90)
	♻ turtle → forward(200)
	♻ turtle → left turn(90)
	♻ turtle → forward(200)
	for 0 ≤ i < 4 do
		♻ turtle → forward(200)
		♻ turtle → right turn(90)
	♻ turtle → set speed(1000)
	for 0 ≤ j < 100 do
		♻ turtle → forward(10 + j * 6)
		♻ turtle → left turn(91)
		var hue := j / 99
		var rainbow := colors → wheel(hue)
		♻ turtle → set pen color(rainbow)

import turtle
published xkpe