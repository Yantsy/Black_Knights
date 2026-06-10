-- ref
-- Author: z
-- DateCreated: 6/10/2026 7:03:23 PM
--------------------------------------------------------------
---@meta
---@diagnostic disable: lowercase-global, missing-return, duplicate-doc-field, undefined-doc-name

--------------------------------------------------------------------------------
-- Civilization VI Lua API EmmyLua Definitions
-- Generated from:
-- - Civ6_Lua_API_Complete_Handbook.md
-- - Civ6_Lua_Globals_and_Enums.md
--------------------------------------------------------------------------------

---@alias PlayerID integer
---@alias UnitID integer
---@alias CityID integer
---@alias PlotIndex integer
---@alias Hash integer
---@alias TypeIndex integer
---@alias Civ6Value any

---@class Civ6Point
---@field x integer
---@field y integer

---@class ComponentID
---@field id integer
---@field owner integer
---@field type integer

--------------------------------------------------------------------------------
-- Game
--------------------------------------------------------------------------------

---@class Game
Game = {}

---获取当前回合数
---@return integer
function Game.GetCurrentGameTurn() end

---设置当前回合
---@param turn integer
function Game.SetCurrentGameTurn(turn) end

---获取本地玩家ID
---@return PlayerID
function Game.GetLocalPlayer() end

---获取观察者类型
---@return integer
function Game.GetLocalObserver() end

---获取所有玩家
---@return Player[]
function Game.GetPlayers() end

---@return Eras
function Game.GetEras() end

---@return GreatPeople
function Game.GetGreatPeople() end

---@return TradeManager
function Game.GetTradeManager() end

---@return ReligionManager
function Game.GetReligion() end

---@return FalloutManager
function Game.GetFalloutManager() end

---@return BarbarianManager
function Game.GetBarbarianManager() end

---@return integer
function Game.GetRandomSeed() end

---获取随机数
---@param max integer
---@param desc string
---@return integer
function Game.GetRandNum(max, desc) end

---显示世界浮动文字
---@param type integer
---@param text string
---@param x integer
---@param y integer
function Game.AddWorldViewText(type, text, x, y) end

---@param playerID PlayerID
---@param achievement string
function Game.UnlockAchievement(playerID, achievement) end

---@param key string
---@param value any
function Game.SetProperty(key, value) end

---@param key string
---@return any
function Game.GetProperty(key) end

---@param victoryType integer|string
---@return boolean
function Game.IsVictoryEnabled(victoryType) end

---@param defeatType integer|string
---@return boolean
function Game.IsDefeatEnabled(defeatType) end

---@return string
function Game.GetPhaseName() end

---@return EmergencyManager
function Game.GetEmergencyManager() end

---@return WorldCongress
function Game.GetWorldCongress() end

---@return HeroesManager
function Game.GetHeroesManager() end

--------------------------------------------------------------------------------
-- PlayerManager / Players / Player
--------------------------------------------------------------------------------

---@class PlayerManager
PlayerManager = {}

---@return Player[]
function PlayerManager.GetAlive() end

---@return Player[]
function PlayerManager.GetAliveMajors() end

---@return Player[]
function PlayerManager.GetAliveMinors() end

---@return PlayerID[]
function PlayerManager.GetAliveMajorIDs() end

---@return PlayerID[]
function PlayerManager.GetAliveMinorIDs() end

---@param playerID PlayerID
---@return boolean
function PlayerManager.IsAlive(playerID) end

---@param playerID PlayerID
---@return boolean
function PlayerManager.IsValid(playerID) end

---@param playerID PlayerID
---@return boolean
function PlayerManager.IsBarbarian(playerID) end

---@type table<PlayerID, Player>
Players = {}

---@class Player
local Player = {}

---@return PlayerID
function Player:GetID() end

---@return boolean
function Player:IsAlive() end

---@return boolean
function Player:IsHuman() end

---@return boolean
function Player:IsAI() end

---@return boolean
function Player:IsMajor() end

---@return boolean
function Player:IsBarbarian() end

---@return integer
function Player:GetTeam() end

---@return Plot
function Player:GetStartingPlot() end

---@return integer
function Player:GetEra() end

---@return integer
function Player:GetScore() end

---@param key string
---@return any
function Player:GetProperty(key) end

---@param key string
---@param value any
function Player:SetProperty(key, value) end

---@param modifierID string
function Player:AttachModifierByID(modifierID) end

---@return Treasury
function Player:GetTreasury() end

---@return Culture
function Player:GetCulture() end

---@return Techs
function Player:GetTechs() end

---@return PlayerReligion
function Player:GetReligion() end

---@return Diplomacy
function Player:GetDiplomacy() end

---@return Resources
function Player:GetResources() end

---@return PlayerUnits
function Player:GetUnits() end

---@return PlayerCities
function Player:GetCities() end

---@return PlayerDistricts
function Player:GetDistricts() end

---@return PlayerImprovements
function Player:GetImprovements() end

---@return Governors
function Player:GetGovernors() end

---@return Influence
function Player:GetInfluence() end

---@return Stats
function Player:GetStats() end

---@return PlayerTrade
function Player:GetTrade() end

---@return WMDs
function Player:GetWMDs() end

---@return GreatPeoplePoints
function Player:GetGreatPeoplePoints() end

---@return integer
function Player:GetFavor() end

---@return integer
function Player:GetFavorPerTurn() end

---@return string
function Player:GetFavorPerTurnToolTip() end

--------------------------------------------------------------------------------
-- Unit / UnitManager
--------------------------------------------------------------------------------

---@class UnitManager
UnitManager = {}

---@param playerID PlayerID
---@param unitID UnitID
---@return Unit
function UnitManager.GetUnit(playerID, unitID) end

---@param playerID PlayerID
---@param type TypeIndex
---@param x integer
---@param y integer
---@return Unit
function UnitManager.InitUnit(playerID, type, x, y) end

---@param playerID PlayerID
---@param type TypeIndex
---@param x integer
---@param y integer
---@param num integer
---@return Unit
function UnitManager.InitUnitValidAdjacentHex(playerID, type, x, y, num) end

---@param unit Unit
---@param delayed? boolean
function UnitManager.Kill(unit, delayed) end

---@param unit Unit
---@param x integer
---@param y integer
function UnitManager.MoveUnit(unit, x, y) end

---@param unit Unit
---@param x integer
---@param y integer
function UnitManager.PlaceUnit(unit, x, y) end

---@param unit Unit
function UnitManager.RestoreMovement(unit) end

---@param unit Unit
function UnitManager.RestoreMovementToFormation(unit) end

---@param unit Unit
function UnitManager.RestoreUnitAttacks(unit) end

---@param unit Unit
---@param op integer|string
---@param plot Plot
---@param params table
---@param test? boolean
---@return boolean
function UnitManager.CanStartOperation(unit, op, plot, params, test) end

---@param unit Unit
---@param op integer|string
---@param params table
function UnitManager.RequestOperation(unit, op, params) end

---@param unit Unit
---@param cmd integer|string
---@param params table
---@param test? boolean
---@return boolean
function UnitManager.CanStartCommand(unit, cmd, params, test) end

---@param unit Unit
---@param cmd integer|string
---@param params table
function UnitManager.RequestCommand(unit, cmd, params) end

