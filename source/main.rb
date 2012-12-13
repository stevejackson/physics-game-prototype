require 'rubygems' rescue nil
$LOAD_PATH.unshift File.join(File.expand_path(__FILE__), "..", "..", "lib")
require 'chingu'
include Gosu
include Chingu
require 'chipmunk'

require './source/objects/ball'
require './source/objects/quad'
require './source/states/level_state'

class Game < Chingu::Window
  attr_accessor :space

  def initialize
    super(800,800)

    self.input = { :esc => :exit }
    self.caption = "Physics Game Prototype"

    self.space = CP::Space.new
    self.space.gravity = vec2(0, 10)

    push_game_state(LevelState.new(:window => self))
  end

  def next_effect; pop_game_state; end
end


Game.new.show
