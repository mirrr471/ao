local endgg == true
if (end == true) then
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- LapseBlueMax 파트 생성
local lapseBlueMax = Instance.new("Part")
lapseBlueMax.Name = "LapseBlueMax"
lapseBlueMax.Size = Vector3.new(23.5, 23.5, 23.5)
lapseBlueMax.Transparency = 1
lapseBlueMax.Anchored = true -- 중력 영향을 완전히 제거하기 위해 Anchored 설정
lapseBlueMax.CanCollide = false
lapseBlueMax.Massless = true -- 물리적 영향을 제거 (보완 설정)
lapseBlueMax.Parent = game.Workspace


-- 위치 설정 및 플레이어 따라가기
lapseBlueMax.CFrame = rootPart.CFrame * CFrame.new(0, 0, 0) -- 초기 위치 설정
local stillAlive = true -- 루프 제어 변수
local duration = 0.5 -- 타겟 위치까지 도달하는 시간
local elapsed = 0

task.spawn(function()
    while stillAlive do
        task.wait(0.01)
        elapsed = elapsed + 0.01
        local alpha = math.min(elapsed / duration, 1)
        lapseBlueMax.CFrame = rootPart.CFrame * CFrame.new(0, 7, -15.5) -- Position 대신 CFrame만 사용
    end
end)

-- 캐릭터가 죽거나 리스폰될 때 파트 제거
character.Humanoid.Died:Connect(function()
    stillAlive = false
    lapseBlueMax:Destroy()
end)

player.CharacterAdded:Connect(function(newCharacter)
    stillAlive = false
    lapseBlueMax:Destroy()
end)

-- Center Attachment
local center = Instance.new("Attachment")
center.Name = "Center"
center.Position = Vector3.new(0, 0, 0)
center.Parent = lapseBlueMax

-- Startup Attachment
local startup = Instance.new("Attachment")
startup.Name = "Startup"
startup.Position = Vector3.new(0, 0, 0)
startup.Parent = lapseBlueMax

-- ParticleEmitter: Trail (Center)
local trailEmitter = Instance.new("ParticleEmitter")
trailEmitter.Name = "Trail"
trailEmitter.Texture = "rbxassetid://15269497616"
trailEmitter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.102784, 4.21397, 2.96397),
    NumberSequenceKeypoint.new(0.250784, 6.82151, 2.09894),
    NumberSequenceKeypoint.new(0.506784, 8.14938, 1.42448),
    NumberSequenceKeypoint.new(1, 8.97727, 1.00111)
})
trailEmitter.Lifetime = NumberRange.new(0.3, 0.6)
trailEmitter.Rate = 5
trailEmitter.Acceleration = Vector3.new(0, 0, 0)
trailEmitter.Size = NumberSequence.new(12)
trailEmitter.Speed = NumberRange.new(0.01, 40)
trailEmitter.RotSpeed = NumberRange.new(-400, 400)
trailEmitter.Transparency = NumberSequence.new(0, 0, 1, 0)
trailEmitter.Color = ColorSequence.new(Color3.new(0, 0, 1))
trailEmitter.VelocityInheritance = 0
trailEmitter.Parent = center

-- ParticleEmitter: Wind1 (Center)
local wind1EmitterCenter = Instance.new("ParticleEmitter")
wind1EmitterCenter.Name = "Wind1"
wind1EmitterCenter.Texture = "rbxassetid://6700006778"
wind1EmitterCenter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 19.5672, 4),
    NumberSequenceKeypoint.new(0.362836, 18.9354, 3.41718),
    NumberSequenceKeypoint.new(0.690056, 15.2264, 4.16966),
    NumberSequenceKeypoint.new(0.912056, 8.90007, 2.47374),
    NumberSequenceKeypoint.new(1, 0, 0)
})
wind1EmitterCenter.Lifetime = NumberRange.new(0.2, 0.3)
wind1EmitterCenter.Rate = 40
wind1EmitterCenter.Acceleration = Vector3.new(0, 0, 0)
wind1EmitterCenter.Size = NumberSequence.new(8)
wind1EmitterCenter.Speed = NumberRange.new(0.1, 0.1)
wind1EmitterCenter.RotSpeed = NumberRange.new(-1500, -500)
wind1EmitterCenter.Transparency = NumberSequence.new(1, 0.6, 1)
wind1EmitterCenter.Color = ColorSequence.new(Color3.new(1, 1, 1))
wind1EmitterCenter.ZOffset = -5
wind1EmitterCenter.VelocityInheritance = 0
wind1EmitterCenter.Parent = center