---@param unit Unit
---@param op integer|string
---@return table
function UnitManager.GetOperationTargets(unit, op) end

---@param unit Unit
---@param cmd integer|string
---@return table
function UnitManager.GetCommandTargets(unit, cmd) end

---@param unit Unit
---@return string
function UnitManager.GetTypeName(unit) end

---@param spy Unit
---@param city City
---@return integer
function UnitManager.GetTravelTime(spy, city) end

---@param spy Unit
---@param city City
---@return integer
function UnitManager.GetEstablishInCityTime(spy, city) end

---@param op integer|string
---@param spy Unit
---@return integer
function UnitManager.GetTimeToComplete(op, spy) end

---@param op integer|string
---@param spy Unit
---@param plot Plot
---@return table
function UnitManager.GetResultProbability(op, spy, plot) end

---@param abilityIndex integer
---@return table
function UnitManager.GetAbilitySummaries(abilityIndex) end

---@class Unit
local Unit = {}

---@return UnitID
function Unit:GetID() end

---@return PlayerID
function Unit:GetOwner() end

---@return TypeIndex
function Unit:GetType() end

---@return integer
function Unit:GetX() end

---@return integer
function Unit:GetY() end

---@return Civ6Point
function Unit:GetLocation() end

---@return integer
function Unit:GetMovesRemaining() end

---@return integer
function Unit:GetAttacksRemaining() end

---@return integer
function Unit:GetDamage() end

---@return integer
function Unit:GetBuildCharges() end

---@return integer
function Unit:GetReligion() end

---@return boolean
function Unit:IsEmbarked() end

---@return boolean
function Unit:IgnoresZOC() end

---@return string
function Unit:GetName() end

---@return boolean
function Unit:IsDelayedDeath() end

---@return ComponentID
function Unit:GetComponentID() end

---@return UnitExperience
function Unit:GetExperience() end

---@return UnitAbility
function Unit:GetAbility() end

---@param delta integer
function Unit:ChangeDamage(delta) end

---@param value integer
function Unit:SetDamage(value) end

---@param delta integer
function Unit:ChangeExtraMoves(delta) end

---@param formation integer|string
function Unit:SetMilitaryFormation(formation) end

---@param key string
---@return any
function Unit:GetProperty(key) end

---@param key string
---@param value any
function Unit:SetProperty(key, value) end

---@return integer
function Unit:GetUpgradeCost() end

---@class UnitExperience
local UnitExperience = {}

---@return integer
function UnitExperience:GetExperiencePoints() end

---@param amount integer
function UnitExperience:ChangeExperience(amount) end

---@return integer
function UnitExperience:GetLevel() end

---@return integer
function UnitExperience:GetMaxLevel() end

---@param promotionType integer|string
function UnitExperience:SetPromotion(promotionType) end

---@param promotionType integer|string
---@return boolean
function UnitExperience:HasPromotion(promotionType) end

---@return integer
function UnitExperience:GetExperienceForNextLevel() end

---@class UnitAbility
local UnitAbility = {}

---@param abilityType integer|string
---@return integer
function UnitAbility:GetAbilityCount(abilityType) end

---@param type integer|string
---@param delta integer
function UnitAbility:ChangeAbilityCount(type, delta) end

---@class PlayerUnits
local PlayerUnits = {}

---@param unitID UnitID
---@return Unit
function PlayerUnits:FindID(unitID) end

--------------------------------------------------------------------------------
-- City / CityManager
--------------------------------------------------------------------------------

---@class CityManager
CityManager = {}

---@param playerID PlayerID
---@param cityID CityID
---@return City
function CityManager.GetCity(playerID, cityID) end

---@param x integer
---@param y integer
---@return City
function CityManager.GetCityAt(x, y) end

---@param plot Plot
---@return District
function CityManager.GetDistrictAt(plot) end

---@param city City
function CityManager.DestroyCity(city) end

---@param district District
function CityManager.DestroyDistrict(district) end

---@param city City
function CityManager.SetAsCapital(city) end

---@param city City
function CityManager.SetAsOriginalCapital(city) end

---@param city City
function CityManager.TransferCityToFreeCities(city) end

---@param city City
---@param cmd integer|string
---@param params table
---@param test? boolean
---@return boolean
function CityManager.CanStartCommand(city, cmd, params, test) end

---@param city City
---@param cmd integer|string
---@param params table
function CityManager.RequestCommand(city, cmd, params) end

---@class City
local City = {}

---@return CityID
function City:GetID() end

---@return PlayerID
function City:GetOwner() end

---@return PlayerID
function City:GetOriginalOwner() end

---@return integer
function City:GetX() end

---@return integer
function City:GetY() end

---@return string
function City:GetName() end

---@param name string
function City:SetName(name) end

---@return integer
function City:GetPopulation() end

---@param delta integer
function City:ChangePopulation(delta) end

---@return BuildQueue
function City:GetBuildQueue() end

---@return CityBuildings
function City:GetBuildings() end

---@return CityDistricts
function City:GetDistricts() end

---@return CityGrowth
function City:GetGrowth() end

---@return CityCulture
function City:GetCulture() end

---@return CityReligion
function City:GetReligion() end

---@param modifierID string
function City:AttachModifierByID(modifierID) end

---@param building integer|string
---@param enabled boolean
function City:SetBuildingFaithPurchaseEnabled(building, enabled) end

---@param unit integer|string
---@param enabled boolean
function City:SetUnitFaithPurchaseEnabled(unit, enabled) end

---@param key string
---@return any
function City:GetProperty(key) end

---@param key string
---@param value any
function City:SetProperty(key, value) end

---@return CulturalIdentity
function City:GetCulturalIdentity() end

---@param delta integer
function City:ChangeLoyalty(delta) end

---@return integer
function City:GetPower() end

---@return integer
function City:GetFreePower() end

---@return integer
function City:GetRequiredPower() end

---@return boolean
function City:IsFullyPowered() end

---@class PlayerCities
local PlayerCities = {}

---@param cityID CityID
---@return City
function PlayerCities:FindID(cityID) end

---@class BuildQueue
local BuildQueue = {}

---@return Hash
function BuildQueue:CurrentlyBuilding() end

---@param amount integer
function BuildQueue:AddProgress(amount) end

function BuildQueue:FinishProgress() end

---@param buildingIndex integer
---@param plot? Plot
function BuildQueue:CreateBuilding(buildingIndex, plot) end

---@param districtIndex integer
---@param plot Plot
function BuildQueue:CreateDistrict(districtIndex, plot) end

---@param districtIndex integer
---@return integer
function BuildQueue:GetDistrictCost(districtIndex) end

---@param buildingIndex integer
---@return integer
function BuildQueue:GetBuildingCost(buildingIndex) end

---@param unitIndex integer
---@return integer
function BuildQueue:GetUnitCost(unitIndex) end

---@class CityBuildings
local CityBuildings = {}

---@param buildingIndex integer
---@return boolean
function CityBuildings:HasBuilding(buildingIndex) end

---@param buildingIndex integer
---@return boolean
function CityBuildings:IsPillaged(buildingIndex) end

---@param index integer
---@param pillaged boolean
function CityBuildings:SetPillaged(index, pillaged) end

---@param buildingIndex integer
---@return PlotIndex
function CityBuildings:GetBuildingLocation(buildingIndex) end

