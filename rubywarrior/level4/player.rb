class Player
  @health=20
  def play_turn(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.health <= @health.to_i and warrior.health > 3
      warrior.walk!
    elsif warrior.health < 15
      warrior.rest!
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
