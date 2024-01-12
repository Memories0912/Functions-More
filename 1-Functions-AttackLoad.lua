local Mouse = game.Players.LocalPlayer:GetMouse()
local Toggle = Instance.new("ScreenGui")
local LoadF = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local MainStroke = Instance.new("UIStroke")
local P = game:GetService("Players")
local LP = P.LocalPlayer
local PG = LP.PlayerGui
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes")
local Remote = Remotes:WaitForChild("CommF_")
local RunS = game:GetService("RunService")
local Loop = RunS.RenderStepped
local Data = LP.Data
local WS = game:GetService("Workspace")
local WO = WS["_WorldOrigin"]
local VU = game:GetService("VirtualUser")
local EnemySpawns = WO.EnemySpawns
local Enemies = WS.Enemies
local CameraShaker = require(RS.Util.CameraShaker)
local GuideModule = require(RS.GuideModule)
local Quests = require(RS.Quests)
local VIM = game:service("VirtualInputManager")
function FastAttack()
    repeat wait() until game:IsLoaded()
    repeat task.wait() until game.ReplicatedStorage
    repeat task.wait() until game.Players
    repeat task.wait() until game.Players.LocalPlayer
    repeat task.wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    local CombatFramework = require(LP.PlayerScripts:WaitForChild("CombatFramework"))
    local getValues = getupvalues(CombatFramework)[2]
    local RigController1 = require(LP.PlayerScripts.CombatFramework.RigController)
    local GetValues2 = getupvalues(RigController1)[2]
    local RigLib1 = require(RS.CombatFramework.RigLib)
    local tickOld1 = tick()
    function DisableCameraShaker()
        CameraShakerCombat = require(LP.PlayerScripts.CombatFramework.CameraShaker)
        while wait() do
            CameraShakerCombat.CameraShakeInstance.CameraShakeState.Inactive = 0
        end
    end
    function WeaponCurrentChange()
        local activeControllerl = getValues.activeController
        local BladeActC = activeControllerl.blades[1]
        if not BladeActC then
            return LP.Character:FindFirstChildOfClass("Tool").Name
        end
        pcall(function()
            while BladeActC.Parent ~= LP.Character do
                BladeActC = BladeActC.Parent
            end
        end)
        if not BladeActC then
            return LP.Character:FindFirstChildOfClass("Tool").Name
        end
        return BladeActC
    end
    function getAllBladeHitsPlayers(HitSU)
        Hits = {}
        local LocalPlayerGet1 = LP
        local Characters1 = WS.Characters:GetChildren()
        for r = 1, #Characters1 do
            local v = Characters1[r]
            HumanoidOfClass = v:FindFirstChildOfClass("Humanoid")
            if v.Name ~= LP.Name and HumanoidOfClass and HumanoidOfClass.RootPart and HumanoidOfClass.Health > 0 and LocalPlayerGet1:DistanceFromCharacter(HumanoidOfClass.RootPart.Position) < HitSU + 5 then
                table.insert(Hits, HumanoidOfClass.RootPart)
            end
        end
        return Hits
    end
    function getAllBladeHits(HitSU)
        Hits = {}
        local LocalPlayerGet1 = LP
        local Enemies111 = Enemies:GetChildren()
        for r = 1, #Enemies111 do
            local v = Enemies111[r]
            HumanoidOfClass = v:FindFirstChildOfClass("Humanoid")
            if HumanoidOfClass and HumanoidOfClass.RootPart and HumanoidOfClass.Health > 0 and LocalPlayerGet1:DistanceFromCharacter(HumanoidOfClass.RootPart.Position) < HitSU + 5 then
                table.insert(Hits, HumanoidOfClass.RootPart)
            end
        end
        return Hits
    end
    ReturnFastAttackFunction = {}
    function BladeAllHitsHealh(HitSU)
        Hits = {}
        local LocalPlayerGet1 = LP
        local Enemies111 = Enemies:GetChildren()
        for r = 1, #Enemies111 do
            local v = Enemies111[r]
            HumanoidOfClass = v:FindFirstChildOfClass("Humanoid")
            if HumanoidOfClass and HumanoidOfClass.RootPart and HumanoidOfClass.Health > 0 and HumanoidOfClass.Health ~= HumanoidOfClass.MaxHealth and LocalPlayerGet1:DistanceFromCharacter(HumanoidOfClass.RootPart.Position) < HitSU + 5 then
                table.insert(Hits, Human.RootPart)
            end
        end
        return Hits
    end
    function DelayCountFastAttack()
        pcall(function()
            if LP.Character.Stun.Value ~= 0 then
                return nil
            end
                local activeController22 = getValues.activeController
                activeController22.hitboxMagnitude = 55
                if activeController22 and activeController22.equipped then
                    for b0 = 1, 1 do
                        local HitBladesv = require(RS.CombatFramework.RigLib).getBladeHits(LP.Character, {LP.Character.HumanoidRootPart}, 60)
                        if #HitBladesv > 0 then
                            local valueget1 = debug.getupvalue(activeController22.attack, 5)
                            local valueget2 = debug.getupvalue(activeController22.attack, 6)
                            local valueget3 = debug.getupvalue(activeController22.attack, 4)
                            local valueget4 = debug.getupvalue(activeController22.attack, 7)
                            local miscget1 = (valueget1 * 798405 + valueget3 * 727595) % valueget2
                            local miscget2 = valueget3 * 798405
                            (function()
                                miscget1 = (miscget1 * valueget2 + miscget2) % 1099511627776
                                valueget1 = math.floor(miscget1 / valueget2)
                                valueget3 = miscget1 - valueget1 * valueget2
                            end)()
                            valueget4 = valueget4 + 1
                            debug.setupvalue(activeController22.attack, 5, valueget1)
                            debug.setupvalue(activeController22.attack, 6, valueget2)
                            debug.setupvalue(activeController22.attack, 4, valueget3)
                            debug.setupvalue(activeController22.attack, 7, valueget4)
                            for k,v in pairs(activeController22.animator.anims.basic) do
                                v:Play()
                            end
                            if LP.Character:FindFirstChildOfClass("Tool") and activeController22.blades and activeController22.blades[1] then
                                RS.RigControllerEvent:FireServer("weaponChange", tostring(WeaponCurrentChange()))
                                RS.RigControllerEvent:FireServer("hit", HitBladesv, 2, "")
                            end
                        end
                    end
                end
            end
        )
    end
    CountAttack = 0  
    TickCountAttack = tick()
    spawn(function()
        local MT = getrawmetatable(game)
        local OldNameCall = MT.__namecall
        setreadonly(MT, false)
        MT.__namecall = newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            local Args = {...}
            if Method == 'FireServer' and self.Name == "RigControllerEvent" and  Args[1] == "hit"  then
                CountAttack = CountAttack + 1 
                TickCountAttack = tick()
            end
            return OldNameCall(self, unpack(Args))
        end)
    end)
    function ReturnFastAttackFunction:GetCount()
        return CountAttack
    end
    function ReturnFastAttackFunction:Attack(k)
        EnableFA = k
    end
    spawn(function()
        Cam = require(RS.Util.CameraShaker)
        Cam:Stop()
    end)
    function ReturnFastAttackFunction:InputValue(ba)
        CountDownAttackNext = ba
    end
    wtf = {}
    MiscAddFD = 0
    DelayAttackCurrent = 0.35
    TimeNext = 10
    spawn(function()
        while task.wait() do 
            if EnableFA then 
                pcall(function()
                    if wtf and type(wtf) == "table" then 
                        if wtf and MasteryOption then 
                            MiscAddFD = 2 
                            DelayCountFastAttack()
                            if DelayAttackCurrent and type(DelayAttackCurrent) == "number" and DelayAttackCurrent >= 0.1 then 
                                wait(DelayAttackCurrent)
                            else
                                DelayAttackCurrent = 0.2 
                                wait(DelayAttackCurrent)
                            end
                        elseif CountAttack < CountDownAttackNext then 
                            MiscAddFD = MiscAddFD +1
                            DelayCountFastAttack()
                        elseif CountAttack >= CountDownAttackNext then 
                            MiscAddFD = MiscAddFD +1
                            DelayCountFastAttack()
                            if DelayAttackCurrent and type(DelayAttackCurrent) == "number" and DelayAttackCurrent >= 0.1 then 
                                wait(DelayAttackCurrent*2)
                            else
                                DelayAttackCurrent = 0.2 
                                wait(DelayAttackCurrent*2)
                            end
                        end
                    end
                end)
            end
        end
    end) 
    spawn(function()
        while task.wait() do 
            if EnableFA then 
                pcall(function()
                    local Fastflux = getupvalues(require(LP.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    Fastflux.activeController:attack()
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while task.wait() do 
            if EnableFA then 
                pcall(function()
                    local Fastflux = getupvalues(require(LP.PlayerScripts.CombatFramework))[2]
                    Fastflux.activeController.hitboxMagnitude = 55
                    Fastflux.activeController.timeToNextAttack = 0
                    Fastflux.activeController.attacking = false
                    Fastflux.activeController.increment = 3
                    Fastflux.activeController.blocking = false
                    Fastflux.activeController.timeToNextBlock = 0
                    a = math.random(1,5)
                    if a > 1 then 
                        VU:CaptureController()
                        VU:Button1Down(Vector2.new(50,50))
                    end
                    task.wait(0.2)
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if EnableFA then
                if CountAttack >= CountDownAttackNext then
                    TickOld221 = tick()
                    repeat wait() until tick() - TickOld221 >= TimeNext
                    CountAttack = 0
                end
            end
        end
    end)
    return ReturnFastAttackFunction
end
return FastAttack()