---@param buildingIndex integer
function CityBuildings:RemoveBuilding(buildingIndex) end

---@class CityDistricts
local CityDistricts = {}

---@param districtIndex integer
---@return boolean
function CityDistricts:HasDistrict(districtIndex) end

---@param districtIndex integer
---@return District
function CityDistricts:GetDistrict(districtIndex) end

---@return boolean
function CityDistricts:IsPillaged() end

---@param pillaged boolean
function CityDistricts:SetPillaged(pillaged) end

---@param districtIndex integer
function CityDistricts:RemoveDistrict(districtIndex) end

---@param districtIndex integer
---@return integer x
---@return integer y
function CityDistricts:GetDistrictLocation(districtIndex) end

---@class CityGrowth
local CityGrowth = {}

---@return integer
function CityGrowth:GetHousing() end

---@return integer
function CityGrowth:GetFoodSurplus() end

---@return integer
function CityGrowth:GetTurnsUntilGrowth() end

---@return integer
function CityGrowth:GetAmenities() end

---@return integer
function CityGrowth:GetAmenitiesNeeded() end

---@return integer
function CityGrowth:GetAmenitiesFromLuxuries() end

---@return integer
function CityGrowth:GetHappiness() end

---@class CityReligion
local CityReligion = {}

---@return integer
function CityReligion:GetMajorityReligion() end

---@param religion integer|string
---@return integer
function CityReligion:GetReligiousPressureFromCity(religion) end

---@param religion integer|string
---@return integer
function CityReligion:GetNumFollowers(religion) end

---@return integer
function CityReligion:GetNextReligiousBuilding() end

--------------------------------------------------------------------------------
-- Plot / Map
--------------------------------------------------------------------------------

---@class Map
Map = {}

---@param x integer
---@param y integer
---@return Plot
function Map.GetPlot(x, y) end

---@param index PlotIndex
---@return Plot
function Map.GetPlotByIndex(index) end

---@param x integer
---@param y integer
---@return PlotIndex
function Map.GetPlotIndex(x, y) end

---@param index PlotIndex
---@return integer x
---@return integer y
function Map.GetPlotLocation(index) end

---@param x integer
---@param y integer
---@param direction integer
---@return Plot
function Map.GetAdjacentPlot(x, y, direction) end

---@param x integer
---@param y integer
---@return Plot[]
function Map.GetAdjacentPlots(x, y) end

---@param x integer
---@param y integer
---@param range integer
---@return Plot[]
function Map.GetNeighborPlots(x, y, range) end

---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@return integer
function Map.GetPlotDistance(x1, y1, x2, y2) end

---@return integer w
---@return integer h
function Map.GetGridSize() end

---@return integer
function Map.GetMapSize() end

---@return integer
function Map.GetPlotCount() end

---@return integer
function Map.GetLandPlotCount() end

---@return integer[]
function Map.GetContinentsInUse() end

---@param continentID integer
---@return Plot[]
function Map.GetContinentPlots(continentID) end

---@return CityPlots
function Map.GetCityPlots() end

---@param plot Plot
---@param range integer
---@param fresh boolean
---@return boolean
function Map.FindWater(plot, range, fresh) end

---@param resourceIndex integer
---@return integer
function Map.GetResourceCount(resourceIndex) end

---@class Plot
local Plot = {}

---@return PlotIndex
function Plot:GetIndex() end

---@return integer
function Plot:GetX() end

---@return integer
function Plot:GetY() end

---@return PlayerID
function Plot:GetOwner() end

---@return integer
function Plot:GetTerrainType() end

---@return integer
function Plot:GetFeatureType() end

---@return integer
function Plot:GetResourceType() end

---@return integer
function Plot:GetImprovementType() end

---@return integer
function Plot:GetDistrictType() end

---@return integer
function Plot:GetWonderType() end

---@return integer
function Plot:GetUnitCount() end

---@return integer
function Plot:GetDefenseModifier() end

---@param yieldIndex integer
---@return integer
function Plot:GetYield(yieldIndex) end

---@return integer
function Plot:GetMovementCost() end

---@return integer
function Plot:GetContinentType() end

---@return boolean
function Plot:IsWater() end

---@return boolean
function Plot:IsLake() end

---@return boolean
function Plot:IsRiver() end

---@return boolean
function Plot:IsHills() end

---@return boolean
function Plot:IsMountain() end

---@return boolean
function Plot:IsNaturalWonder() end

---@return boolean
function Plot:IsOwned() end

---@return boolean
function Plot:IsCity() end

---@return boolean
function Plot:IsCoastalLand() end

---@return boolean
function Plot:IsFreshWater() end

---@return boolean
function Plot:IsImpassable() end

---@return boolean
function Plot:IsRoute() end

---@return boolean
function Plot:IsRoutePillaged() end

---@return boolean
function Plot:IsImprovementPillaged() end

---@return boolean
function Plot:IsNationalPark() end

---@return boolean
function Plot:IsAdjacentToLand() end

---@return boolean
function Plot:IsAdjacentOwned() end

---@param playerID PlayerID
---@return boolean
function Plot:IsAdjacentPlayer(playerID) end

---@param district integer|string
---@param player PlayerID|Player
---@param city City
---@return boolean
function Plot:CanHaveDistrict(district, player, city) end

---@param building integer|string
---@param player PlayerID|Player
---@param city City
---@return boolean
function Plot:CanHaveWonder(building, player, city) end

---@return string
function Plot:GetNationalParkName() end

---@return boolean
function Plot:IsNEOfRiver() end

---@return boolean
function Plot:IsWOfRiver() end

---@return boolean
function Plot:IsNWOfRiver() end

---@param key string
---@return any
function Plot:GetProperty(key) end

---@param key string
---@param value any
function Plot:SetProperty(key, value) end

--------------------------------------------------------------------------------
-- Player Subsystems
--------------------------------------------------------------------------------

---@class Treasury
local Treasury = {}

---@return integer
function Treasury:GetGoldBalance() end

---@param amount integer
function Treasury:SetGoldBalance(amount) end

---@param delta integer
function Treasury:ChangeGoldBalance(delta) end

---@return integer
function Treasury:GetGoldYield() end

---@return integer
function Treasury:GetTotalMaintenance() end

---@return integer
function Treasury:GetGoldYieldFromCities() end

---@return integer
function Treasury:GetGoldYieldFromDiplomacy() end

---@class Culture
local Culture = {}

---@return integer
function Culture:GetCultureYield() end

---@return integer
function Culture:GetCultureCurrentTimes100() end

---@param index integer
---@param researched boolean
function Culture:SetCivic(index, researched) end

---@param index integer
---@return boolean
function Culture:IsCivicCompleted(index) end

---@param index integer
---@return integer
function Culture:GetCivicProgress(index) end

---@param index integer
---@param progress integer
function Culture:SetCivicProgress(index, progress) end

---@param index integer
---@return integer
function Culture:GetCivicCost(index) end

---@param index integer
---@param amount integer
function Culture:TriggerBoost(index, amount) end

---@param index integer
---@return boolean
function Culture:IsBoostTriggered(index) end

---@param index integer
---@return boolean
function Culture:IsPolicyActive(index) end

---@param slot integer
---@return integer
function Culture:GetSlotPolicy(slot) end

---@param slot integer
---@param policy integer
function Culture:SetSlotPolicy(slot, policy) end

