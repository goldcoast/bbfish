class Player
  @lastHP = 20
  def play_turn(warrior)
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.empty? and warrior.health < @lastHP.to_i 
      warrior.walk!
    elsif warrior.health < 15 and warrior.health>5
      warrior.rest!
    else
      warrior.walk!
    end
    @lastHP=warrior.health
  end
end