-- ParticleEmitter: Center (Center)
local centerEmitter = Instance.new("ParticleEmitter")
centerEmitter.Name = "Center"
centerEmitter.Texture = "rbxassetid://2122546039"
centerEmitter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 2.75),
    NumberSequenceKeypoint.new(1, 3)
})
centerEmitter.Lifetime = NumberRange.new(0.2, 0.2)
centerEmitter.Rate = 500
centerEmitter.Acceleration = Vector3.new(0, 0, 0)
centerEmitter.Size = NumberSequence.new(5)
centerEmitter.Speed = NumberRange.new(0, 0)
centerEmitter.RotSpeed = NumberRange.new(500, 500)
centerEmitter.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.5),
    NumberSequenceKeypoint.new(0.5, 0.3),
    NumberSequenceKeypoint.new(0.85, 0.6),
    NumberSequenceKeypoint.new(1, 1)
})
centerEmitter.Color = ColorSequence.new(Color3.new(1, 1, 130))
centerEmitter.ZOffset = 0
centerEmitter.VelocityInheritance = 0
centerEmitter.Parent = center

-- ParticleEmitter: Center (Center1)
local centerEmitter1 = Instance.new("ParticleEmitter")
centerEmitter1.Name = "Center1"
centerEmitter1.Texture = "rbxassetid://2122546039"
centerEmitter1.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 1),
    NumberSequenceKeypoint.new(0.5, 2.75),
    NumberSequenceKeypoint.new(1, 3)
})
centerEmitter1.Lifetime = NumberRange.new(0.2, 0.2)
centerEmitter1.Rate = 100
centerEmitter1.Acceleration = Vector3.new(0, 0, 0)
centerEmitter1.Size = NumberSequence.new(10)
centerEmitter1.Speed = NumberRange.new(0, 0)
centerEmitter1.RotSpeed = NumberRange.new(500, 500)
centerEmitter1.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.5),
    NumberSequenceKeypoint.new(0.5, 0.3),
    NumberSequenceKeypoint.new(0.85, 0.6),
    NumberSequenceKeypoint.new(1, 1)
})
centerEmitter1.Color = ColorSequence.new(Color3.new(0, 0, 255))
centerEmitter1.ZOffset = 0
centerEmitter1.VelocityInheritance = 0
centerEmitter1.Parent = center

-- ParticleEmitter: Aura (Center)
local auraEmitter = Instance.new("ParticleEmitter")
auraEmitter.Name = "Aura"
auraEmitter.Texture = "rbxassetid://15269497616"
auraEmitter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.102784, 4.21397, 7.00885),
    NumberSequenceKeypoint.new(0.250784, 6.82151, 6.83816),
    NumberSequenceKeypoint.new(0.506784, 8.14938, 6.80294),
    NumberSequenceKeypoint.new(0.778784, 6.60324, 6.23947),
    NumberSequenceKeypoint.new(1, 1.00111, 1.99222)
})
auraEmitter.Lifetime = NumberRange.new(0.5, 0.75)
auraEmitter.Rate = 10
auraEmitter.Acceleration = Vector3.new(0, 0, 0)
auraEmitter.Size = NumberSequence.new(12)
auraEmitter.Speed = NumberRange.new(0.1, 5)
auraEmitter.RotSpeed = NumberRange.new(-400, 400)
auraEmitter.Transparency = NumberSequence.new(0, 0, 1, 0)
auraEmitter.Color = ColorSequence.new(Color3.new(0, 0, 1))
auraEmitter.VelocityInheritance = 0
auraEmitter.Parent = center

