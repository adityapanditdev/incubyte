module SpacecraftRotation
  def turn_left(direction, prev_direction)
    direction = prev_direction if prev_direction != nil && (direction == 'Up' ||direction == 'Down')
    case direction
    when 'N' then 'W'
    when 'S' then 'E'
    when 'E' then 'N'
    when 'W' then 'S'
    end
  end

  def turn_right(direction, prev_direction)
    direction = prev_direction if prev_direction != nil && (direction == 'Up' ||direction == 'Down')
    case direction
    when 'N' then 'E'
    when 'S' then 'W'
    when 'E' then 'S'
    when 'W' then 'N'
    end
  end
end