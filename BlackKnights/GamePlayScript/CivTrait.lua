-- LuaScript1
-- Author: z
-- DateCreated: 6/10/2026 6:15:15 PM
--------------------------------------------------------------
--参考和而不同
local function LeaderHasTrait(playerId, sTrait)
if playerId == nil then
		print("ERROR playerId为nil")
		return false;
	end
	-- 根据 property 判断
	local player = Players[playerId];
	if not player then
		print("ERROR 该文明不存在")
		return false;
	end
	if player:GetProperty(sTrait) == true then
		return true;
	end

	-- 查表判断
	local playerConfig = PlayerConfigurations[playerId]
	local sLeader = playerConfig:GetLeaderTypeName()
	for tRow in GameInfo.LeaderTraits() do
		if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return
			true;
		end
	end

	return false;
end
local function CivTraitOfBlackKnights(playerID, isFirstTurn) 
	if (LeaderHasTrait(playerID,"TRAIT_CIVILIZATION_ZERO_REQUIEM") == true )then
		local playerIDs=PlayerManager.GetAliveMajorIDs()
		local zero={}
		zero.enemies_count=0
		zero.elapse=0.0
		zero.scie_elapse=0.0
		zero.cult_elapse=0.0
		zero.id=playerID
		zero.self=Players[playerID]
		zero.scie_yeild=zero.self:GetTechs():GetScienceYield()
		zero.cult_yeild=zero.self:GetCulture():GetCultureYield()
		local new_value=0
	--获取科文差距
		for _, playerID in ipairs(playerIDs) do
			if(zero.id ~= playerID and zero.self:GetDiplomacy():IsAtWarWith(playerID)) then
				local player=Players[playerID]
				local player_scie_yeild=player:GetTechs():GetScienceYield()
				local player_cult_yeild=player:GetCulture():GetCultureYield()
				local tech_elapse=(player_scie_yeild-zero.scie_yeild)/player_scie_yeild
				local cult_elapse=(player_cult_yeild-zero.cult_yeild)/player_cult_yeild
				zero.enemies_count=zero.enemies_count+1
				zero.scie_elapse=zero.scie_elapse+tech_elapse
				zero.cult_elapse=zero.cult_elapse+cult_elapse
			end
		end

		if(zero.elapse>=0 and zero.enemies_count >0) then 
			zero.elapse=(zero.scie_elapse*0.5+zero.cult_elapse*0.5)*100/zero.enemies_count
		end

		for _, unit in zero.self:GetUnits():Members() do
			if(unit~=nil) then
				unit:SetProperty("COMBAT_STRENGTH_FOR_BLACK_KNIGHTS_UNITS",zero.elapse)
				new_value=unit:GetProperty("COMBAT_STRENGTH_FOR_BLACK_KNIGHTS_UNITS")
				if (new_value ~=nil) then
				print(new_value)
				else print("no_value")
				end
			end
		end
		print(zero.elapse)
		print("bingo")
	end
end

local function initialize()
	Events.PlayerTurnActivated.Add(CivTraitOfBlackKnights)
end

Events.LoadGameViewStateDone.Add(initialize)