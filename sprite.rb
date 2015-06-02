require 'gosu'

class Sprite
  attr_accessor :x, :y, :vx, :vy
  attr :width, :height

  def initialize(window, filename, width, height, x, y, vx, vy)
    @window = window
	  @image  = Gosu::Image.new(window,filename,false)
    @width  = width
	  @height = height
    @xscale = (1.0*width)/(1.0*@image.width)
    @yscale = (1.0*height)/(1.0*@image.height)
    @x = x
    @y = y
    @vx = vx
    @vy = vy
  end

  def left_edge
    @x - @width/2
  end

  def right_edge
    @x + @width/2
  end

  def top_edge
    @y - @height/2
  end

  def bottom_edge
    @y + @height/2
  end

  def collide?(x)
    x.left_edge <= right_edge && x.right_edge >= left_edge && x.bottom_edge >= top_edge && x.top_edge <= bottom_edge
  end

  def move
    @x += @vx
    @y += @vy
  end

  def update
    move
	  @vx *= -1.0 if 0 > left_edge ||  right_edge > @window.width
  	@vy *= -1.0	if 0 >  top_edge || bottom_edge > @window.height
  end

  def draw
	  @image.draw( @x-@width/2, @y-@height/2, 1, @xscale, @yscale )
  end
end