--[[
Title: CodeBlocklyDef_Sensing
Author(s): leio
Date: 2018/7/5
Desc: define blocks in category of Sensing
use the lib:
-------------------------------------------------------
NPL.load("(gl)script/apps/Aries/Creator/Game/Code/CodeBlocklyDef/CodeBlocklyDef_Sensing.lua");
local CodeBlocklyDef_Sensing= commonlib.gettable("MyCompany.Aries.Game.Code.CodeBlocklyDef.CodeBlocklyDef_Sensing");
-------------------------------------------------------
]]
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager");

local CodeBlocklyDef_Sensing = commonlib.gettable("MyCompany.Aries.Game.Code.CodeBlocklyDef.CodeBlocklyDef_Sensing");
local cmds = {
-- Sensing
{
	type = "isTouching", 
	message0 = L"是否碰到%1",
	arg0 = {
		{
			name = "input",
			type = "field_input",
			text = "block",
		},
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'isTouching("%s")',
	ToNPL = function(self)
		return string.format('isTouching("%s")\n', self:getFieldAsString('input'));
	end,
	examples = {{desc = L"是否和方块与人物有接触", canRun = true, code = [[
turnTo(45)
while(true) do
    moveForward(0.1)
    if(isTouching(62)) then
        say("grass block!", 1)
    elseif(isTouching("block")) then
        bounce()
    elseif(isTouching("box")) then
        bounce()
    end
end
]]}},
},

{
	type = "setName", 
	message0 = L"设置名字为%1",
	arg0 = {
		{
			name = "name",
			type = "field_input",
			text = "frog",
		},
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	previousStatement = true,
	nextStatement = true,
	func_description = 'setActorValue("name", "%s")',
	ToNPL = function(self)
		return string.format('setActorValue("name", "%s")\n', self:getFieldAsString('name'));
	end,
	examples = {{desc = L"复制的对象也可有不同的名字", canRun = true, code = [[
registerCloneEvent(function(name)
    setActorValue("name", name)
    moveForward(1);
end)
registerClickEvent(function()
    local myname = getActorValue("name")
    say("my name is "..myname)
end)
setActorValue("name", "Default")
clone("myself", "Cloned")
say("click us!")
]]}},
},

{
	type = "setPhysicsRaidus", 
	message0 = L"设置物理半径%1",
	arg0 = {
		{
			name = "radius",
			type = "field_number",
			text = 0.25,
		},
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'setActorValue("physicsRadius", %s)',
	ToNPL = function(self)
		return string.format('setActorValue("physicsRadius", %s)\n', self:getFieldAsString('radius'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
cmd("/show boundingbox")
setBlock(getX(), getY()+2, getZ(), 62)
setActorValue("physicsRadius", 0.5)
setActorValue("physicsHeight", 2)
move(0, 0.2, 0)
if(isTouching("block")) then
    say("touched!", 1)
end
setBlock(getX(), getY()+2, getZ(), 0)
wait(2)
move(0, -0.2, 0)
cmd("/hide boundingbox")
]]}},
},

{
	type = "setPhysicsHeight", 
	message0 = L"设置物理高度%1",
	arg0 = {
		{
			name = "height",
			type = "field_number",
			text = 1,
		},
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'setActorValue("physicsHeight", %s)',
	ToNPL = function(self)
		return string.format('setActorValue("physicsHeight", %s)\n', self:getFieldAsString('height'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
cmd("/show boundingbox")
setBlock(getX(), getY()+2, getZ(), 62)
setActorValue("physicsRadius", 0.5)
setActorValue("physicsHeight", 2)
move(0, 0.2, 0)
if(isTouching("block")) then
    say("touched!", 1)
end
setBlock(getX(), getY()+2, getZ(), 0)
wait(2)
move(0, -0.2, 0)
cmd("/hide boundingbox")
]]}},
},

{
	type = "registerCollisionEvent", 
	message0 = L"当碰到%1时%2",
	arg0 = {
		{
			name = "name",
			type = "field_input",
			text = "name",
		},
		{
			name = "input",
			type = "input_statement",
			text = "",
		},
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	previousStatement = true,
	nextStatement = true,
	func_description = 'registerCollisionEvent(%s, function()\\n%send)',
	ToNPL = function(self)
		return string.format('registerCollisionEvent("%s", function()\n%send)\n', self:getFieldAsString('name'), self:getFieldAsString('input'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
broadcastCollision()
registerCollisionEvent("frog", function()
end)
]]}},
},

