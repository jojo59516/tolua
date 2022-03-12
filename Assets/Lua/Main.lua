local UnityProfilerMarker = require("unity.profiling.ProfilerMarker")

--主入口函数。从这里开始lua逻辑
function Main()
	print("logic start")
end

--场景切换通知
function OnLevelWasLoaded(level)
	collectgarbage("collect")
	Time.timeSinceLevelLoad = 0
end

local update_marker = UnityProfilerMarker.Get("Update")
function Update()
    update_marker:Begin()
    print(Time.frameCount)
    update_marker:End()
end

UpdateBeat:AddListener(UpdateBeat:CreateListener(Update))

function OnApplicationQuit()
end