---@return integer
function Culture:GetPolicyCount() end

---@return integer
function Culture:GetGovernmentType() end

---@param type integer|string
function Culture:SetGovernmentType(type) end

---@return integer
function Culture:GetGovernmentSlotCount() end

---@return table
function Culture:GetGovernorPromotions() end

---@return integer
function Culture:GetWildCardPolicyCount() end

---@class Techs
local Techs = {}

---@return integer
function Techs:GetScienceYield() end

---@param index integer
---@param researched boolean
function Techs:SetTech(index, researched) end

---@param index integer
---@return boolean
function Techs:IsTechCompleted(index) end

---@param index integer
---@return integer
function Techs:GetResearchProgress(index) end

---@param index integer
---@param progress integer
function Techs:SetResearchProgress(index, progress) end

---@param index integer
---@return integer
function Techs:GetResearchCost(index) end

---@return integer
function Techs:GetResearchingTech() end

---@param delta integer
function Techs:ChangeCurrentResearchProgress(delta) end

---@param index integer
---@param amount integer
function Techs:TriggerBoost(index, amount) end

---@param index integer
---@return boolean
function Techs:IsBoostTriggered(index) end

---@class PlayerReligion
local PlayerReligion = {}

---@return integer
function PlayerReligion:GetFaithBalance() end

---@param delta integer
function PlayerReligion:ChangeFaithBalance(delta) end

---@return integer
function PlayerReligion:GetFaithYield() end

---@return integer
function PlayerReligion:GetReligionTypeCreated() end

---@return boolean
function PlayerReligion:HasCreatedPantheon() end

---@return integer
function PlayerReligion:GetPantheon() end

---@param belief integer|string
function PlayerReligion:SetPantheon(belief) end

---@class Diplomacy
local Diplomacy = {}

---@param target PlayerID
---@param warType integer|string
---@param immediate boolean
function Diplomacy:DeclareWarOn(target, warType, immediate) end

---@param target PlayerID
function Diplomacy:MakePeaceWith(target) end

---@param playerID PlayerID
---@return boolean
function Diplomacy:HasMet(playerID) end

---@param playerID PlayerID
---@return boolean
function Diplomacy:IsAtWarWith(playerID) end

---@param target PlayerID
---@return boolean
function Diplomacy:CanDeclareWarOn(target) end

---@param playerID PlayerID
---@return integer
function Diplomacy:GetRelationshipStatus(playerID) end

---@param playerID PlayerID
---@return integer
function Diplomacy:GetAllianceType(playerID) end

---@param playerID PlayerID
---@return integer
function Diplomacy:GetAllianceLevel(playerID) end

---@param playerID PlayerID
---@return integer
function Diplomacy:GetAllianceTurnsUntilExpiration(playerID) end

---@param playerID PlayerID
---@return integer
function Diplomacy:GetAlliancePointsPerTurn(playerID) end

---@return integer
function Diplomacy:GetWarmongerLevel() end

---@class Resources
local Resources = {}

---@param type integer|string
---@return integer
function Resources:GetResourceAmount(type) end

---@param type integer|string
---@param delta integer
function Resources:ChangeResourceAmount(type, delta) end

---@param type integer|string
---@return integer
function Resources:GetResourceStockpileCap(type) end

---@param type integer|string
---@return integer
function Resources:GetResourceExports(type) end

---@param type integer|string
---@return integer
function Resources:GetResourceImports(type) end

---@param type integer|string
---@param cityID CityID
---@return integer
function Resources:GetResourcesFromCity(type, cityID) end

---@param type integer|string
---@return integer
function Resources:GetResourcePerTurn(type) end

---@class Influence
local Influence = {}

---@return integer
function Influence:GetPointsEarned() end

---@return integer
function Influence:GetPointsPerTurn() end

---@return integer
function Influence:GetPointsThreshold() end

---@return integer
function Influence:GetTokensToGive() end

---@param delta integer
function Influence:ChangeTokensToGive(delta) end

---@param playerID PlayerID
function Influence:GiveFreeTokenToPlayer(playerID) end

---@return boolean
function Influence:CanGiveInfluence() end

---@param playerID PlayerID
---@return integer
function Influence:GetLevyMilitaryCost(playerID) end

---@return PlayerID
function Influence:GetSuzerain() end

---@return boolean
function Influence:CanReceiveInfluence() end

---@class Governors
local Governors = {}

---@return integer
function Governors:GetGovernorPoints() end

---@param delta integer
function Governors:ChangeGovernorPoints(delta) end

---@return integer
function Governors:GetGovernorTitles() end

---@return boolean
function Governors:CanAppoint() end

---@param governorType integer|string
---@return boolean
function Governors:HasGovernor(governorType) end

---@param governorType integer|string
---@return integer
function Governors:GetTurnsToEstablish(governorType) end

---@param governorType integer|string
---@return City
function Governors:GetAssignedCity(governorType) end

---@param governorType integer|string
---@return integer
function Governors:GetPromotionType(governorType) end

---@class WMDs
local WMDs = {}

---@param type integer|string
---@return integer
function WMDs:GetWeaponCount(type) end

---@param type integer|string
---@param delta integer
function WMDs:ChangeWeaponCount(type, delta) end

---@class Stats
local Stats = {}

---@return integer
function Stats:GetTourism() end

---@param playerID PlayerID
---@return integer
function Stats:GetTourismAt(playerID) end

---@return integer
function Stats:GetDiplomaticVictoryPoints() end

---@param delta integer
function Stats:ChangeDiplomaticVictoryPoints(delta) end

---@return integer
function Stats:GetMilitaryStrength() end

--------------------------------------------------------------------------------
-- UI System
--------------------------------------------------------------------------------

---@class ContextPtr
ContextPtr = {}

---@param path string
---@return Control
function ContextPtr:LookUpControl(path) end

---@param hidden boolean
function ContextPtr:SetHide(hidden) end

---@return boolean
function ContextPtr:IsHidden() end

---@param handler fun(input: any): boolean|nil
---@param consume? boolean
function ContextPtr:SetInputHandler(handler, consume) end

---@param template string
---@param control Control
---@return table
function ContextPtr:BuildInstanceForControl(template, control) end

function ContextPtr:RequestRefresh() end
function ContextPtr:ClearRefresh() end

---@param width number
function ContextPtr:SetSizeX(width) end

---@param height number
function ContextPtr:SetSizeY(height) end

---@param offset number
function ContextPtr:SetOffsetX(offset) end

---@param offset number
function ContextPtr:SetOffsetY(offset) end

---@param anchor integer|string
function ContextPtr:SetAnchor(anchor) end

function ContextPtr:StopAnimation() end

---@param sound string
function ContextPtr:PlaySound(sound) end

---@class Control
local Control = {}

---@param text string
function Control:SetText(text) end

---@return string
function Control:GetText() end

---@param key string
---@param ... any
function Control:LocalizeAndSetText(key, ...) end

---@param text string
function Control:SetToolTipString(text) end

---@param key string
---@param ... any
function Control:LocalizeAndSetToolTip(key, ...) end

---@param hidden boolean
function Control:SetHide(hidden) end

---@return boolean
function Control:IsHidden() end

---@param disabled boolean
function Control:SetDisabled(disabled) end

---@param alpha number
function Control:SetAlpha(alpha) end

