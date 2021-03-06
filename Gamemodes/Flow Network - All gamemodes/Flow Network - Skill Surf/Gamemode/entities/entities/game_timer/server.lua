local Zone = {
	MStart = 0,
	MEnd = 1,
	BStart = 2,
	BEnd = 3,
	AC = 4,
	Restart = 5
}

function ENT:Initialize()
	local BBOX = (self.max - self.min) / 2

	self:SetSolid( SOLID_BBOX )
	self:PhysicsInitBox( -BBOX, BBOX )
	self:SetCollisionBoundsWS( self.min, self.max )

	self:SetTrigger( true )
	self:DrawShadow( false )
	self:SetNotSolid( true )
	self:SetNoDraw( false )

	self.Phys = self:GetPhysicsObject()
	if self.Phys and self.Phys:IsValid() then
		self.Phys:Sleep()
		self.Phys:EnableCollisions( false )
	end

	self:SetZoneType( self.zonetype )
end

function ENT:StartTouch( ent )  
	if IsValid( ent ) and ent:IsPlayer() and ent:Team() != TEAM_SPECTATOR then
		local zone = self:GetZoneType()
		if zone == Zone.MStart then
			ent:ResetTimer()
		elseif zone == Zone.MEnd and ent.Tn and not ent.TnF then
			ent:StopTimer()
		elseif zone == Zone.BStart then
			ent:BonusReset()
		elseif zone == Zone.BEnd and ent.Tb and not ent.TbF then
			ent:BonusStop()
		elseif zone == Zone.AC then
			ent:StopAnyTimer()
		elseif zone == Zone.Restart then
			ent:RestartPlayer()
		end
	end
end

function ENT:EndTouch( ent )
	if IsValid( ent ) and ent:IsPlayer() and ent:Team() != TEAM_SPECTATOR then
		local zone = self:GetZoneType()
		if zone == Zone.MStart then
			ent:StartTimer()
		elseif zone == Zone.BStart then
			ent:BonusStart()
		end
	end
end