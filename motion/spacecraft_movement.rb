module SpacecraftMovement
  def move_forward(position, direction)
    case direction
    when 'N' then position[1] += 1
    when 'S' then position[1] -= 1
    when 'E' then position[0] += 1
    when 'W' then position[0] -= 1
    when 'Up' then position[2] += 1
    when 'Down' then position[2] -= 1
    else
      raise ArgumentError, "Invalid direction: #{direction}"
    end
  end

  def move_backward(position, direction)
    case direction
    when 'N' then position[1] -= 1
    when 'S' then position[1] += 1
    when 'E' then position[0] -= 1
    when 'W' then position[0] += 1
    when 'Up' then position[2] -= 1
    when 'Down' then position[2] += 1
    else
      raise ArgumentError, "Invalid direction: #{direction}"
    end
  end
end