{
	type = "broadcastCollision", 
	message0 = L"广播碰撞消息",
	arg0 = {},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'broadcastCollision()',
	ToNPL = function(self)
		return 'broadcastCollision()\n';
	end,
	examples = {{desc = L"", canRun = true, code = [[
broadcastCollision()
registerCollisionEvent("frog", function()
end)
]]}},
},

{
	type = "distanceTo", 
	message0 = L"到%1的距离",
	arg0 = {
		{
			name = "input",
			type = "field_input",
			text = "mouse-pointer",
		},
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'distanceTo("%s")',
	ToNPL = function(self)
		return string.format('distanceTo("%s")\n', self:getFieldAsString('input'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
while(true) do
    if(distanceTo("mouse-pointer") < 3) then
        say("mouse-pointer")
    elseif(distanceTo("@p") < 10) then
        say("player")
    elseif(distanceTo("@p") > 10) then
        say("nothing")
    end
    wait(0.01)
end
]]}},
},

{
	type = "askAndWait", 
	message0 = L"提问%1并等待回答",
	arg0 = {
		{
			name = "input",
			type = "field_input",
			text = L"你叫什么名字?",
		},
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'ask("%s")',
	ToNPL = function(self)
		return string.format('ask("%s")\n', self:getFieldAsString('input'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
ask("what is your name")
say("hello "..tostring(answer), 2)

ask("select your choice", {"choice A", "choice B"})
if(answer == 1) then
    say("you choose A")
elseif(answer == 2) then
    say("you choose B")
end
]]},
{desc = L"关闭对话框", canRun = true, code = [[
run(function()
   wait(3)
   ask()
end)
ask("Please answer in 3 seconds")
say("hello "..tostring(answer), 2)
]]}
},
},

{
	type = "answer", 
	message0 = L"提问的结果",
	arg0 = {},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'get("answer")',
	ToNPL = function(self)
		return 'get("answer")';
	end,
	examples = {{desc = L"", canRun = true, code = [[
say("<div style='color:#ff0000'>Like A or B?</div>html are supported")
ask("type A or B")
if(answer == "A") then
   say("A is good", 2)
elseif(answer == "B") then
   say("B is fine", 2)
else
   say("i do not understand you", 2)
end
]]}},
},

{
	type = "isKeyPressed", 
	message0 = L"%1键是否按下",
	arg0 = {
		{
			name = "input",
			type = "field_input",
			text = "space",
		},
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'isKeyPressed("%s")',
	ToNPL = function(self)
		return string.format('isKeyPressed("%s")\n', self:getFieldAsString('input'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
say("press left/right key to move me!")
while(true) do
    if(isKeyPressed("left")) then
        move(0, 0.1)
        say("")
    elseif(isKeyPressed("right")) then
        move(0, -0.1)
        say("")
    end
    wait()
end
]]},
{desc = L"", canRun = true, code = [[
say("press any key to continue!")
while(true) do
    if(isKeyPressed("any")) then
        say("you pressed a key!", 2)
    end
    wait()
end
]]},
{desc = L"按键列表", canRun = true, code = [[
-- a,b,c,...z
-- 1,2,3,...9,0
-- f1,f2,...,f12,escape
-- space,left,right,up,down
-- numpad0,numpad1,...,numpad9
-- return,minus,equals,back,tab,
-- lcontrol,lshift,lmenu
]]}
},
},

