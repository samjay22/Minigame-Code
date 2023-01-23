local lobspawn = script.Parent

lobspawn.Transparency = 0
lobspawn.Material = Enum.Material.Neon
lobspawn.CanCollide = false

while wait(1) do
	lobspawn.BrickColor = BrickColor.Random()
	wait(1)
end