---@param color any
function Control:SetColor(color) end

---@param event integer|string
---@param handler function
function Control:RegisterCallback(event, handler) end

---@param event integer|string
function Control:ClearCallback(event) end

function Control:CalculateSize() end

---@return number
function Control:GetSizeX() end

---@return number
function Control:GetSizeY() end

---@param width number
function Control:SetSizeX(width) end

---@param height number
function Control:SetSizeY(height) end

---@param anchor integer|string
function Control:SetAnchor(anchor) end

---@param offset number
function Control:SetOffsetX(offset) end

---@param offset number
function Control:SetOffsetY(offset) end

---@type table<string, Control>
Controls = {}

---@class UI
UI = {}

---@param message string
function UI.DataError(message) end

---@param sound string
function UI.PlaySound(sound) end

---@param mode integer|string
function UI.SetInterfaceMode(mode) end

---@return integer
function UI.GetInterfaceMode() end

---@return Unit
function UI.GetHeadSelectedUnit() end

---@return City
function UI.GetHeadSelectedCity() end

---@param name string
---@return string
function UI.GetMapPinIcon(name) end

---@param visType integer|string
---@return table
function UI.GetVisualization(visType) end

--------------------------------------------------------------------------------
-- Events / LuaEvents
--------------------------------------------------------------------------------

---@class Civ6Event
local Civ6Event = {}

---@param callback function
function Civ6Event.Add(callback) end

---@param callback function
function Civ6Event.Remove(callback) end

function Civ6Event.Call(...) end

---@class Events
---@field PlayerTurnActivated Civ6Event
---@field PlayerTurnDeactivated Civ6Event
---@field LocalPlayerTurnBegin Civ6Event
---@field LocalPlayerTurnEnd Civ6Event
---@field TurnBegin Civ6Event
---@field TurnEnd Civ6Event
---@field UnitSelectionChanged Civ6Event
---@field UnitMoved Civ6Event
---@field UnitAddedToMap Civ6Event
---@field UnitRemovedFromMap Civ6Event
---@field UnitDamageChanged Civ6Event
---@field UnitExperienceChanged Civ6Event
---@field CitySelectionChanged Civ6Event
---@field CityAddedToMap Civ6Event
---@field CityRemovedFromMap Civ6Event
---@field CityPopulationChanged Civ6Event
---@field CityProductionChanged Civ6Event
---@field CityProductionCompleted Civ6Event
---@field DistrictAddedToMap Civ6Event
---@field BuildingAddedToMap Civ6Event
---@field ResearchCompleted Civ6Event
---@field CivicCompleted Civ6Event
---@field GovernmentChanged Civ6Event
---@field ReligionFounded Civ6Event
---@field BeliefAdded Civ6Event
---@field DiplomacyDeclareWar Civ6Event
---@field DiplomacyMakePeace Civ6Event
---@field DiplomacyMeet Civ6Event
---@field TradeRouteAdded Civ6Event
---@field TradeRouteRemoved Civ6Event
---@field GreatPersonActivated Civ6Event
Events = {}

---@class LuaEvents
---@field TechTree_OpenTechTree Civ6Event|fun(...)
---@field TechTree_CloseTechTree Civ6Event|fun(...)
---@field CivicTree_OpenCivicTree Civ6Event|fun(...)
---@field CivicTree_CloseCivicTree Civ6Event|fun(...)
---@field Government_OpenGovernment Civ6Event|fun(...)
---@field Government_CloseGovernment Civ6Event|fun(...)
---@field Religion_OpenReligion Civ6Event|fun(...)
---@field GreatPeople_OpenGreatPeople Civ6Event|fun(...)
---@field LaunchBar_CloseChoosers Civ6Event|fun(...)
---@field DiploPopup_ShowMakeDeal Civ6Event|fun(...)
LuaEvents = {}

--------------------------------------------------------------------------------
-- GameConfiguration
--------------------------------------------------------------------------------

---@class GameConfiguration
GameConfiguration = {}

---@return boolean
function GameConfiguration.IsAnyMultiplayer() end

---@return boolean
function GameConfiguration.IsHotseat() end

---@return boolean
function GameConfiguration.IsNetworkMultiplayer() end

---@return boolean
function GameConfiguration.IsLANMultiplayer() end

---@return boolean
function GameConfiguration.IsPlayByCloud() end

---@return boolean
function GameConfiguration.IsSavedGame() end

---@return boolean
function GameConfiguration.IsWorldBuilderEditor() end

---@return string
function GameConfiguration.GetRuleSet() end

---@return integer
function GameConfiguration.GetGameSpeedType() end

---@return integer
function GameConfiguration.GetStartEra() end

---@return integer
function GameConfiguration.GetHandicapType() end

---@return integer
function GameConfiguration.GetMapSize() end

---@return integer
function GameConfiguration.GetStartTurn() end

---@return PlayerID[]
function GameConfiguration.GetHumanPlayerIDs() end

---@param key string
---@return any
function GameConfiguration.GetValue(key) end

---@param key string
---@param value any
function GameConfiguration.SetValue(key, value) end

--------------------------------------------------------------------------------
-- Builders / WorldBuilder
--------------------------------------------------------------------------------

---@class TerrainBuilder
TerrainBuilder = {}

---@param plot Plot
---@param type integer|string
function TerrainBuilder.SetTerrainType(plot, type) end

---@param plot Plot
---@param type integer|string
function TerrainBuilder.SetFeatureType(plot, type) end

---@param plot Plot
---@param type integer|string
---@return boolean
function TerrainBuilder.CanHaveFeature(plot, type) end

---@param plot Plot
---@param has boolean
---@param flow integer
function TerrainBuilder.SetWOfRiver(plot, has, flow) end

---@param plot Plot
---@param has boolean
---@param flow integer
function TerrainBuilder.SetNWOfRiver(plot, has, flow) end

---@param plot Plot
---@param has boolean
---@param flow integer
function TerrainBuilder.SetNEOfRiver(plot, has, flow) end

---@class ResourceBuilder
ResourceBuilder = {}

---@param plot Plot
---@param type integer|string
---@param amount integer
function ResourceBuilder.SetResourceType(plot, type, amount) end

---@param plot Plot
---@param type integer|string
---@return boolean
function ResourceBuilder.CanHaveResource(plot, type) end

---@class ImprovementBuilder
ImprovementBuilder = {}

---@param plot Plot
---@param type integer|string
---@param owner PlayerID
function ImprovementBuilder.SetImprovementType(plot, type, owner) end

---@param plot Plot
---@param type integer|string
---@param team integer
---@return boolean
function ImprovementBuilder.CanHaveImprovement(plot, type, team) end

---@class WorldBuilder
WorldBuilder = {}

---@return boolean
function WorldBuilder.IsActive() end

---@return boolean
function WorldBuilder.CanUndo() end

function WorldBuilder.Undo() end

---@return boolean
function WorldBuilder.CanRedo() end

function WorldBuilder.Redo() end

--------------------------------------------------------------------------------
-- DLC / Expansion Systems
--------------------------------------------------------------------------------

---@class CulturalIdentity
local CulturalIdentity = {}

---@return integer
function CulturalIdentity:GetLoyalty() end

---@return integer
function CulturalIdentity:GetLoyaltyPerTurn() end

