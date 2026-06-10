-- LuaScript1
-- Author: z
-- DateCreated: 6/10/2026 6:15:15 PM
--------------------------------------------------------------
function CombatBuffSelect(tech_cult_elapse)

end

function WallBuffSelect(num_of_allies)

end
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
function CivTraitOfBlackKnights() 

local playerIDs=PlayerManager.GetAliveMajorIDs()

local zero={}
zero.id=0
zero.scie_yeild=0
zero.cult_yeild=0
zero.elapse =0
zero.buff0_level=nil
zero.buff1_level=nil

for _, playerID in ipairs(playerIDs) do
    if LeaderHasTrait(playerID,"TRAIT_CIVILIZATION_ZERO_REQUIEM") == true then
        zero.id=playerID
        local izero=Players[playerID]
        zero.scie_yeild=izero:GetTechs():GetScienceYield()
        zero.cult_yeild=izero:GetCulture():GetCultureYield()
        end
end

for _, playerID in ipairs(playerIDs) do
    local player=Players[playerID]
    local tech_elapse=zero.scie_yeild-player:GetTechs():GetScienceYield()
    if tech_elapse > zero.elapse then zero.elapse=tech_elapse end
    local cult_elapse=zero.cult_yeild-player:GetCulture():GetCultureYield()
    if cult_elapse>zero.elapse then zero.elapse=cult_elapse end
end

print(zero.elapse)

end