-- ParticleEmitter: Wind (Center)
local windEmitterCenter = Instance.new("ParticleEmitter")
windEmitterCenter.Name = "Wind"
windEmitterCenter.Texture = "rbxassetid://6952384420"
windEmitterCenter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 19.5672, 4),
    NumberSequenceKeypoint.new(0.362836, 18.9354, 3.41718),
    NumberSequenceKeypoint.new(0.690056, 15.2264, 4.16966),
    NumberSequenceKeypoint.new(0.912056, 8.90007, 2.47374),
    NumberSequenceKeypoint.new(1, 0, 0)
})
windEmitterCenter.Lifetime = NumberRange.new(0.2, 0.3)
windEmitterCenter.Rate = 40
windEmitterCenter.Acceleration = Vector3.new(0, 0, 0)
windEmitterCenter.Size = NumberSequence.new(12)
windEmitterCenter.Speed = NumberRange.new(0.1, 0.1)
windEmitterCenter.RotSpeed = NumberRange.new(-1500, -500)
windEmitterCenter.Transparency = NumberSequence.new(1, 0.85, 1)
windEmitterCenter.Color = ColorSequence.new(Color3.new(1, 1, 1))
windEmitterCenter.ZOffset = -5
windEmitterCenter.VelocityInheritance = 0
windEmitterCenter.Parent = center

-- ParticleEmitter: Wind3 (Startup)
local wind3Emitter = Instance.new("ParticleEmitter")
wind3Emitter.Name = "Wind3"
wind3Emitter.Texture = "rbxassetid://6700006778"
wind3Emitter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 31.0722, 4),
    NumberSequenceKeypoint.new(0.456016, 29.0815, 3.41718),
    NumberSequenceKeypoint.new(0.740016, 21.1442, 4.16966),
    NumberSequenceKeypoint.new(0.912056, 8.90007, 2.47374),
    NumberSequenceKeypoint.new(1, 0, 0)
})
wind3Emitter.Lifetime = NumberRange.new(0.4, 0.6)
wind3Emitter.Rate = 50
wind3Emitter.Acceleration = Vector3.new(0, 0, 0)
wind3Emitter.Size = NumberSequence.new(15)
wind3Emitter.Speed = NumberRange.new(0.2, 1)
wind3Emitter.RotSpeed = NumberRange.new(-1000, -300)
wind3Emitter.Transparency = NumberSequence.new(1, 0.75, 1)
wind3Emitter.Color = ColorSequence.new(Color3.fromRGB(200, 200, 255))
wind3Emitter.ZOffset = -4
wind3Emitter.VelocityInheritance = 0
wind3Emitter.Parent = startup

-- ParticleEmitter: Wind (Startup)
local windEmitterStartup = Instance.new("ParticleEmitter")
windEmitterStartup.Name = "Wind"
windEmitterStartup.Texture = "rbxassetid://6952384420"
windEmitterStartup.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 19.5672, 4),
    NumberSequenceKeypoint.new(0.362836, 18.9354, 3.41718),
    NumberSequenceKeypoint.new(0.690056, 15.2264, 4.16966),
    NumberSequenceKeypoint.new(0.912056, 8.90007, 2.47374),
    NumberSequenceKeypoint.new(1, 0, 0)
})
windEmitterStartup.Lifetime = NumberRange.new(0.2, 0.3)
windEmitterStartup.Rate = 40
windEmitterStartup.Acceleration = Vector3.new(0, 0, 0)
windEmitterStartup.Size = NumberSequence.new(23)
windEmitterStartup.Speed = NumberRange.new(0.1, 0.1)
windEmitterStartup.RotSpeed = NumberRange.new(-3000, -500)
windEmitterStartup.Transparency = NumberSequence.new(1, 0.85, 1)
windEmitterStartup.Color = ColorSequence.new(Color3.new(1, 1, 1))
windEmitterStartup.VelocityInheritance = 0
windEmitterStartup.Parent = startup

