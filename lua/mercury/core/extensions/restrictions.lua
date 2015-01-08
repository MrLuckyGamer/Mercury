
<<<<<<< HEAD
Mercury.Restrictions = { }  // Made by Rusketh



Mercury.Ranks.AddRankProperty( "restrictions", "table", { Tools = {},  Weaps = {}, Sents = {}} )
  
local function LoadRestrictions()
=======
Mercury.Restrictions = { }

Mercury.Commands.AddPrivilege("nolimits")

Mercury.Ranks.AddRankProperty( "restrictions", "table", {} )

hook.Add("Initialize", "Mercury:Restrictions", function()
>>>>>>> origin/master

/* --- --------------------------------------------------------------------------------
	@: No Limits
   --- */

	local META = FindMetaTable("Player")
	local GetCount = META.GetCount

	function META:GetCount(limit, ...)
		local Result = GetCount(self, limit, ...)

		if !self:HasPrivilege("nolimits") then return Result end
		
		return -1
	end
<<<<<<< HEAD
    
/* --- --------------------------------------------------------------------------------
	@: Tools
   --- */ 

	
=======
   
/* --- --------------------------------------------------------------------------------
	@: Tools
   --- */

	if !GAMEMODE.IsSandboxDerived then 
>>>>>>> origin/master
		local TOOLS = weapons.GetStored("gmod_tool").Tool

		function Mercury.Restrictions.RestrictTool(index, toolmode, blocked)
			local gax = Mercury.Ranks.RankTable[index]
			if !gax then return false, "RANK DOES NOT EXIST" end
			if !TOOLS[toolmode] then return false, "TOOLMODE DOES NOT EXIST" end
			
			local Restrictions = Mercury.Ranks.GetProperty(index, "restrictions")

			if !Restrictions then
				Restrictions = {}
				Mercury.Ranks.ModProperty(index,property,Restrictions)
			end
			
			if !Restrictions.Tools then Restrictions.Tools = { } end

			Restrictions.Tools[toolmode] = blocked and true or nil

<<<<<<< HEAD
				local sts, err = Mercury.Ranks.ModProperty(index,"restrictions",Restrictions)
				if !sts then return sts,err end
=======
			Mercury.Ranks.SaveRank(index, gax)
>>>>>>> origin/master

			return true
		end

		hook.Add("CanTool", "Mercury:Restrictions", function(play, trace, toolmode)
			local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")
			
			if !Restrictions or !Restrictions.Tools then return end
			
			if Restrictions.Tools[toolmode] then
<<<<<<< HEAD
				Mercury.Util.SendMessage(play, {Color(47,150,255,255),"You're not allowed to use this tool!"})
				return false
			end
		end )
	
=======
				Mercury.Util.SendMessage(play, {"Your not allowed to use this tool!"})
				return false
			end
		end )
	end
>>>>>>> origin/master

/* --- --------------------------------------------------------------------------------
	@: Sents
   --- */