---@return integer
function CulturalIdentity:GetTurnsToConversion() end

---@return string
function CulturalIdentity:GetConversionOutcome() end

---@class GameClimate
GameClimate = {}

---@return integer
function GameClimate.GetTotalCO2Footprint() end

---@param playerID PlayerID
---@return integer
function GameClimate.GetPlayerCO2Footprint(playerID) end

---@return number
function GameClimate.GetTemperatureChange() end

---@return number
function GameClimate.GetStormPercentChance() end

---@return integer
function GameClimate.GetTilesFlooded() end

---@class WorldCongress
local WorldCongress = {}

---@return table
function WorldCongress:GetResolutions() end

---@param playerID PlayerID
---@return table
function WorldCongress:GetProposals(playerID) end

---@return integer|string
function WorldCongress:GetMeetingStatus() end

---@class HeroesManager
local HeroesManager = {}

---@param hero string
---@return boolean
function HeroesManager:IsHeroDiscovered(hero) end

---@param hero string
---@return PlayerID
function HeroesManager:GetHeroClaimPlayer(hero) end

---@param heroClass string
---@return integer
function HeroesManager:GetHeroClassBaseCharges(heroClass) end

--------------------------------------------------------------------------------
-- Utility
--------------------------------------------------------------------------------

---@class Locale
Locale = {}

---@param key string
---@param ... any
---@return string
function Locale.Lookup(key, ...) end

---@param key string
---@return boolean
function Locale.HasTextKey(key) end

---@class Colors
Colors = {}

---@param name string
---@return any
function Colors.GetColor(name) end

---@param name string
---@return integer
function Colors.GetColorValue(name) end

---@class InstanceManager
InstanceManager = {}

---@param instanceName string
---@param rootControl string
---@param parentStack Control
---@return InstanceManager
function InstanceManager:new(instanceName, rootControl, parentStack) end

---@return table
function InstanceManager:GetInstance() end

---@param instance table
function InstanceManager:ReleaseInstance(instance) end

function InstanceManager:ResetInstances() end

---@class Input
Input = {}

---@param actionName string
---@return integer
function Input.GetActionId(actionName) end

---@param context string
function Input.PushActiveContext(context) end

---@param context string
function Input.PopActiveContext(context) end

---@param context string
function Input.SetActiveContext(context) end

---@return number
function Input.GetGesturePan() end

---@return number
function Input.GetGestureZoom() end

---@return number
function Input.GetGestureRotate() end

--------------------------------------------------------------------------------
-- GameInfo
--------------------------------------------------------------------------------

---@class GameInfoRow
---@field Index integer
---@field Hash Hash
---@field Type string
---@field Name string
---@field UnitType string
---@field BuildingType string
---@field DistrictType string
---@field TechnologyType string
---@field CivicType string
---@field ResourceType string
---@field TerrainType string
---@field FeatureType string
---@field ImprovementType string
---@field CivilizationType string
---@field LeaderType string
---@field GovernmentType string
---@field PolicyType string
---@field ReligionType string
---@field BeliefType string
---@field YieldType string
---@field Description string

---@class GameInfoTable
---@field [string] GameInfoRow
---@field [integer] GameInfoRow
local GameInfoTable = {}

---@return fun(): GameInfoRow
function GameInfoTable:__call() end

---@class GameInfo
---@field Units GameInfoTable
---@field Buildings GameInfoTable
---@field Districts GameInfoTable
---@field Improvements GameInfoTable
---@field Technologies GameInfoTable
---@field Civics GameInfoTable
---@field Eras GameInfoTable
---@field Yields GameInfoTable
---@field Resources GameInfoTable
---@field Features GameInfoTable
---@field Terrains GameInfoTable
---@field Civilizations GameInfoTable
---@field Leaders GameInfoTable
---@field Agendas GameInfoTable
---@field Traits GameInfoTable
---@field Governments GameInfoTable
---@field Policies GameInfoTable
---@field Beliefs GameInfoTable
---@field Religions GameInfoTable
---@field GreatPersonClasses GameInfoTable
---@field GreatPersonIndividuals GameInfoTable
---@field Projects GameInfoTable
---@field Victories GameInfoTable
---@field Wars GameInfoTable
---@field Alliances GameInfoTable
---@field DiplomaticStates GameInfoTable
---@field DiplomaticActions GameInfoTable
---@field Visibilities GameInfoTable
---@field Gossips GameInfoTable
---@field Maps GameInfoTable
---@field ScoringCategories GameInfoTable
---@field Types GameInfoTable
---@field UnitOperations GameInfoTable
---@field UnitCommands GameInfoTable
---@field Quests GameInfoTable
---@field Wonders GameInfoTable
---@field BarbarianTribes GameInfoTable
GameInfo = {}

--------------------------------------------------------------------------------
-- Enums / Global Tables
--------------------------------------------------------------------------------

---@class DirectionTypes
---@field DIRECTION_NORTHEAST integer
---@field DIRECTION_EAST integer
---@field DIRECTION_SOUTHEAST integer
---@field DIRECTION_SOUTHWEST integer
---@field DIRECTION_WEST integer
---@field DIRECTION_NORTHWEST integer
---@field NUM_DIRECTION_TYPES integer
---@field NO_DIRECTION integer
DirectionTypes = {}

---@class YieldTypes
---@field FOOD string
---@field PRODUCTION string
---@field GOLD string
---@field SCIENCE string
---@field CULTURE string
---@field FAITH string
---@field YIELD_FOOD any
---@field YIELD_PRODUCTION any
---@field YIELD_GOLD any
---@field YIELD_SCIENCE any
---@field YIELD_CULTURE any
---@field YIELD_FAITH any
YieldTypes = {}

---@class UnitOperationTypes
---@field MOVE_TO any
---@field SWAP_UNITS any
---@field ATTACK any
---@field RANGE_ATTACK any
---@field AIR_ATTACK any
---@field COASTAL_RAID any
---@field BOMBARD any
---@field FOUND_CITY any
---@field BUILD_IMPROVEMENT any
---@field BUILD_ROUTE any
---@field CREATE_OUTPOST any
---@field SCRUB_FALLOUT any
---@field HARVEST_RESOURCE any
---@field REMOVE_FEATURE any
---@field DEPLOY any
---@field REBASE any
---@field WMD_STRIKE any
---@field MAKE_TRADE_ROUTE any
---@field SPY_TRAVEL_NEW_CITY any
---@field SPY_COUNTERSPY any
---@field SPY_STEAL_TECH_BOOST any
---@field SPY_GREAT_WORK_HEIST any
---@field SPY_SIPHON_FUNDS any
---@field SPY_GAIN_SOURCES any
---@field SPY_LISTENING_POST any
---@field PARAM_X any
---@field PARAM_Y any
---@field PARAM_X0 any
---@field PARAM_Y0 any
---@field PARAM_X1 any
---@field PARAM_Y1 any
---@field PARAM_MODIFIERS any
---@field PARAM_OPERATION_TYPE any
---@field PARAM_IMPROVEMENT_TYPE any
---@field PARAM_WMD_TYPE any
UnitOperationTypes = {}

