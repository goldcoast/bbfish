class Player
  @hp_rest_to_full = false
  @turnsTime=0
  @lastHP = 20
  def play_turn(warrior)
    if @turnsTime.to_i < 2
      rescue_c warrior
    elsif warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel.empty? and warrior.health < @lastHP.to_i and @hp_rest_to_full!=true
      warrior.walk!(:backward)
    elsif warrior.health < 18 and warrior.health > 4 and @hp_rest_to_full!=true
      warrior.rest!
      @hp_rest_to_full=true if warrior.health>16
    else
      warrior.walk!
      p "forward"
    end
    @lastHP=warrior.health
    @turnsTime = @turnsTime.to_i + 1
  end

  
  def rescue_c (warrior)
    if @turnsTime.to_i == 0
      warrior.walk!(:backward)
    elsif warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    end
  end

end
