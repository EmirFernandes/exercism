defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    case [direction, position] do
      [v, {x, y}] when v in [:north, :east, :south, :west] and is_integer(x) and is_integer(y) ->
        %{direction: direction, position: position}

      [v, _] when v in [:north, :east, :south, :west] ->
        {:error, "invalid position"}

      _ ->
        {:error, "invalid direction"}
    end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    if Regex.match?(~r/[^RLA]/, instructions) do
      {:error, "invalid instruction"}
    else
      instructions
      |> String.to_charlist
      |> Enum.reduce(robot, &update_robot/2)
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end

  defp update_robot(?R, robot) do
    case robot do
      %{direction: :north, position: direction} -> %{direction: :east,  position: direction}
      %{direction: :east,  position: direction} -> %{direction: :south, position: direction}
      %{direction: :south, position: direction} -> %{direction: :west,  position: direction}
      %{direction: :west,  position: direction} -> %{direction: :north, position: direction}
    end
  end
  defp update_robot(?L, robot) do
    case robot do
      %{direction: :north, position: direction} -> %{direction: :west,  position: direction}
      %{direction: :west,  position: direction} -> %{direction: :south, position: direction}
      %{direction: :south, position: direction} -> %{direction: :east,  position: direction}
      %{direction: :east,  position: direction} -> %{direction: :north, position: direction}
    end
  end
  defp update_robot(?A, robot) do
    case robot do
      %{direction: :north, position: {x, y}} -> %{direction: :north, position: {x, y+1}}
      %{direction: :east,  position: {x, y}} -> %{direction: :east,  position: {x+1, y}}
      %{direction: :south, position: {x, y}} -> %{direction: :south, position: {x, y-1}}
      %{direction: :west,  position: {x, y}} -> %{direction: :west,  position: {x-1, y}}
    end
  end
end