{
	type = "isMouseDown", 
	message0 = L"鼠标是否按下",
	arg0 = {
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'isMouseDown()',
	ToNPL = function(self)
		return string.format('isMouseDown()\n');
	end,
	examples = {{desc = L"点击任意位置传送", canRun = true, code = [[
say("click anywhere")
while(true) do
    if(isMouseDown()) then
        moveTo("mouse-pointer")
        wait(0.3)
    end
end
]]}},
},

{
	type = "mousePickBlock", 
	message0 = L"鼠标选取",
	arg0 = {
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'mousePickBlock()',
	ToNPL = function(self)
		return string.format('mousePickBlock()\n');
	end,
	examples = {{desc = L"点击任意位置传送", canRun = true, code = [[
while(true) do
    local x, y, z, blockid = mousePickBlock();
    if(x) then
        say(format("%s %s %s :%d", x, y, z, blockid))
    end
end
]]}},
},
{
	type = "getBlock", 
	message0 = L"获取方块id%1 %2 %3",
	arg0 = {
		{
			name = "x",
			type = "field_number",
			text = function()
				local x, y, z = EntityManager.GetPlayer():GetBlockPos();
				return x;
			end, 
		},
		{
			name = "y",
			type = "field_number",
			text = function()
				local x, y, z = EntityManager.GetPlayer():GetBlockPos();
				return y;
			end, 
		},
		{
			name = "z",
			type = "field_number",
			text = function()
				local x, y, z = EntityManager.GetPlayer():GetBlockPos();
				return z;
			end, 
		},
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'getBlock(%s, %s, %s)',
	ToNPL = function(self)
		return string.format('getBlock(%s, %s, %s)\n', self:getFieldAsString('x'), self:getFieldAsString('y'), self:getFieldAsString('z'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
local x,y,z = getPos();
local id = getBlock(x,y-1,z)
say("block below is "..id, 2)
]]}},
},

{
	type = "setBlock", 
	message0 = L"放置方块%1 %2 %3 %4",
	arg0 = {
		{
			name = "x",
			type = "field_number",
			text = function()
				local x, y, z = EntityManager.GetPlayer():GetBlockPos();
				return x;
			end, 
		},
		{
			name = "y",
			type = "field_number",
			text = function()
				local x, y, z = EntityManager.GetPlayer():GetBlockPos();
				return y;
			end, 
		},
		{
			name = "z",
			type = "field_number",
			text = function()
				local x, y, z = EntityManager.GetPlayer():GetBlockPos();
				return z;
			end, 
		},
		{
			name = "blockId",
			type = "field_number",
			text = "62", 
		},
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	previousStatement = true,
	nextStatement = true,
	func_description = 'setBlock(%s, %s, %s, %s)',
	ToNPL = function(self)
		return string.format('setBlock(%s, %s, %s, %s)\n', self:getFieldAsString('x'), self:getFieldAsString('y'), self:getFieldAsString('z'), self:getFieldAsString('blockId'));
	end,
	examples = {{desc = L"", canRun = true, code = [[
local x,y,z = getPos()
local id = getBlock(x,y+2,z)
setBlock(x,y+2,z, 62)
wait(1)
-- 0 to delete block
setBlock(x,y+2,z, 0)
setBlock(x,y+2,z, id)
]]}},
},

{
	type = "timer", 
	message0 = L"计时器",
	arg0 = {
	},
	output = {type = "field_number",},
	category = "Sensing", 
	helpUrl = "", 
	canRun = false,
	func_description = 'getTimer()',
	ToNPL = function(self)
		return string.format('getTimer()');
	end,
	examples = {{desc = L"", canRun = true, code = [[
resetTimer()
while(getTimer()<5) do
    moveForward(0.02)
end
]]}},
},

{
	type = "resetTimer", 
	message0 = L"重置计时器",
	arg0 = {
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'resetTimer()',
	ToNPL = function(self)
		return string.format('resetTimer()');
	end,
	examples = {{desc = L"", canRun = true, code = [[
resetTimer()
while(getTimer()<2) do
    wait(0.5);
end
say("hi", 2)
]]}},
},

{
	type = "mode", 
	message0 = L"设置为游戏模式",
	arg0 = {
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'cmd("/mode game")',
	ToNPL = function(self)
		return string.format('cmd("/mode game")\n');
	end,
},

{
	type = "modeEdit", 
	message0 = L"设置为编辑模式",
	arg0 = {
	},
	category = "Sensing", 
	helpUrl = "", 
	canRun = true,
	previousStatement = true,
	nextStatement = true,
	func_description = 'cmd("/mode edit")',
	ToNPL = function(self)
		return string.format('cmd("/mode edit")\n');
	end,
},

};
function CodeBlocklyDef_Sensing.GetCmds()
	return cmds;
end