-- ParticleEmitter: Wind2 (Startup)
local wind2Emitter = Instance.new("ParticleEmitter")
wind2Emitter.Name = "Wind2"
wind2Emitter.Texture = "rbxassetid://7848213224"
wind2Emitter.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 19.5672, 4),
    NumberSequenceKeypoint.new(0.362836, 18.9354, 3.41718),
    NumberSequenceKeypoint.new(0.690056, 15.2264, 4.16966),
    NumberSequenceKeypoint.new(0.912056, 8.90007, 2.47374),
    NumberSequenceKeypoint.new(1, 0, 0)
})
wind2Emitter.Lifetime = NumberRange.new(0.2, 0.3)
wind2Emitter.Rate = 40
wind2Emitter.Acceleration = Vector3.new(0, 0, 0)
wind2Emitter.Size = NumberSequence.new(23)
wind2Emitter.Speed = NumberRange.new(0.1, 0.1)
wind2Emitter.RotSpeed = NumberRange.new(-3000, -500)
wind2Emitter.Transparency = NumberSequence.new(1, 0.6, 1)
wind2Emitter.Color = ColorSequence.new(Color3.new(1, 1, 1))
wind2Emitter.VelocityInheritance = 0
wind2Emitter.Parent = startup

-- ParticleEmitter: Wind1 (Startup)
local wind1EmitterStartup = Instance.new("ParticleEmitter")
wind1EmitterStartup.Name = "Wind1"
wind1EmitterStartup.Texture = "rbxassetid://6700006778"
wind1EmitterStartup.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 19.5672, 4),
    NumberSequenceKeypoint.new(0.362836, 18.9354, 3.41718),
    NumberSequenceKeypoint.new(0.690056, 15.2264, 4.16966),
    NumberSequenceKeypoint.new(0.912056, 8.90007, 2.47374),
    NumberSequenceKeypoint.new(1, 0, 0)
})
wind1EmitterStartup.Lifetime = NumberRange.new(0.2, 0.3)
wind1EmitterStartup.Rate = 40
wind1EmitterStartup.Acceleration = Vector3.new(0, 0, 0)
wind1EmitterStartup.Size = NumberSequence.new(23)
wind1EmitterStartup.Speed = NumberRange.new(0.1, 0.1)
wind1EmitterStartup.RotSpeed = NumberRange.new(4000, 4000)
wind1EmitterStartup.Transparency = NumberSequence.new(1, 0.6, 1)
wind1EmitterStartup.Color = ColorSequence.new(Color3.new(1, 1, 1))
wind1EmitterStartup.ZOffset = -5
wind1EmitterStartup.VelocityInheritance = 0
wind1EmitterStartup.Parent = startup

-- PointLight
local pointLight = Instance.new("PointLight")
pointLight.Name = "PointLight"
pointLight.Color = Color3.new(0.333333343, 0.666666687, 1)
pointLight.Brightness = 0
pointLight.Range = 25
pointLight.Parent = lapseBlueMax

-- 이펙트 즉시 활성화
trailEmitter.Enabled = true
wind1EmitterCenter.Enabled = true
centerEmitter.Enabled = true
centerEmitter1.Enabled = true
auraEmitter.Enabled = true
windEmitterCenter.Enabled = true
wind3Emitter.Enabled = true
windEmitterStartup.Enabled = true
wind2Emitter.Enabled = true
wind1EmitterStartup.Enabled = true
print("이펙트 활성화")

-- 5초 후 이펙트 비활성화
task.delay(5, function()
    trailEmitter.Enabled = false
    wind1EmitterCenter.Enabled = false
    centerEmitter.Enabled = false
    centerEmitter1.Enabled = false
    auraEmitter.Enabled = false
    windEmitterCenter.Enabled = false
    wind3Emitter.Enabled = false
    windEmitterStartup.Enabled = false
    wind2Emitter.Enabled = false
    wind1EmitterStartup.Enabled = false
    endgg = false
    print("이펙트 자동 비활성화")
end)

print("LapseBlueMax 이펙트 생성 완료")
end
