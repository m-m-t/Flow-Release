Config.Area = {
	Start = 1,
	Finish = 2,
	Block = 3,
	Teleport = 4,
	StepSize = 5,
	Velocity = 6,
	Freestyle = 7,
	BonusA = 10,
	BonusB = 11,
}

local DrawMaterial = Material( "bhop/timer.png" )
local DrawArea = {
	[Config.Area.Start] = Color(0, 230, 0, 255),
	[Config.Area.Finish] = Color(180, 0, 0, 255),
	[Config.Area.BonusA] = Color(127, 140, 141),
	[Config.Area.BonusB] = Color(52, 73, 118),
	[Config.Area.Freestyle] = Color(50, 0, 255, 255)
}

function ENT:Initialize() end
 
function ENT:Think()
	local Min, Max = self:GetCollisionBounds()
	self:SetRenderBounds( Min, Max )
end
 
function ENT:Draw()
	if not DrawArea[ self:GetAreaType() ] then return end
	
	local Min, Max = self:GetCollisionBounds()
	Min = self:GetPos() + Min
	Max = self:GetPos() + Max

	local Col, Width = DrawArea[ self:GetAreaType() ], 1
	local B1, B2, B3, B4 = Vector(Min.x, Min.y, Min.z), Vector(Min.x, Max.y, Min.z), Vector(Max.x, Max.y, Min.z), Vector(Max.x, Min.y, Min.z)
	local T1, T2, T3, T4 = Vector(Min.x, Min.y, Max.z), Vector(Min.x, Max.y, Max.z), Vector(Max.x, Max.y, Max.z), Vector(Max.x, Min.y, Max.z)
	
	render.SetMaterial( DrawMaterial )
	render.DrawBeam( B1, B2, Width, 0, 1, Col )
	render.DrawBeam( B2, B3, Width, 0, 1, Col )
	render.DrawBeam( B3, B4, Width, 0, 1, Col )
	render.DrawBeam( B4, B1, Width, 0, 1, Col )
		
	render.DrawBeam( T1, T2, Width, 0, 1, Col )
	render.DrawBeam( T2, T3, Width, 0, 1, Col )
	render.DrawBeam( T3, T4, Width, 0, 1, Col )
	render.DrawBeam( T4, T1, Width, 0, 1, Col )
	
	render.DrawBeam( B1, T1, Width, 0, 1, Col )
	render.DrawBeam( B2, T2, Width, 0, 1, Col )
	render.DrawBeam( B3, T3, Width, 0, 1, Col )
	render.DrawBeam( B4, T4, Width, 0, 1, Col )
end