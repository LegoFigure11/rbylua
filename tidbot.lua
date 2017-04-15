--edit this line with desired tid, in decimal, value between 0 and 65535
local desired_tid = 12345
local a_tid
local tid
function reverseword(w)
    return (w % 256)*256+math.floor(w/256)
end
s = 1

        print("RBGY TID Bot by zep715")
        print("Optimised/Edited by LegoFigure11 | Available at http://spo.ink/gen1bot")
	      print("Target ID: "..desired_tid)

local version = memory.readword(0x14e)
if version == 0xc1a2 or version == 0x36dc or version == 0xd5dd or version == 0x299c then
    print("RBGY JPN game detected")
  a_tid = 0xd2d8
elseif version == 0xe691 or version == 0xa9d then
    print("RB USA detected")
  a_tid = 0xd359
elseif version == 0x7c04 then
    print("Yellow USA detected")
  a_tid = 0xd358
elseif version == 0xd289 or version == 0x9c5e or version == 0xdc5c or version == 0xbc2e or version == 0x4a38 or version == 0xd714 or version == 0xfc7a or version == 0xa456 then
    print("RB EUR detected")
  a_tid = 0xd35e
elseif version == 0x8f4e or version == 0xfb66 or version == 0x3756 or version == 0xc1b7 then
    print("Yellow EUR detected")
  a_tid = 0xd35d
else
    print(string.format("unknown version, code: %4x", version))
  print("script stopped")
  return
end

print("Searching for ID, please wait...")
 
desired_tid = reverseword(desired_tid)
state = savestate.create()
savestate.save(state)
while true do
    curr_tid=memory.readword(a_tid)
    emu.frameadvance()
    savestate.save(state)
    local tid = memory.readword(a_tid)
    x = 0
    while x < 32 do
        joypad.set(1, {A=true})
        vba.frameadvance()
        x=x+1
    end
    tid = memory.readword(a_tid)
    if tid == desired_tid then
        print("ID found!")
	print("SRs: "..s-1)
        return
    else
  	s=s+1
        savestate.load(state)
    end
   
 
end
