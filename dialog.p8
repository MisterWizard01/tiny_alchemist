pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--choices
--load from string

function _init()
	poke(0x5600,unpack(split"5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,12,12,0,12,0,0,54,54,0,0,0,0,0,0,54,127,54,54,127,54,0,4,14,2,14,4,0,0,0,0,51,24,12,6,51,0,0,14,27,27,110,59,59,110,0,12,12,0,0,0,0,0,0,24,12,6,6,6,12,24,0,12,24,48,48,48,24,12,0,0,54,28,127,28,54,0,0,0,12,12,63,12,12,0,0,0,0,0,0,0,12,12,6,0,0,15,0,0,0,0,0,0,0,0,0,0,12,12,0,32,48,24,12,6,3,1,0,6,11,11,11,6,0,0,0,6,7,6,6,15,0,0,0,6,15,12,6,15,0,0,0,7,12,14,12,7,0,0,0,12,14,13,15,12,0,0,0,15,3,15,12,7,0,0,0,14,3,15,11,6,0,0,0,15,12,12,6,6,0,0,0,14,11,15,13,7,0,0,0,6,13,15,12,7,0,0,0,6,6,0,6,6,0,0,0,6,6,0,6,6,0,0,0,48,24,12,6,12,24,48,0,0,0,30,0,30,0,0,0,6,12,24,48,24,12,6,0,30,51,48,24,12,0,12,0,0,30,51,59,59,3,30,0,0,0,62,96,126,99,126,0,3,3,63,99,99,99,63,0,0,0,62,99,3,99,62,0,96,96,126,99,99,99,126,0,0,0,62,99,127,3,62,0,124,6,6,63,6,6,6,0,0,0,126,99,99,126,96,62,3,3,63,99,99,99,99,0,0,24,0,28,24,24,60,0,48,0,56,48,48,48,51,30,3,3,51,27,15,27,51,0,12,12,12,12,12,12,56,0,0,0,99,119,127,107,99,0,0,0,63,99,99,99,99,0,0,0,62,99,99,99,62,0,0,0,63,99,99,63,3,3,0,0,126,99,99,126,96,96,0,0,62,99,3,3,3,0,0,0,62,3,62,96,62,0,12,12,62,12,12,12,56,0,0,0,99,99,99,99,126,0,0,0,99,99,34,54,28,0,0,0,99,99,107,127,54,0,0,0,99,54,28,54,99,0,0,0,99,99,99,126,96,62,0,0,127,112,28,7,127,0,62,6,6,6,6,6,62,0,1,3,6,12,24,48,32,0,62,48,48,48,48,48,62,0,12,30,18,0,0,0,0,0,0,0,0,0,0,0,30,0,12,24,0,0,0,0,0,0,7,11,15,11,11,0,0,0,15,11,7,11,15,0,0,0,14,3,3,3,14,0,0,0,7,11,11,11,7,0,0,0,15,3,7,3,15,0,0,0,15,3,7,3,3,0,0,0,14,3,3,11,14,0,0,0,11,11,15,11,11,0,0,0,15,6,6,6,15,0,0,0,15,12,12,13,6,0,0,0,11,11,7,11,11,0,0,0,3,3,3,3,15,0,0,0,15,15,11,11,11,0,0,0,7,11,11,11,11,0,0,0,6,11,11,11,6,0,0,0,7,11,7,3,3,0,0,0,6,11,11,15,14,0,0,0,7,11,15,7,11,0,0,0,14,3,15,12,7,0,0,0,15,6,6,6,6,0,0,0,11,11,11,11,14,0,0,0,11,11,11,15,6,0,0,0,11,11,11,15,15,0,0,0,11,11,6,11,11,0,0,0,11,11,15,6,6,0,0,0,15,12,6,3,15,0,0,0,56,12,12,7,12,12,56,0,8,8,8,0,8,8,8,0,14,24,24,112,24,24,14,0,0,0,110,59,0,0,0,0,0,0,0,0,0,0,0,0,127,127,127,127,127,127,127,0,85,42,85,42,85,42,85,0,65,99,127,93,93,119,62,0,62,99,99,119,62,65,62,0,17,68,17,68,17,68,17,0,4,12,124,62,31,24,16,0,28,38,95,95,127,62,28,0,54,127,127,62,28,8,0,0,42,28,54,119,54,28,42,0,28,28,62,93,28,20,20,0,8,28,62,127,62,42,58,0,62,103,99,103,62,65,62,0,62,127,93,93,127,99,62,0,24,120,8,8,8,15,7,0,62,99,107,99,62,65,62,0,8,20,42,93,42,20,8,0,0,0,0,85,0,0,0,0,62,115,99,115,62,65,62,0,8,28,127,62,34,0,0,0,127,34,20,8,20,34,127,0,62,119,99,99,62,65,62,0,0,10,4,0,80,32,0,0,17,42,68,0,17,42,68,0,62,107,119,107,62,65,62,0,127,0,127,0,127,0,127,0,85,85,85,85,85,85,85,0"))

	box_x,box_y,box_w,box_h=
		32,95,96,34
		
	dialog={
		{
			name="master alchemister",
			text="this is the first line\nthis is another line\nfinally, the 3rd line",
		},
		{
			name="two",
			text="what!?\nthere's more!?!?",
		},
		{
			text="do you want to go to\nsleep and save the\ngame?",
			choices={
				{
					text="yes",
				},
				{
					text="no",
				},
			}
		},
	}
	
	by=129
	show_text=""
	char=0
	page=1
	sel=1
	
	state="game"