---@class UnitCommandTypes
---@field UPGRADE any
---@field PROMOTE any
---@field PROMOTE_CLASS any
---@field FORM_CORPS any
---@field FORM_ARMY any
---@field DELETE any
---@field NAME_UNIT any
---@field ENTER_FORMATION any
---@field CANCEL any
---@field MOVE_JUMP any
---@field CONDEMN_HERETIC any
---@field AIRLIFT any
---@field PARADROP any
---@field TYPE any
---@field PARAM_UNIT_PLAYER any
---@field PARAM_UNIT_ID any
---@field PARAM_PROMOTION_TYPE any
---@field PARAM_MILITARY_FORMATION_TYPE any
UnitCommandTypes = {}

---@class DiplomaticStates
---@field ALLIED integer
---@field DECLARED_FRIEND integer
---@field FRIENDLY integer
---@field NEUTRAL integer
---@field UNFRIENDLY integer
---@field DENOUNCED integer
---@field WAR integer
DiplomaticStates = {}

---@class WarTypes
---@field SURPRISE_WAR any
---@field FORMAL_WAR any
---@field HOLY_WAR any
---@field LIBERATION_WAR any
---@field RECONQUEST_WAR any
---@field PROTECTORATE_WAR any
---@field PROTECTIVE_WAR any
---@field COLONIAL_WAR any
---@field TERRITORIAL_WAR any
WarTypes = {}

---@class MilitaryFormationTypes
---@field STANDARD_FORMATION any
---@field STANDARD_MILITARY_FORMATION any
---@field CORPS_FORMATION any
---@field CORPS_MILITARY_FORMATION any
---@field ARMY_FORMATION any
---@field ARMY_MILITARY_FORMATION any
MilitaryFormationTypes = {}

---@class PlayerTypes
---@field NONE integer
---@field OBSERVER integer
---@field NO_PLAYER integer
PlayerTypes = {}

---@class InterfaceModeTypes
---@field SELECTION any
---@field MOVE_TO any
---@field ATTACK any
---@field RANGE_ATTACK any
---@field DISTRICT_PLACEMENT any
---@field BUILDING_PLACEMENT any
---@field CITY_MANAGEMENT any
---@field CITY_RANGE_ATTACK any
---@field VIEW_MODAL_LENS any
---@field MAKE_TRADE_ROUTE any
---@field TELEPORT_TO_CITY any
---@field SPY_TRAVEL_TO_CITY any
---@field SPY_CHOOSE_MISSION any
---@field FULLSCREEN_MAP any
---@field COASTAL_RAID any
---@field AIR_ATTACK any
---@field WMD_STRIKE any
---@field NATURAL_WONDER any
---@field NONE any
InterfaceModeTypes = {}

---@class CityOperationTypes
---@field BUILD any
---@field PARAM_BUILDING_TYPE any
---@field PARAM_DISTRICT_TYPE any
---@field PARAM_UNIT_TYPE any
---@field PARAM_X any
---@field PARAM_Y any
---@field PARAM_INSERT_MODE any
---@field PARAM_QUEUE_LOCATION any
---@field PARAM_MILITARY_FORMATION_TYPE any
CityOperationTypes = {}

---@class CityCommandTypes
---@field PURCHASE any
---@field PARAM_PLOT_PURCHASE any
---@field PARAM_MILITARY_FORMATION_TYPE any
CityCommandTypes = {}

---@class EndTurnBlockingTypes
---@field NO_ENDTURN_BLOCKING any
---@field ENDTURN_BLOCKING_UNITS any
---@field ENDTURN_BLOCKING_STACKED_UNITS any
---@field ENDTURN_BLOCKING_UNIT_NEEDS_ORDERS any
---@field ENDTURN_BLOCKING_RESEARCH any
---@field ENDTURN_BLOCKING_CIVIC any
---@field ENDTURN_BLOCKING_FILL_CIVIC_SLOT any
---@field ENDTURN_BLOCKING_CONSIDER_GOVERNMENT_CHANGE any
---@field ENDTURN_BLOCKING_CONSIDER_RAZE_CITY any
---@field ENDTURN_BLOCKING_PRODUCTION any
---@field ENDTURN_BLOCKING_PANTHEON any
---@field ENDTURN_BLOCKING_RELIGION any
---@field ENDTURN_BLOCKING_BELIEF any
---@field ENDTURN_BLOCKING_GIVE_INFLUENCE_TOKEN any
---@field ENDTURN_BLOCKING_CLAIM_GREAT_PERSON any
---@field ENDTURN_BLOCKING_SPY_CHOOSE_ESCAPE_ROUTE any
---@field ENDTURN_BLOCKING_SPY_CHOOSE_DRAGNET_PRIORITY any
---@field ENDTURN_BLOCKING_ARTIFACT any
---@field NOTHING any
---@field UNITS any
---@field RESEARCH any
---@field CIVIC any
---@field PRODUCTION any
---@field DIPLOMATIC_DELEGATION any
---@field FOUND_RELIGION any
---@field SELECT_PANTHEON any
---@field FOUND_PANTHEON any
---@field REPLACE_PANTHEON any
---@field SELECT_VICTORY any
---@field NEED_CITY_PRODUCTION any
---@field NEED_CIVIC_CHOICE any
---@field NEED_RESEARCH_CHOICE any
---@field FILL_CIVIC_SLOT any
---@field FILL_GOVERNMENT_SLOT any
EndTurnBlockingTypes = {}

---@class DealItemTypes
---@field GOLD any
---@field RESOURCES any
---@field AGREEMENTS any
---@field CITIES any
---@field GREATWORK any
---@field CAPTIVE any
DealItemTypes = {}

---@class DealItemSubTypes
---@field NONE any
DealItemSubTypes = {}

---@class DealAgreementTypes
---@field JOINT_WAR any
---@field THIRD_PARTY_WAR any
---@field RESEARCH_AGREEMENT any
---@field ALLIANCE any
---@field MAKE_PEACE any
DealAgreementTypes = {}

---@class AdjacencyBonusTypes
---@field NO_ADJACENCY any
---@field ADJACENCY_DISTRICT any
---@field ADJACENCY_FEATURE any
---@field ADJACENCY_IMPROVEMENT any
---@field ADJACENCY_NATURAL_WONDER any
---@field ADJACENCY_RESOURCE any
---@field ADJACENCY_RESOURCE_CLASS any
---@field ADJACENCY_RIVER any
---@field ADJACENCY_SEA_RESOURCE any
---@field ADJACENCY_TERRAIN any
---@field ADJACENCY_WONDER any
AdjacencyBonusTypes = {}

---@class DefenseTypes
---@field DISTRICT_GARRISON any
---@field DISTRICT_OUTER any
DefenseTypes = {}

---@class NotificationTypes
---@field CITY_RANGE_ATTACK any
---@field UNIT_PROMOTION_AVAILABLE any
NotificationTypes = {}

---@class NotificationGroups
---@field NONE any
NotificationGroups = {}

---@class ActionTypes
---@field ACTION_ENDTURN any
---@field ACTION_UNREADYTURN any
ActionTypes = {}

---@class SaveTypes
---@field SINGLE_PLAYER any
---@field NETWORK_MULTIPLAYER any
SaveTypes = {}

---@class SaveFileTypes
---@field GAME_CONFIGURATION any
SaveFileTypes = {}

---@class LobbyTypes
---@field LOBBY_LAN any
---@field LOBBY_NONE any
LobbyTypes = {}