<<<<<<< HEAD
	local SENTS = { 
	["item_ammo_357"]= true,
	["item_ammo_ar2"]= true,
	["item_ammo_ar2_altfire"]=  true,
	["combine_mine"]= true,
	["item_ammo_crossbow"]= true,
	["item_healthcharger"]= true,
	["item_healthkit"]= true,
	["item_healthvial"]= true,
	["grenade_helicopter"]= true,
	["weapon_striderbuster"]= true,
	["item_ammo_pistol"]= true,
	["item_rpg_round"]= true,
	["item_box_buckshot"]= true,
	["item_ammo_smg1"]= true,
	["item_ammo_smg1_grenade"]= true,
	["item_suit"]= true,
	["item_battery"]= true,
	["item_suitcharger"]= true,
	["npc_grenade_frag"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true, // Did I put enough emphasis on how much I hate this?
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,
	["prop_thumper"]= true,




	}
=======
	local SENTS = { }
>>>>>>> origin/master

		for _, Sent in pairs(scripted_ents.GetSpawnable() ) do
			SENTS[Sent.ClassName] = Sent
		end

	function Mercury.Restrictions.RestrictSent(index, sent, blocked)
		local gax = Mercury.Ranks.RankTable[index]
		if !gax then return false, "RANK DOES NOT EXIST" end
		if !SENTS[sent] then return false, "SENT DOES NOT EXIST" end
		
		local Restrictions = Mercury.Ranks.GetProperty(index, "restrictions")

		if !Restrictions then
			Restrictions = {}
			Mercury.Ranks.ModProperty(index,property,Restrictions)
		end
		
		if !Restrictions.Sents then Restrictions.Sents = { } end

		Restrictions.Sents[sent] = blocked and true or nil
<<<<<<< HEAD
 		local sts, err = Mercury.Ranks.ModProperty(index,"restrictions",Restrictions)
		if !sts then return sts,err end
=======

		Mercury.Ranks.SaveRank(index, gax)
>>>>>>> origin/master

		return true
	end

	hook.Add("PlayerSpawnSENT", "Mercury:Restrictions", function(play, class)
		local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")
		
		if !Restrictions or !Restrictions.Sents then return end
		
		if Restrictions.Sents[class] then
<<<<<<< HEAD
			Mercury.Util.SendMessage(play, {Color(47,150,255,255),"You're not allowed to spawn this!"})
=======
			Mercury.Util.SendMessage(play, {"Your not allowed to spawn this!"})
>>>>>>> origin/master
			return false
		end
	end )

/* --- --------------------------------------------------------------------------------
	@: Weps and Sweps
   --- */

	local WEAPS = { ["weapon_crowbar"] = true, ["weapon_pistol"] = true, ["weapon_smg1"] = true, ["weapon_frag"] = true, ["weapon_physcannon"] = true, ["weapon_crossbow"] = true, ["weapon_shotgun"] = true, ["weapon_357"] = true, ["weapon_rpg"] = true, ["weapon_ar2"] = true, ["weapon_physgun"] = true, ["weapon_annabelle"] = true, ["weapon_slam"] = true, ["weapon_stunstick"] = true }

	for _, Weap in pairs( weapons.GetList() ) do
		WEAPS[Weap.ClassName] = true
	end

<<<<<<< HEAD
	function Mercury.Restrictions.RestrictWeapon(index, weapon, blocked)
=======
	function Mercury.Restrictions.RestrictWepon(index, weapon, blocked)
>>>>>>> origin/master
		local gax = Mercury.Ranks.RankTable[index]
		if !gax then return false, "RANK DOES NOT EXIST" end
		if !WEAPS[weapon] then return false, "WEAPON DOES NOT EXIST" end
		
		local Restrictions = Mercury.Ranks.GetProperty(index, "restrictions")

		if !Restrictions then
			Restrictions = {}
			Mercury.Ranks.ModProperty(index,property,Restrictions)
		end
		
		if !Restrictions.Weaps then Restrictions.Weaps = { } end

		Restrictions.Weaps[weapon] = blocked and true or nil
<<<<<<< HEAD
		local sts, err = Mercury.Ranks.ModProperty(index,"restrictions",Restrictions)
		if !sts then return sts,err end
=======

		Mercury.Ranks.SaveRank(index, gax)
>>>>>>> origin/master

		return true
	end

	function Mercury.Restrictions.GiveWeapon(play, weapon)
		play._ALLOWEAPON = true
		local Weapon = play:Give(weapon)
		play._ALLOWEAPON = nil
		return Weapon
	end

<<<<<<< HEAD
	hook.Add("PlayerSpawnSWEP", "Mercury:Restrictions", function(play, Weapon, tbl)
		local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")


		if !Restrictions or !Restrictions.Weaps then return end
		
		if Restrictions.Weaps[Weapon] and !play._ALLOWEAPON then
		
			Mercury.Util.SendMessage(play, {Color(47,150,255,255),"You're not allowed to spawn this weapon!"})
=======
	hook.Add("PlayerSpawnSWEP", "Mercury:Restrictions", function(play, wepon, tbl)
		local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")
		
		if !Restrictions or !Restrictions.Weaps then return end
		
		if Restrictions.Weaps[class] and !play._ALLOWEAPON then
			Mercury.Util.SendMessage(play, {"Your not allowed to spawn this weapon!"})
>>>>>>> origin/master
			return false
		end
	end )

<<<<<<< HEAD
	hook.Add("PlayerGiveSWEP", "Mercury:Restrictions", function(play, Weapon, tbl)
		local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")
	
		if !Restrictions or !Restrictions.Weaps then return end
	
		if Restrictions.Weaps[Weapon] then
			Mercury.Util.SendMessage(play, {Color(47,150,255,255),"You're not allowed to spawn this weapon!"})
=======
	hook.Add("PlayerGiveSWEP", "Mercury:Restrictions", function(play, wepon, tbl)
		local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")
		
		if !Restrictions or !Restrictions.Weaps then return end
		
		if Restrictions.Weaps[class] then
>>>>>>> origin/master
			return false
		end
	end )

<<<<<<< HEAD
	hook.Add("PlayerCanPickupWeapon", "Mercury:Restrictions", function(play, Weapon)
=======
	hook.Add("PlayerCanPickupWeapon", "Mercury:Restrictions", function(play, wepon)
>>>>>>> origin/master
		local Restrictions = Mercury.Ranks.GetProperty(play:GetRank(), "restrictions")
		
		if !Restrictions or !Restrictions.Weaps then return end
		
<<<<<<< HEAD
		if Restrictions.Weaps[Weapon:GetClass()] then
			return false
		end
	end ) 
end


hook.Add("Initialize", "Mercury:Restrictions",LoadRestrictions)
pcall(LoadRestrictions)
=======
		if Restrictions.Weaps[wepon:GetClass()] then
			return false
		end
	end ) 
end)
>>>>>>> origin/master
