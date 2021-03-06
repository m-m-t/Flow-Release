-- Deathrun Dust Beta 3
-- Added on: 19th of January 2015
-- Added by: Gravious
-- Last updated on: 19th of January 2015

__MAP = {

	Name = "Dust",
	RealName = "deathrun_dust_b3",
	
	--[[
	Tracker = {
		"stats_topspeed",
		"stats_topfastest",
		"stats_topjumps",
		"stats_minjumps",
	},
	
	Hooks = {
		["StartZone"] = {
			Start = Vector( 123, 123, 123 ),
			End = Vector( 456, 456, 456 )
		},
		
		["EndZone"] = {
			Start = Vector( 123, 123, 123 ),
			End = Vector( 456, 456, 456 )
		},
	
		["ResetPosition"] = {
			Start = Vector( 123, 123, 123 ),
			End = Vector( 456, 456, 456 ),
			Target = Vector( 789, 789, 789 )
		}
	}
	]]
}