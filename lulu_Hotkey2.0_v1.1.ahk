
global MOUSE_MODE := 0
global MOUSE_MOVE_CREATE_STEP := 3
global MOUSE_MOVE_CREATE_TIMES := 1

global MOUSE_MOVE_FAST_STEP := 400
global MOUSE_MOVE_MID_STEP := 100
global MOUSE_MOVE_SLOW_STEP := 1


#HotIf
RShift::
{
	return
}

RShift Up::
{
	return
}

RShift & f::
{
	Send "{Right}"
	return
}

RShift & s::
{
	Send "{Left}"
	return
}

RShift & e::
{
	Send "{Up}"
	return
}

RShift & d::
{
	Send "{Down}"
	return
}

;Mode：鼠标模式
#HotIf (MOUSE_MODE == 1)
;鼠标高速移动
`;::
{
	return
}

`; & f::
{
	global MOUSE_MOVE_FAST_STEP
	MouseMove MOUSE_MOVE_FAST_STEP, 0, 0, "R"
}

`; & s::
{
	global MOUSE_MOVE_FAST_STEP
	MouseMove -MOUSE_MOVE_FAST_STEP, 0, 0, "R"
}

`; & e::
{
	global MOUSE_MOVE_FAST_STEP
	MouseMove 0,-MOUSE_MOVE_FAST_STEP, 0, "R"
}

`; & d::
{
	global MOUSE_MOVE_FAST_STEP
	MouseMove 0,MOUSE_MOVE_FAST_STEP, 0, "R"
}

;鼠标中速移动
l::
{
	return
}

l & f::
{
	global MOUSE_MOVE_MID_STEP
	MouseMove MOUSE_MOVE_MID_STEP, 0, 0, "R"
}

l & s::
{
	global MOUSE_MOVE_MID_STEP
	MouseMove -MOUSE_MOVE_MID_STEP, 0, 0, "R"
}

l & e::
{
	global MOUSE_MOVE_MID_STEP
	MouseMove 0,-MOUSE_MOVE_MID_STEP, 0, "R"
}

l & d::
{
	global MOUSE_MOVE_MID_STEP
	MouseMove 0,MOUSE_MOVE_MID_STEP, 0, "R"
}

;鼠标低速移动
f::
{
	offset := 0

	global MOUSE_MOVE_CREATE_STEP
	global MOUSE_MOVE_CREATE_TIMES
	offset += (MOUSE_MOVE_CREATE_STEP * MOUSE_MOVE_CREATE_TIMES)
	MOUSE_MOVE_CREATE_TIMES += 1
	MouseMove offset, 0, 0, "R"

	return
}

f Up::
{
	global MOUSE_MOVE_CREATE_TIMES
	MOUSE_MOVE_CREATE_TIMES := 1
	return
}

s::
{
	offset := 0

	global MOUSE_MOVE_CREATE_STEP
	global MOUSE_MOVE_CREATE_TIMES
	offset += (MOUSE_MOVE_CREATE_STEP * MOUSE_MOVE_CREATE_TIMES)
	MOUSE_MOVE_CREATE_TIMES += 1
	MouseMove -offset,0, 0, "R"

	return
}

s Up::
{
	global MOUSE_MOVE_CREATE_TIMES
	MOUSE_MOVE_CREATE_TIMES := 1
	return
}

e::
{
	offset := 0

	global MOUSE_MOVE_CREATE_STEP
	global MOUSE_MOVE_CREATE_TIMES
	offset += (MOUSE_MOVE_CREATE_STEP * MOUSE_MOVE_CREATE_TIMES)
	MOUSE_MOVE_CREATE_TIMES += 1
	MouseMove 0, -offset, 0, "R"

	return
}

e Up::
{
	global MOUSE_MOVE_CREATE_TIMES
	MOUSE_MOVE_CREATE_TIMES := 1
	return
}

d::
{
	offset := 0

	global MOUSE_MOVE_CREATE_STEP
	global MOUSE_MOVE_CREATE_TIMES
	offset += (MOUSE_MOVE_CREATE_STEP * MOUSE_MOVE_CREATE_TIMES)
	MOUSE_MOVE_CREATE_TIMES += 1
	MouseMove 0, offset, 0, "R"

	return
}

d Up::
{
	global MOUSE_MOVE_CREATE_TIMES
	MOUSE_MOVE_CREATE_TIMES := 1
	return
}

j::
{
	MouseClick "left"
	return
}

k::
{
	MouseClick "right"
	return
}

w::
{
	if (WinActive("ahk_class XLMAIN"))
	{
		Send "!{PgUp}"
		return
	}

	;Loop 5
		;MouseClick "WheelLeft"
	Send "+{WheelUp 5}"
	return
}

r::
{
	if (WinActive("ahk_class XLMAIN"))
	{
		Send "!{PgDn}"
		return
	}

	;Loop 5
		;MouseClick "WheelRight"
	Send "+{WheelDown 5}"
	return
}

y::
{
	Loop 5
		MouseClick "WheelUp"
	return
}

h::
{
	Loop 5
		MouseClick "WheelDown"
	return
}

q::
{
	Send "^{WheelUp}"
	return
}

a::
{
	Send "^{WheelDown}"
	return
}



#HotIf
^j::
{
	global MOUSE_MODE
	MOUSE_MODE := 1

	return
}

^k::
{
	global MOUSE_MODE
	MOUSE_MODE := 0

	return
}

CapsLock::
{
	Send "^{Space}"
	return
}

SetCapsLockState "AlwaysOff"
<+CapsLock::
{
	;Send "{CapsLock}"
	SetCapsLockState !GetKeyState("CapsLock", "T")
	return
}

















