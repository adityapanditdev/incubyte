module SpacecraftAngle
  def turn_upward(direction)
    val = direction != 'Up' && direction != 'Down' ? 'Up' : direction
    [val, direction]
  end

  def turn_downward(direction)
    val = direction != 'Up' && direction != 'Down' ? 'Down' : direction
    [val, direction]
  end
end