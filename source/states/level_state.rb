class LevelState < Chingu::GameState

  def initialize(options={})
    super

    @window = options[:window]
  end

  def setup
    self.input = { :p => :edit_level }

    @body = CP::Body.new(0, 0)
    @body.p = vec2(0,0)
    @body.v = vec2(0,0)

    @a = vec2(100, 500)
    @b = vec2(500, 500)
    @shape  = CP::Shape::Segment.new(@body, @a, @b, 25)
    @shape.collision_type = :line
    @shape.e = 1
    @shape.u = 1 

    @window.space.add_static_shape(@shape)

    spawn_ball
  end

  def edit_level
    push_game_state(GameStates::Edit.new(:grid => [32,32], :classes => [Ball]))
  end

  def spawn_ball
    Ball.create(:x => 200, :y => 500, :window => @window)
  end

  def update
    super

    @window.space.step(@window.dt / 1000.0)
  end
  
  def draw
    @window.caption = "FPS: #{$window.fps}radius based iterative collision detection. Particles#: #{game_objects.size}, Collisionchecks each gameloop: ~#{game_objects.size**2} - "
    @window.draw_line(@body.p.x + @a.x, @body.p.y + @a.y, Gosu::white,
                      @body.p.x + @b.x, @body.p.y + @b.y, Gosu::white,
                      1)

    super
  end
end
