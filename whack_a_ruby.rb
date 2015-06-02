require 'gosu'

class WhackARuby < Gosu::Window
    SCALE = 0.07
    HEIGHT = 900
    WIDTH = 900

	def initialize
		super WIDTH,HEIGHT,false
		@brachydios = Gosu::Image.new(self,'brachydios.png',false)
		@width = @brachydios.width
		@height = @brachydios.height
		@scaled_width = SCALE * @width
		@scaled_height = SCALE * @height
		puts "width: #{@width}"
		puts "height: #{@height}"
		@x = WIDTH/2
		@y = HEIGHT/2

		@vx = 20
		@vy = 20
		self.caption = "Hal's Whack-A-Brach!"
	end

	def update
		@x += @vx
		@y += @vy
		if @x + @scaled_width/2 > WIDTH or @x - @scaled_width < 0
			@vx *= 1.0
		end
		if @y + @scaled_height/2 > HEIGHT or @y - @scaled_height < 0
			@vy *= -1.0
		end
		puts "x: #{@x}"
		puts "y: #{@y}"
	end

	def draw
		@brachydios.draw( @x-@scaled_width/2, @y-@scaled_height, 1, 0.07, 0.07 )
	end
end

window = WhackARuby.new
window.show