end

function _update()
	if state=="dialog" then
		cur_dia=dialog[page]
		if by>box_y then
			by=lerp(by,box_y,.4,1)
		else
			char+=1
			show_text=sub(cur_dia.text,1,char)
		end
		
		if cur_dia.choices then
			if btnp(⬅️) then
				sel=max(sel-1,1)
			elseif btnp(➡️) then
				sel=min(sel+1,#cur_dia.choices)
			end
		end
			
		if btnp(❎) then
			if char<#cur_dia.text then
				char=#cur_dia.text
			else
				page+=1
				char=0
				if page>#dialog then
					state="game"
					page=1
					show_text=""
				end
			end
		end
		
	elseif state=="game" then
		by=lerp(by,128,.4,1)
		
		if btnp(❎) then
			state="dialog"
		end
	end
end

function _draw()
	cls(7)
	
	--box with drop shadow
--	rrectfill2(2,96,125,31,1)
--	rrectfill2(1,95,125,31,6)
	
	--more like top banner
	--portrait
	rrectfill2(0,by,33,box_h,13)
	rrectfill2(0,by+1,32,box_h,6)
	
	--text box
	rrectfill2(box_x,by,
		box_w,box_h,13)
	rrectfill2(box_x+1,by+1,
		box_w-1,box_h,6)
	
	if cur_dia then
		if cur_dia.name then
			print("\14"..cur_dia.name,box_x+3,by+3,1)
			print(show_text,box_x+7,by+12,1)
		else
			print(show_text,box_x+7,by+3,1)
		end
		
		if cur_dia.choices
		and char>#cur_dia.text then
			local inc=box_w/(1+#cur_dia.choices)
			for i=1,#cur_dia.choices do
				printc(cur_dia.choices[i].text,
					box_x+inc*i,by+24,sel==i and 1 or 13)
			end
		end
	end
	
	print(char,1,1,8)
end
-->8
--tools

--★
function normalize(x,y)
	local len=sqrt(x*x+y*y)
	if len>0 then
		return x/len,y/len
	end
	return x,y
end

function rectfill2(x,y,w,h,c)
	if w>=1 and h>=1 then
		rectfill(x,y,x+w-1,y+h-1,c)
	end
end

--function rect2(x,y,w,h,c)
--	if w>0 and h>0 then
--		rect(x,y,x+w-1,y+h-1,c)
--	end
--end

--function circfill2(x,y,r,c)
--	r=flr(r*2)/2
--	if r%1==0 then
--		circfill(x,y,r,c)
--	else
--		circfill(x-.5,y-.5,r,c)
--		circfill(x-.5,y+.5,r,c)
--		circfill(x+.5,y+.5,r,c)
--		circfill(x+.5,y-.5,r,c)
--	end
--end

--★
function collision(a,b)
	local a⬅️,a➡️,a⬆️,a⬇️,
							b⬅️,b➡️,b⬆️,b⬇️=
							a.x+a.ox,a.x+a.ox+a.w,
							a.y+a.oy,a.y+a.oy+a.h,
							b.x+b.ox,b.x+b.ox+b.w,
							b.y+b.oy,b.y+b.oy+b.h
	return not (a➡️<=b⬅️ or a⬅️>=b➡️
	or a⬇️<=b⬆️ or a⬆️>=b⬇️)
end

--only checks the corners of the sprite
--function collision_tile(s)
--	local ⬅️,➡️,⬆️,⬇️=
--							s.x+s.ox,s.x+s.ox+s.w-1,
--							s.y+s.oy,s.y+s.oy+s.h-1
--	local t1,t2,t3,t4=
--		mget(flr(⬅️/8),flr(⬆️/8)),
--		mget(flr(⬅️/8),flr(⬇️/8)),
--		mget(flr(➡️/8),flr(⬆️/8)),
--		mget(flr(➡️/8),flr(⬇️/8))
--	
--	return fget(t1,0)
--		or fget(t2,0)
--		or fget(t3,0)
--		or fget(t4,0)
--end

function rrectfill2(x,y,w,h,c)
--	x2,y2=x+w-1,y+h-1
	rectfill2(x,  y+1,w  ,h-2,c)
	rectfill2(x+1,y,  w-2,h  ,c)
end

--function printw(t,x,y,w,c)
--	local lines=split(t,"|")
--	for l in all(lines) do
--		local cur,i,l=x,1,split(l," ")
--		while i<=#l do
--			local len=measure(l[i])
--			if cur+len<x+w then
--				print(l[i],cur,y,c)
--				cur+=len+4
--				i+=1
--			else
--				cur=x
--				y+=6
--			end
--		end
--		y+=6
--	end
--end

function measure(s)
	local total,w=0,4
	if sub(s,1,1)=="\14" then
		s=sub(s,2)
		w=5
	end
	
	for i=1,#(s.."") do
		total+=w
		if ord(sub(s,i,i))>122 then
			total+=w
		end
	end
	return total
end

--★
function oprint(t,x,y,c,oc)
	for i=1,8 do
		print(t,x+dirx[i],y+diry[i],oc)
	end
	print(t,x,y,c)
end

function printc(t,x,y,c)
	print(t,x-measure(t)/2,y,c)
end

function oprintc(t,x,y,c,oc)
	oprint(t,x-measure(t)/2,y,c,oc)
end

function printr(t,x,y,c)
	print(t,x-measure(t),y,c)
end

function move_out(s,dx,dy,dist)
	local moved,box=0,new_sprite(
		s.x,s.y,s.w,s.h,s.ox,s.oy)
	while true do
		if not collision_mach(box) then
			return moved
		end
		box.x+=dx
		box.y+=dy
		moved+=1
		if moved>dist then
			return
		end
	end
end

function shade_rrect(x,y,w,h,_pal)
	local cx,cy=camera()
	x-=cx
	y-=cy
	
	poke(0x5f54,0x60)
	pal(_pal)
	
	sspr(x,y+1,w,h-2,x,y+1)
	sspr(x+1,y,w-2,h,x+1,y)
	
	poke(0x5f54,0)
	pal()
	camera(cx,cy)
end

function lab_2_world(x,y)
	return x*16+96,y*16+32
end

function world_2_lab(x,y)
	return x\16-6,y\16-2
end

function sign(n)
	return n==0 and 0 or sgn(n)
end

--fades what's already drawn
function do_fade()
	local p,kmax,col,k=flr(mid(0,
		fade_perc,1)*100)
		
	if p==100 then
		cls()
		return
	end
		
	for j=1,15 do
		col=j
		kmax=flr((p+j*1.46)/22)
		for	k=1,kmax do
			col=dpal[col]
		end
		pal(j,col,1)
	end
end

--fade to black
function fade_out(spd,_wait)
	spd=spd or 0.04
	_wait=_wait or 0
	repeat
		fade_perc=min(fade_perc+spd,1)
		do_fade()
		flip()
	until fade_perc==1
	wait(_wait)
end

function wait(t)
	for i=0,t do
		flip()
	end
end

function split2d(s)
	s=split(s,"|")
	for k,v in pairs(s) do
		s[k]=split(v)
	end
	return s
end

function sfx_no_overlap(s)
	if stat(46)!=s
	and stat(47)!=s
	and stat(48)!=s
	and stat(49)!=s then
		sfx(s)
	end
end

function toggle_music()
	music(music_playing and -1 or 0)
	music_playing=not music_playing
end

function key_prompt(text,freq)
	freq=freq or 15

	--replace all non-button chars
	--with a space
	local ❎_text,🅾️_text="",""
	for i=1,#text do
		local char=sub(text,i,i)
		if char=="❎" then
			❎_text..="❎"
			🅾️_text..="  "
		elseif char=="🅾️" then
			🅾️_text..="🅾️"
			❎_text..="  "
		else
			❎_text..=" "
			🅾️_text..=" "
		end
	end
	
	local w,cx,y=measure(text),
		웃.x+4,웃.y-11
	shade_rrect(cx-w/2-2,y,w+3,10,bpal)
	rectfill2(cx-w/2-1,y+1,w+1,8,6)
	printc(text,cx,y+3,1)
	printc(❎_text,cx,y+3,13)
	printc(❎_text,cx,y+2+(⧗%freq)/freq*2,1)
	printc(🅾️_text,cx,y+3,13)
	printc(🅾️_text,cx,y+2+((⧗+freq/2)%freq)/freq*2,1)
end

function lerp(val,targ,perc,min_add)
	local dif=abs(targ-val)
	local delta=mid(dif,dif*perc,min_add)
	return val+delta*sign(targ-val)
end

function fill_invalid_tiles()
	local w,h=lab_w*2,lab_h*2

	--fill with hashing
	fill_tiles(12,0,52,32,105,105)

	--inside the lab
	fill_tiles(12,4,w,h,0,0)

	--top and bottom
	fill_tiles(12,1,w,1,89,89)
	fill_tiles(12,2,w,1,162,0)
	fill_tiles(12,3,w,1,178,0)
	fill_tiles(11,h+4,w+2,1,121,121)
	
	--right side
	fill_tiles(w+12,2,1,h+2,106,106)

	--counter
	fill_tiles(10,14,1,h-10,163,157)
	fill_tiles(11,14,1,h-10,145,159)
	
	--corners
	mset(w+12,1,90) --tr
	mset(10,h+4,88) --bl
	mset(w+12,h+4,122) --br
	
	--blueprint corners
	mset(w+76,1,90) --tr
	mset(74,h+4,88) --bl
	mset(w+76,h+4,122) --br
end

function fill_tiles(x,y,w,h,tile,bp)
	for x=x,x+w-1 do
		for y=y,y+h-1 do
			mset(x,y,tile)
			mset(x+64,y,bp)
		end
	end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
