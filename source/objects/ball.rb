class Ball < Chingu::GameObject
  attr_accessor :color
  
  def initialize(options)
    super
    @window = options[:window]
    @image = Image["data/ball.png"]
    
    @body = CP::Body.new(90, 75)
    @body.p = vec2(options[:x], options[:y])

    @shape  = CP::Shape::Circle.new(@body, 10, CP::ZERO_VEC_2)
    @shape.collision_type = :foo
    @shape.e = 0
    @shape.u = 1 

    @window.space.add_body(@body)
    @window.space.add_shape(@shape)
  end
  
  def update
    self.x = @body.p.x
    self.y = @body.p.y
  end

  def draw
    @image.draw(@shape.body.pos.x, @shape.body.pos.y, 0)
  end
  
end
