class Quad < Chingu::GameObject
  attr_accessor :body, :shape

  def initialize(options)
    super
    @image = Image["data/ball.png"]
  end

  def setup
    self.body = CP::Body.new(90, 75)
    self.body.p = vec2(self.x || 0, self.y || 0)

    self.shape  = CP::Shape::Circle.new(self.body, 10, CP::ZERO_VEC_2)
    self.shape.collision_type = :foo
    self.shape.e = 0
    self.shape.u = 1

    $window.space.add_body(self.body)
    $window.space.add_shape(self.shape)
  end

  def update
  end

  def draw
    @image.draw(self.shape.body.pos.x, self.shape.body.pos.y, 0)
  end

  # so chingu's edit game state also sets the physics location
  def x=(val)
    super
    self.body.p.x = val if self.body
  end

  # so chingu's edit game state also sets the physics location
  def y=(val)
    super
    self.body.p.y = val if self.body
  end

end
