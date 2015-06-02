require 'gosu'

require_relative 'sprite'

class WhackABrachydios < Gosu::Window
    HEIGHT = 1000
    WIDTH  =  500

	def initialize(n)
		super WIDTH,HEIGHT,false
		self.caption = "Hal's Whack-A-Brach!"
		@brachydioses = []
		n.times{ |i| @brachydioses.push generate_brachydios }
	end

	def generate_brachydios
		Sprite.new(self, 'brachydios.png', 25, 25, WIDTH*rand, HEIGHT*rand, 50*rand, 50*rand)
	end

	def update
		@brachydioses.each(&:update)
		for i in 0..(@brachydioses.size-1)
			for j in (i+1)..(@brachydioses.size-1)
				brachydios1 = @brachydioses[i]
				brachydios2 = @brachydioses[j]
		        if brachydios1.collide?(brachydios2)
			        brachydios1.vx = -1.0*brachydios1.vx
			        brachydios1.vy = -1.0*brachydios1.vy
			        brachydios2.vx = -1.0*brachydios2.vx
			        brachydios2.vy = -1.0*brachydios2.vy
			    end
			end
		end
	end

	def draw
		@brachydioses.each(&:draw)
	end
end

window = WhackABrachydios.new( (ARGV[0] || "10").to_i )
window.show