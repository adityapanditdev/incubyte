module SpacecraftMovement
  def move_forward(position, direction)
    position[1] += 1
  end

  def move_backward(position, direction)
    position[1] -= 1
  end
end