---@class TurnLimitTypes
---@field CUSTOM any
TurnLimitTypes = {}

---@class CivilizationLevelTypes
---@field CIVILIZATION_LEVEL_FULL_CIV any
CivilizationLevelTypes = {}

---@class RouteTypes
---@field NONE any
RouteTypes = {}

---@class OperationResultsTypes
---@field ALL any
OperationResultsTypes = {}

---@class CityOperationResults
---@field SUCCESS_CONDITIONS any
CityOperationResults = {}

---@class DiplomacyInitiatorTypes
---@field HUMAN any
DiplomacyInitiatorTypes = {}

---@class DiplomacyMoodTypes
---@field ANY any
DiplomacyMoodTypes = {}

---@class DiplomacyResponseTypes
---@field INITIAL any
---@field ACKNOWLEDGE any
DiplomacyResponseTypes = {}

---@class DealProposalAction
---@field ADJUSTED any
DealProposalAction = {}

---@class EventSubTypes
---@field FOUND_CITY any
EventSubTypes = {}

---@class EspionageResultTypes
---@field KILLED any
---@field CAPTURED any
---@field FAIL_MUST_ESCAPE any
---@field FAIL_UNDETECTED any
---@field SUCCESS_MUST_ESCAPE any
---@field SUCCESS_UNDETECTED any
EspionageResultTypes = {}

---@class CityDestroyDirectives
---@field LIBERATE_FOUNDER any
---@field LIBERATE_PREVIOUS_OWNER any
---@field KEEP any
---@field RAZE any
---@field REJECT any
CityDestroyDirectives = {}

---@class YIELD_STATE
---@field NORMAL integer
---@field FAVORED integer
---@field IGNORED integer
YIELD_STATE = {}

---@class GlobalParameters
---@field COMBAT_CORPS_STRENGTH_MODIFIER any
---@field COMBAT_ARMY_STRENGTH_MODIFIER any
---@field GOLD_PURCHASE_MULTIPLIER any
---@field GOLD_EQUIVALENT_OTHER_YIELDS any
---@field GOVERNMENT_UNLOCK_WITH_FAITH any
---@field CITY_POPULATION_RIVER_LAKE any
---@field CITY_POPULATION_COAST any
---@field CITY_POPULATION_NO_WATER any
---@field GREATWORK_ART_LOCK_TIME any
---@field DIPLOMACY_WAR_LAST_FOREVER any
---@field TOURISM_TRADE_ROUTE_BONUS any
---@field DISABLE_TUTORIAL any
GlobalParameters = {}

--------------------------------------------------------------------------------
-- Mouse / Keyboard Constants
--------------------------------------------------------------------------------

---@class Mouse
---@field eLClick any
---@field eRClick any
---@field eMouseEnter any
Mouse = {}

---@class KeyEvents
---@field KeyUp any
---@field KeyDown any
KeyEvents = {}

---@class Keys
---@field VK_ESCAPE any
Keys = {}

--------------------------------------------------------------------------------
-- MapEnums.lua Global Variables
--------------------------------------------------------------------------------

---@type integer
g_PLOT_TYPE_NONE = nil
---@type integer
g_PLOT_TYPE_MOUNTAIN = nil
---@type integer
g_PLOT_TYPE_HILLS = nil
---@type integer
g_PLOT_TYPE_LAND = nil
---@type integer
g_PLOT_TYPE_OCEAN = nil

---@type integer
g_TERRAIN_TYPE_NONE = nil
---@type integer
g_TERRAIN_TYPE_GRASS = nil
---@type integer
g_TERRAIN_TYPE_GRASS_HILLS = nil
---@type integer
g_TERRAIN_TYPE_GRASS_MOUNTAIN = nil
---@type integer
g_TERRAIN_TYPE_PLAINS = nil
---@type integer
g_TERRAIN_TYPE_PLAINS_HILLS = nil
---@type integer
g_TERRAIN_TYPE_PLAINS_MOUNTAIN = nil
---@type integer
g_TERRAIN_TYPE_DESERT = nil
---@type integer
g_TERRAIN_TYPE_DESERT_HILLS = nil
---@type integer
g_TERRAIN_TYPE_DESERT_MOUNTAIN = nil
---@type integer
g_TERRAIN_TYPE_TUNDRA = nil
---@type integer
g_TERRAIN_TYPE_TUNDRA_HILLS = nil
---@type integer
g_TERRAIN_TYPE_TUNDRA_MOUNTAIN = nil
---@type integer
g_TERRAIN_TYPE_SNOW = nil
---@type integer
g_TERRAIN_TYPE_SNOW_HILLS = nil
---@type integer
g_TERRAIN_TYPE_SNOW_MOUNTAIN = nil
---@type integer
g_TERRAIN_TYPE_COAST = nil
---@type integer
g_TERRAIN_TYPE_OCEAN = nil
---@type integer
g_TERRAIN_BASE_TO_HILLS_DELTA = nil
---@type integer
g_TERRAIN_BASE_TO_MOUNTAIN_DELTA = nil

---@type integer
g_FEATURE_NONE = nil
---@type integer
g_FEATURE_FLOODPLAINS = nil
---@type integer
g_FEATURE_ICE = nil
---@type integer
g_FEATURE_JUNGLE = nil
---@type integer
g_FEATURE_FOREST = nil
---@type integer
g_FEATURE_OASIS = nil
---@type integer
g_FEATURE_MARSH = nil
---@type integer
g_FEATURE_BARRIER_REEF = nil
---@type integer
g_FEATURE_CLIFFS_DOVER = nil
---@type integer
g_FEATURE_CRATER_LAKE = nil
---@type integer
g_FEATURE_DEAD_SEA = nil
---@type integer
g_FEATURE_EVEREST = nil
---@type integer
g_FEATURE_GALAPAGOS = nil
---@type integer
g_FEATURE_KILIMANJARO = nil
---@type integer
g_FEATURE_PANTANAL = nil
---@type integer
g_FEATURE_PIOPIOTAHI = nil
---@type integer
g_FEATURE_TORRES_DEL_PAINE = nil
---@type integer
g_FEATURE_TSINGY = nil
---@type integer
g_FEATURE_YOSEMITE = nil

---@type integer
g_YIELD_FOOD = nil
---@type integer
g_YIELD_PRODUCTION = nil
---@type integer
g_YIELD_GOLD = nil
---@type integer
g_YIELD_SCIENCE = nil
---@type integer
g_YIELD_CULTURE = nil
---@type integer
g_YIELD_FAITH = nil

--------------------------------------------------------------------------------
-- Placeholder Classes
--------------------------------------------------------------------------------

---@class Eras
local Eras = {}

---@class GreatPeople
local GreatPeople = {}

---@class TradeManager
local TradeManager = {}

---@class ReligionManager
local ReligionManager = {}

---@class FalloutManager
local FalloutManager = {}

---@class BarbarianManager
local BarbarianManager = {}

---@class EmergencyManager
local EmergencyManager = {}

---@class District
local District = {}

---@class PlayerDistricts
local PlayerDistricts = {}

---@class PlayerImprovements
local PlayerImprovements = {}

---@class PlayerTrade
local PlayerTrade = {}

---@class GreatPeoplePoints
local GreatPeoplePoints = {}

---@class CityCulture
local CityCulture = {}

---@class CityPlots
local CityPlots = {}