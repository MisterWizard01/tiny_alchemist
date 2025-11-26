pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--tiny alchemist
--by glenn cagle

function _init()
	version="v1"
	data_found=cartdata("mrwiz_alchemist_1")

	music"0"
	menuitem(3,"toggle music",toggle_music)
	menuitem(4,"clear save",clear_save)
	music_playing=true
	
	debug={}
	
	--palettes
	dpal=split"0,1,5, 2,1,13,6, 2,4,9,3, 13,5,2,14"
	lpal=split0"13,14,6, 15,13,7,7, 14,15,15,6, 6,6,14,15",1
	bpal=split0"13,13,13,13,13,13,13,13,13,13,13,13,5,13,13",13
	fade_perc=0
	
	dirx,diry=split"-1,1,0,0,-1,1,-1,1",split"0,0,-1,1,-1,-1,1,1"
	
	--custom font
	poke(0x5600,unpack(split"5,8,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63,63,63,63,63,63,63,0,0,0,63,63,63,0,0,0,0,0,63,51,63,0,0,0,0,0,51,12,51,0,0,0,0,0,51,0,51,0,0,0,0,0,51,51,51,0,0,0,0,48,60,63,60,48,0,0,0,3,15,63,15,3,0,0,62,6,6,6,6,0,0,0,0,0,48,48,48,48,62,0,99,54,28,62,8,62,8,0,0,0,0,24,0,0,0,0,0,0,0,0,0,12,24,0,0,0,0,0,0,12,12,0,0,0,10,10,0,0,0,0,0,4,10,4,0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,12,12,0,12,0,0,54,54,0,0,0,0,0,0,54,127,54,54,127,54,0,4,14,2,14,4,0,0,0,0,51,24,12,6,51,0,0,14,27,27,110,59,59,110,0,12,12,0,0,0,0,0,0,24,12,6,6,6,12,24,0,12,24,48,48,48,24,12,0,0,54,28,127,28,54,0,0,0,12,12,63,12,12,0,0,0,0,0,0,0,12,12,6,0,0,15,0,0,0,0,0,0,0,0,0,0,12,12,0,32,48,24,12,6,3,1,0,6,11,11,11,6,0,0,0,6,7,6,6,15,0,0,0,6,15,12,6,15,0,0,0,7,12,14,12,7,0,0,0,12,14,13,15,12,0,0,0,15,3,15,12,7,0,0,0,14,3,15,11,6,0,0,0,15,12,12,6,6,0,0,0,14,11,15,13,7,0,0,0,6,13,15,12,7,0,0,0,6,6,0,6,6,0,0,0,6,6,0,6,6,0,0,0,48,24,12,6,12,24,48,0,0,0,30,0,30,0,0,0,6,12,24,48,24,12,6,0,30,51,48,24,12,0,12,0,0,30,51,59,59,3,30,0,0,0,62,96,126,99,126,0,3,3,63,99,99,99,63,0,0,0,62,99,3,99,62,0,96,96,126,99,99,99,126,0,0,0,62,99,127,3,62,0,124,6,6,63,6,6,6,0,0,0,126,99,99,126,96,62,3,3,63,99,99,99,99,0,0,24,0,28,24,24,60,0,48,0,56,48,48,48,51,30,3,3,51,27,15,27,51,0,12,12,12,12,12,12,56,0,0,0,99,119,127,107,99,0,0,0,63,99,99,99,99,0,0,0,62,99,99,99,62,0,0,0,63,99,99,63,3,3,0,0,126,99,99,126,96,96,0,0,62,99,3,3,3,0,0,0,62,3,62,96,62,0,12,12,62,12,12,12,56,0,0,0,99,99,99,99,126,0,0,0,99,99,34,54,28,0,0,0,99,99,107,127,54,0,0,0,99,54,28,54,99,0,0,0,99,99,99,126,96,62,0,0,127,112,28,7,127,0,62,6,6,6,6,6,62,0,1,3,6,12,24,48,32,0,62,48,48,48,48,48,62,0,12,30,18,0,0,0,0,0,0,0,0,0,0,0,30,0,12,24,0,0,0,0,0,0,7,11,15,11,11,0,0,0,15,11,7,11,15,0,0,0,14,3,3,3,14,0,0,0,7,11,11,11,7,0,0,0,15,3,7,3,15,0,0,0,15,3,7,3,3,0,0,0,14,3,3,11,14,0,0,0,11,11,15,11,11,0,0,0,15,6,6,6,15,0,0,0,15,12,12,13,6,0,0,0,11,11,7,11,11,0,0,0,3,3,3,3,15,0,0,0,15,15,11,11,11,0,0,0,7,11,11,11,11,0,0,0,6,11,11,11,6,0,0,0,7,11,7,3,3,0,0,0,6,11,11,15,14,0,0,0,7,11,15,7,11,0,0,0,14,3,15,12,7,0,0,0,15,6,6,6,6,0,0,0,11,11,11,11,14,0,0,0,11,11,11,15,6,0,0,0,11,11,11,15,15,0,0,0,11,11,6,11,11,0,0,0,11,11,15,6,6,0,0,0,15,12,6,3,15,0,0,0,56,12,12,7,12,12,56,0,8,8,8,0,8,8,8,0,14,24,24,112,24,24,14,0,0,0,110,59,0,0,0,0,0,0,0,0,0,0,0,0,127,127,127,127,127,127,127,0,85,42,85,42,85,42,85,0,65,99,127,93,93,119,62,0,62,99,99,119,62,65,62,0,17,68,17,68,17,68,17,0,4,12,124,62,31,24,16,0,28,38,95,95,127,62,28,0,54,127,127,62,28,8,0,0,42,28,54,119,54,28,42,0,28,28,62,93,28,20,20,0,8,28,62,127,62,42,58,0,62,103,99,103,62,65,62,0,62,127,93,93,127,99,62,0,24,120,8,8,8,15,7,0,62,99,107,99,62,65,62,0,8,20,42,93,42,20,8,0,0,0,0,85,0,0,0,0,62,115,99,115,62,65,62,0,8,28,127,62,34,0,0,0,127,34,20,8,20,34,127,0,62,119,99,99,62,65,62,0,0,10,4,0,80,32,0,0,17,42,68,0,17,42,68,0,62,107,119,107,62,65,62,0,127,0,127,0,127,0,127,0,85,85,85,85,85,85,85,0"))

	cam_x,cam_y=0,0
	
	--materials
	upcharge=split0"1,2,2,2,2,1.5,1.5,2,2,2,2,2.5,2.5,2.5,2.5,2.5,2.5,2.5,2.5,3,3,3,3,4,4,4,4,4,4,4,4",1
--	mats=split2d"0,1|0,0,1,1,2,3|0,0,1,1,2,3|0,0,1,1,2,3|0,0,1,1,2,3,4,5|0,0,1,1,2,3,4,5,6,7|0,0,0,0,1,1,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,10,11|0,0,0,0,1,1,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,10,11,16,17,18,19|0,0,0,0,1,1,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,10,11,16,17,18,19,20,21,22,23|0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,9,9,10,10,11,11,16,16,17,17,18,18,19,19,20,20,21,21,22,22,23,23,24,25,26,27,28,29,30,31"
	mats=split2d"0,1|0,1,2,3|0,1,2,3|0,1,2,3|0,1,2,3,4,5|0,1,2,3,4,5,6,7|0,1,2,3,4,5,6,7,8,9,10,11|0,1,2,3,4,5,6,7,8,9,10,11,16,17,18,19|0,1,2,3,4,5,6,7,8,9,10,11,16,17,18,19,20,21,22,23|0,1,2,3,4,5,6,7,8,9,10,11,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31"
	
	--levels
	input_sizes= split2d"1,1|1,1|1,1|2,1, 1,2|2,1, 1,2|1,1, 2,1, 1,2|1,1, 2,1, 1,2|1,1, 2,1, 1,2, 2,2|1,1, 2,1, 1,2, 2,2|1,1, 2,1, 1,2, 2,2|1,1, 2,1, 1,2, 2,2"
	output_sizes=split2d"2,1|2,1|1,2|1,1     |1,1     |1,1, 2,1, 1,2|1,1, 2,1, 1,2|1,1, 2,1, 1,2, 2,2|1,1, 2,1, 1,2, 2,2|1,1, 2,1, 1,2, 2,2|1,1, 2,1, 1,2, 2,2"
	buy_sell=				split2d"b,s,s|b,s,s|b,s,s|b,b,s|b,b,s|b,b,s|b,b,s|b,b,s|b,b,s|b,b,s"
	mach_unlock=split"1,11,11,4,2,9,7,10,8,8,5,8,6,1"

	--title screen background
	bkg={}
	for i=1,25 do
		bkg[i]={
			x=flr(rnd"16")*8,
			y=flr(rnd"16")*8,
		}
		local dir,spd=flr(rnd"4")+1
		bkg[i].dx,bkg[i].dy=dirx[dir],diry[dir]
		
		local len=flr(rnd"4")+2
		for j=1,len do
			bkg[i][j]=rnd(mats)
		end
	end
	
	turn_cw= split0"1, 3,2, 5,4, 6,7, 11,8,9,10, 15,12,13,14, 19,16,17,18, 21,20,23,22, 27,24,25,26, 31,28,29,30"
	turn_ccw=split0"1, 3,2, 5,4, 6,7, 9,10,11,8, 13,14,15,12, 17,18,19,16, 21,20,23,22, 25,26,27,24, 29,30,31,28"
	flip_h=  split0"1, 3,2, 4,5, 7,6, 8,9,11,10, 12,15,14,13, 18,17,16,19, 22,23,20,21, 28,31,30,29, 24,27,26,25"
	flip_v=  split0"1, 3,2, 4,5, 7,6, 11,10,9,8, 14,13,12,15, 16,19,18,17, 22,23,20,21, 30,29,28,31, 26,25,24,27"
	
	mach_data=split2d"h join,2,1,50,joins two formulas\nhorizontally.,0,true,6,4,51,64,11,8,15,4,13,4,17,4|v join,1,2,50,joins two formulas\nvertically.,0,true,4,2,42,64,3,24,7,12,7,10,7,14|v cut,2,1,50,separates the left\nand right halves\nof a formula.,0,true,5,3,33,64,11,8,15,4,13,4,17,4|h cut,1,2,50,separates the top\nand bottom halves\nof a formula.,0,true,3,1,24,64,3,24,7,12,7,10,7,14|cw turn,1,1,40,rotates a formula \n90 degrees\nclockwise.,0,true,2,5,33,71,3,8,0,10,0,0,0,0|ccw turn,1,1,40,rotates a formula \n90 degrees\ncounterclockwise.,0,true,2,6,24,71,3,8,0,10,0,0,0,0|h flip,1,1,40,reflects a formula\nover the y-axis.,0,true,2,7,51,71,3,8,0,10,0,0,0,0|v flip,1,1,40,reflects a formula\nover the x-axis.,0,true,2,8,42,71,3,8,0,10,0,0,0,0|treadmill,1,1,30,supplies energy to\nan adjacent dynamo.,1,false,1,0,0,0,0,0,0,0,0,0,0,0|dynamo,1,1,30,generates power\nwhen running on an\nadjacent treadmill.,1,false,1,0,0,0,0,0,0,0,0,0,0,0|storage,2,2,40,a place to store\nyour potions.,0,true,1,0,0,0,0,0,0,0,0,0,0,0|battery,1,1,30,stores unused power.,0,false,1,0,60,71,4,6,0,0,0,0,0,0|nest,1,1,30,chicken included.,0,false,1,0,0,0,0,0,0,0,0,0,0,0|trash,1,1,10,safely disposes of\nunneeded potions.,1,true,2,9,60,64,3,8,1,10,0,0,0,0|bed,1,2,0,,1,false,1,0,0,0,0,0,0,0,0,0,0,0|counter,1,1,0,,3,true,1,0,0,0,0,0,0,0,0,0,0,0|register,1,1,0,,1,false,1,0,0,0,0,0,0,0,0,0,0,0|editor,1,1,0,,1,false,1,0,0,0,0,0,0,0,0,0,0,0"
	mach_sprs=split2d"128,130,160,129,176,146,146,177|128,129,144,145,160,161,176,177|128,130,160,129,176,146,146,177|128,129,144,145,160,161,176,177|128,129,176,177|128,129,176,177|128,129,176,177|128,129,176,177|192,193,208,209|224,225,240,241|128,130,160,129,144,144,144,145,160,130,160,161,176,146,146,177|171,172,187,188|204,205,220,221|139,140,155,156| 95, 95, 95, 95,169,170,185,186|165,161,163,145|228,229,244,245|230,231,246,247"
	blup_sprs=split2d"141,142,142,143,173,174,174,175|141,143,157,159,157,159,173,175|141,142,142,143,173,174,174,175|141,143,157,159,157,159,173,175|141,143,173,175|141,143,173,175|141,143,173,175|141,143,173,175|109,111,125,127|91,92,125,127|141,142,142,143,157,158,158,159,157,158,158,159,173,174,174,175|167,168,183,184|107,108,123,124|141,143,173,175|93,94,157,159,157,159,125,127|157,159,157,159|157,159,157,159|141,143,173,175"
	
	conditions={
		--1 no function
		function()
			return {}
		end,
		--2 has potion
		function(p1)
			return {p1}
		end,
		--3 cut h ★?
		function(p1,p2)
		 local r1,r2=p1 and p1.h or 0,
		 	p2 and p2.h or 0
			return {abs(r1-r2)==2,
				r1==2,r2==2}
		end,
		--4 join v
		function(p1,p2)
			local r1,r2=p1 and p1.h==1,
		 	p2 and p2.h==1
			return {r1 and r2,r1,r2}
		end,
		--5 cut v
		function(p1,p2)
			local r1,r2=p1 and p1.w or 0,
		 	p2 and p2.w or 0
			return {abs(r1-r2)==2,
				r1==2,r2==2}
		end,
		--6 join h
		function(p1,p2)
			local r1,r2=p1 and p1.w==1,
		 	p2 and p2.w==1
			return {r1 and r2,r1,r2}
		end,
	}
	init_processes()
	
	setup()
	if not data_found then
		save_game()
		poke(0x5e10,unpack(split"1,0, 255,255,255,255, 255,255,255,255, 15,48, 18,32, 9,51, 10,52, 14,36, 255,255,255,255"))
	end
	load_game()
	for i=1,#mach_unlock do
		mach_seen[i]=
			level>=mach_unlock[i]
	end
	
	웃=new_char(bed.x+4,bed.y+6)
	웃.draw=draw_char
	spd=2
	act_x,act_y=0,0
	
	dia_y,dia_y_targ,dia_text=
		128,95,""
	
	dia_table=split("do you want to go to sleep\nand save the game?|game saved!\nreturn to title or continue?|expand the lab?\nthis cannot be undone!","|")
	choi_text=split2d("yes,no|title,continue|expand,back")
	sleep_dia,confirm_dia,expand_dia=1,2,3
	
	dia_actions={
		{
			function()
				fade_out()
				open=false
				save_game()
				show_dia(confirm_dia)
			end,
			function()
				close_dia(update_game)
			end,
		},
		{
			function()
				close_dia(update_title)
				_drw=draw_title
			end,
			function()
				start_day()
				close_dia(update_game)
			end,
		},
		{
			function()
				close_dia(update_editor)
				if cur_x==lab_w then
					lab_w+=1
					money-=lab_h*5
				else
					lab_h+=1
					money-=lab_w*5
				end
				fill_invalid_tiles()
			end,
			function()
				close_dia(update_editor)
			end,
		}
	}
	
	--actual blueprint mode cursor
	cur_x,cur_y=0,0
	
	--coordinates for lerping
	cbox=split"0,0,0,0,1,1"
end

function _update()
	_upd()
	⧗+=1
	
	--update new_mach
	new_mach=false
	for i=1,#mach_unlock do
		new_mach=new_mach or
			not mach_seen[i] and
			level>=mach_unlock[i]
	end
end

function _draw()
	_drw()

	draw_dia()

	--print debug messages
	camera()
	pal()
	clip()
	local y=28
	for k,v in pairs(debug) do
		print(k..":"..v,1,y,12)
		y+=8
	end
end

function update_game()
	--clear lab buffer
	lab_sprs={}

	--fade back in
	if fade_perc>0 then
		fade_perc=max(fade_perc-0.04,0)
	end
	
	--reset shop_slide
	shop_slide=54	
	
	--reset dialog box
	dia_y=lerp(dia_y,128,.4,1)
	
	--directional input
	local dx,dy=0,0
	for i=0,3 do
		if btn(i) then
			dx+=dirx[i+1]
			dy+=diry[i+1]
			웃.face=i
		end
	end
	
	--movement with corner slips
	웃.x=mid(95,웃.x+dx*spd,
		lab_w*16+96-웃.w)
	local back,up,down=
		move_out(웃,-dx,0,spd),
		move_out(웃,0,-1,4),
		move_out(웃,0,1,4)
	if up and (not down or up<=down) then
		웃.y-=min(up,spd)
	elseif down and (not up or down<=up) then
		웃.y+=min(down,spd)
	else
		웃.x-=dx*back
	end
	
	웃.y=mid(24,웃.y+dy*spd,
		lab_h*16+22-웃.h)
	local back,left,right=
		move_out(웃,0,-dy,spd),
		move_out(웃,-1,0,4),
		move_out(웃,1,0,4)
	if left and (not right or left<=right) then
		웃.x-=min(left,spd)
	elseif right and (not left or right<=left) then
		웃.x+=min(right,spd)
	else
		웃.y-=dy*back
	end
	
	--add 웃 to lab_spr buffer
	add(lab_sprs,웃)
	
	--animate 웃
	if dx!=0 or dy!=0 then
		웃.frame+=.4
		웃.frame%=2
		웃.flp=(dx<=0)
		sfx_no_overlap"0"
	else
		웃.frame=0
	end
	
	--update action tile
	local x,y=웃.x+4,웃.y+10
	stand_mach=get_mach(x,y)
	act_x,act_y=
		x+dirx[웃.face+1]*16,
		y+diry[웃.face+1]*16
	face_mach=get_mach(act_x,act_y)
	
	--buttons
	stand_mach_name=stand_mach and stand_mach.name
	if stand_mach_name=="treadmill" then
		if btn()/(stand_mach
		.frame%2+1)==16 then
			do_treadmill(stand_mach)
		end
	elseif stand_mach_name=="bed" then
		if btn"5" then
			butt_hold+=1
		else
			butt_hold=0
		end
		if butt_hold>20 then
			butt_hold=0
			show_dia(sleep_dia)
		end
	elseif stand_mach_name=="editor" then
		if btnp"5" then
			_upd=update_editor
			_drw=draw_editor
			butt_hold=1
		end
	else
		butt_hold=0
	
		--machine interactions
		if face_mach then
			if btnp"4" then
				swap_pots(act_x,act_y)
			end
		
			if btnp"5" then
				if face_mach.name=="register" then
					if tme<=540 then
						open=true
						sfx"12"
					elseif cur_cust then
						local sold=false
						for i=1,3 do
							local oc=offer_counters[i]
							sold=sold or oc.buy and
								oc.pots[1]
							oc.pots={}
						end
						if sold then
							--tip for fast service
							--960 frames = 1 hour
							money+=max(0,2-(⧗-deal⧗)\480)
							--get less xp for lower
							--level customers
							level+=.25>>(flr(level)-
								cur_cust.level)
						end
						sfx"7"
						add(cust,del(cust_line,
							cur_cust))
						cur_cust=nil
					end
				end
			end
		end
	end
	
	--battery power
	local p=min(mach_count[12],charge)
	charge-=p
	power+=p
			
	for m in all(machines) do
		--ready up
		local pots=m.pots
		if pots then
			m.ready=
				m.condition(unpack(pots,1,2))
		end
		add(lab_sprs,m)
		
		--dynamo animation
		if m.name=="dynamo" then
			if power>0 then
				m.glow=1
				sfx_no_overlap"1"
			else
				m.glow=max(m.glow-.05,0)
			end
		end
	end
	
	--run machines
	--★
	for i=1,4*#machines do
		if power==0 then break end
		local m=machines[1]
		if m.ready[1] then
			power-=1
			m.prog+=1
			if m.prog>=m.max_prog then
				m.prog=0
				m.pots=m.process(m.pots)
				sfx"2"
			end
		else
			m.prog=0
		end
		add(machines,deli(machines,1))
	end
	
	charge=min(capacity,charge+power)
	power=0
	
	--update customers
	for i=1,#cust_line do
		local c=cust_line[i]
		add(lab_sprs,c)
		if c.y<72-i*8 then
			c.y+=1
			c.frame=(c.frame+.2)%2
		else
			c.frame=0
		end
	end
	for c in all(cust) do
		add(lab_sprs,c)
		c.y+=1
		c.frame=(c.frame+.2)%2
		if c.y>300 then
			del(cust,c)
		end
	end
	
	--create new customers
	local cust_time=del(cust_times,tme)
	if cust_time then
		local c=new_char(
			66+rnd"8",-16)
		if rnd"9">(#cust_line+1) then
			add(cust_line,c)
			sfx"5"
		else
			add(cust,c)
			c.x-=8
		end
	end
	
	--check if counters are empty
	local cant_deal
	for i=1,3 do
		if offer_counters[i].pots[1] then
			cant_deal=true
		end
	end
	
	--initiate deal with the
	--first in line
	if not cur_cust and cust_line[1]
	and not cant_deal then
		deal⧗=⧗
		cur_cust=cust_line[1]
		local lvl=min(#input_sizes,
			flr(rnd(level-1)+1))
		cur_cust.level=lvl
		for i=1,3 do
			local oc=offer_counters[i]
			local buy=buy_sell[lvl][i]=="b"
			local pot,price=
				rand_offer(lvl,buy)
			--buy/sell from the 
			--customer's perspective
			if not buy then
				oc.pots[1]=pot
			end
			oc.price=price
			oc.offer_pot=pot
			oc.buy=buy
		end
	end
	
	--update birds
	for b in all(birds) do
		update_bird(b)
		add(lab_sprs,b)
	end
	
	update_time()
	update_money()

	--update banner text
	toptext="\14\fdnone"
	🅾️text=""
	❎text=""
	if stand_mach then
		local name=stand_mach.name
		toptext="\f1\14"..name
		if name=="bed" then
			❎text="\f1❎ hold to sleep"
		elseif name=="treadmill" then
			❎text="\f1❎🅾️ run"
		elseif name=="editor" then
			❎text="\f1❎ edit lab"
		end
	elseif face_mach then
		toptext="\f1\14"..face_mach.name
		if face_mach.name=="register" then
			if tme<=540 then
				❎text="\f1❎ open shop"
			elseif cur_cust then
				❎text="\f1❎ next customer"
			end
		end
		if face_mach.pots then
			local m,pot=get_m_pot_ind(act_x,act_y)
			if hold then
				if pot then
					🅾️text="\f1🅾️ swap"
				else
					🅾️text="\f1🅾️ place"
				end
			else
				if pot then
					🅾️text="\f1🅾️ pick up"
				end
			end
		end
	end
end

function update_editor()
	--slide the shop back up
	shop_slide=lerp(shop_slide,54,.5,.2)

	--slide dialog box down
	dia_y=lerp(dia_y,128,.4,1)

	local dx,dy,mx,my,mw,mh=
		0,0,cur_x,cur_y,1,1
	local expandx,expandy=
		(cur_y<lab_h and cur_y>=0) and 1 or 0,
		cur_x<lab_w and 1 or 0
	if sel_mach then
		mx,my=world_2_lab(sel_mach.x,sel_mach.y)
		mw,mh,expandx,expandy=
			sel_mach.lw,sel_mach.lh,0,0
	end
	
	--directional input
	for i=0,3 do
		if btnp(i) then
			dx,dy=dirx[i+1],diry[i+1]
			if (mx==0) dx=max(dx,0)
			if (mx==lab_w-mw+expandx) dx=min(dx,0)
			if (my==-expandy) dy=max(dy,0)
			if (my==lab_h-mh+expandy) dy=min(dy,0)
			
			cur_x+=dx
			cur_y+=dy
			mx+=dx
			my+=dy
			
			if sel_mach then
				sel_mach.x+=dx*16
				sel_mach.y+=dy*16
			end
		end
	end
	
	--update cursor
	local x,y,w,h=cur_x,cur_y,1,1
	local m=get_mach(lab_2_world(x,y))
	local mach=sel_mach or m
	if mach then
		x,y=world_2_lab(mach.x,mach.y)
		w,h=mach.lw,mach.lh
	end
	for i=1,6 do
		cbox[i]=lerp(cbox[i],
			pack(cur_x,cur_y,x,y,w,h)[i],
			.5,.2)
	end
	
	if btnp"5" and not sel_mach
	and butt_hold==0 then
		웃.x,웃.y=editor.x+4,editor.y
		_upd=update_game
		_drw=draw_game
	end
	
	if btnp"4" then
		if can_place and sel_mach then
			--place machine
			add(machines,sel_mach)
			if sel_mach.name=="nest" then
				sel_mach.bird.x,sel_mach.bird.y=
					sel_mach.x+4,sel_mach.y
			end
			sel_mach=nil
		elseif m and not sel_mach then
			--pick up machine
			sel_mach=m
			del(machines,m)
		elseif cur_x==lab_w
		and money>=lab_h*5 then
			show_dia(expand_dia)
		elseif cur_y==lab_h
		and money>=lab_w*5 then
			show_dia(expand_dia)
		elseif cur_y<0 then
			_upd=update_shop
		end
	end
	
	can_place,can_sell=true
	local typ
	if sel_mach then
		typ=sel_mach.typ
	
		--update can_place
		for _x=x,x+w-1 do
			for _y=y,y+h-1 do
				if get_mach(lab_2_world(_x,_y)) then
					can_place=false
				end
			end
		end
		
		--update can_sell
		can_sell=is_empty(sel_mach)
			and mach_count[typ]>mach.min_count
	end
		
	if btn"5" then
		if butt_hold>20
		and can_sell then
			--sell machine
			if typ==12 then --battery
				capacity-=480
			elseif typ==13 then --nest
				del(birds,sel_mach.bird)
			end
			money+=mach_data[typ][4]
			sel_mach=nil
			mach_count[typ]-=1
		end
		butt_hold+=1
	else
		butt_hold=0
	end
	
	update_time()
	update_money()
	
	--update banner text
	toptext,🅾️text,❎text="\14\fdnone",
		"","\f7❎ exit editor"
	if cur_x==lab_w then
		toptext,🅾️text=
			"\14\f7expand lab",
			"\f7🅾️ expand for \14$"..5*lab_h
	elseif cur_y==lab_h then
		toptext,🅾️text=
			"\14\f7expand lab",
			"\f7🅾️ expand for \14$"..5*lab_w
	elseif cur_y==-1 then
		toptext,🅾️text=
			"\14\f7machine shop",
			"\f7🅾️ open shop"
	elseif sel_mach then
		if can_place then
			🅾️text="\f7🅾️ place"
		else
			🅾️text="\f8invalid placement"
		end
		if can_sell then
			❎text="\f7❎ hold to sell"
		elseif is_empty(sel_mach) then
			❎text="\fdneed at least "..sel_mach.min_count
		else
			❎text="\fdmust empty to sell"
		end
		toptext="\f7\14"..sel_mach.name
	elseif mach then
		🅾️text,toptext="\f7🅾️ pick up",
			"\f7\14"..mach.name
	end
end

function update_shop()
	--slide the shop down
	shop_slide=lerp(shop_slide,0,.5,.2)
	hslide=lerp(hslide,0,.5,.02)
	
	--slide the dialog box down
	dia_y=lerp(dia_y,128,.4,1)
	
	if btnp"5" then
		_upd=update_editor
		_drw=draw_editor
	end
	
	local price=mach_data[sel][4]
	if btnp"4"
	and level>=mach_unlock[sel]
	and money>=price then
		money-=price
		sel_mach=add_mach(sel,
			lab_2_world(0,0))
		del(machines,sel_mach)
		cur_x,cur_y=0,0
		_upd=update_editor
		_drw=draw_editor
	end
	
	if btnp"0" and sel>1 then
		sel-=1
		if sel<shop_size-4 and sel>4 then
			hslide=-1
		end
	elseif btnp"1" and sel<shop_size then
		sel+=1
		if sel<shop_size-3 and sel>5 then
			hslide=1
		end
	end
	
	--mark mach as seen
	mach_seen[sel]=
		level>mach_unlock[sel]
	
	update_time()
	update_money()
	
	--update banner text
	🅾️text="\f7🅾️ buy"
	❎text="\f7❎ back"
end

--updates the in game clock
function update_time()
	if open then
		tme+=.0625
		--close at 17:00
		if tme>=1020 then
			open=false
			sfx"12"
			for c in all(cust_line) do
				add(cust,del(cust_line,c))
			end
		end
	end
end

function update_money()
	--lerp money on hud
	local prev=show_money
	show_money=lerp(show_money,
		money,.1,.2)
	if (flr(prev%10)!=flr(show_money%10)) sfx"6"
end

function draw_game()
	pal()
	
	cam_y=mid(-16,웃.y-56,lab_h*16-80)
	cam_x=mid(60,웃.x-60,lab_w*16-12)
	camera(cam_x,cam_y)

	--background
	cls(1)
	rectfill2(95,31,lab_w*16+1,lab_h*16+2,7)
	for i=6,5+lab_w do
		for j=2,1+lab_h do
			rrectfill2(i*16,j*16,15,15,6)
			local ax,ay=world_2_lab(act_x,act_y)
			if i-6!=ax or j-2!=ay then
				rectfill2(i*16+1,j*16+1,13,13,7)
			end
		end
	end
	map()
	
--	print(open and "\014open" or
--		"\014closed",82,18,1)
	
	palt()
	
	--bed headboard
	spr(137,bed.x,bed.y,2,3)
	
	--sprites in the lab
	for i=1,#lab_sprs-1 do
		for j=i+1,#lab_sprs do
			local s1,s2=
				lab_sprs[i],lab_sprs[j]
			if s1.y+s1.h+s1.oy>s2.y+s2.h+s2.oy then
				lab_sprs[i]=s2
				lab_sprs[j]=s1
			end
		end
	end
	
	for s in all(lab_sprs) do
		pal()
		s:draw()
	end
	
	--machine progress bars
	for m in all(machines) do
		if m.prog>0 then
			local bar_x,bar_y=m.x,m.y+15
			shade_rrect(bar_x,bar_y,15,4,
				split"1,2,3,4,5,6,7,8,9,10,11,12,5,14,15")
			rectfill2(bar_x+1,bar_y+1,
				13,2,13)
			rectfill2(bar_x+1,bar_y+1,
				13*m.prog/m.max_prog,2,10)
		end
	end

	pal()
	--treadmill key prompt
	if stand_mach_name=="treadmill" then
		key_prompt("❎ 🅾️",8)
	--bed key prompt
	elseif stand_mach_name=="bed" then
		key_prompt("hold ❎",45)
	--editor key prompt
	elseif stand_mach_name=="editor" then
		key_prompt"❎"
	elseif face_mach then
		--register key prompt
	 if face_mach.name=="register"
		and (cur_cust or tme<=540) then
			key_prompt"❎"
		end
	end
	
	--potion formulas
	local m,pot,ind=get_m_pot_ind(act_x,act_y)
	if m and pot then
		local help=ind-1
		local fx,fy,mx,my=
			dirx[웃.face+1],
			diry[웃.face+1],
			face_mach.x+help%m.lw*16,
			face_mach.y+help\m.lw*16
		draw_formula(pot,
			mx+7*fx+7,my+7*fy+4,
			-fx,-fy)
	end
	
	--customer offers
	for i=1,3 do
		local oc,f=offer_counters[i],
			웃.face+1
		local fx,fy,mx,my=
			dirx[f],diry[f],oc.x,oc.y
		
		if oc==face_mach
		and cur_cust then	
			draw_formula(oc.offer_pot,
				mx+7*fx+7,my+7*fy+4,-fx,-fy)
		end
		
		if cur_cust then
			printc("\014$"..oc.price,
				mx+8,my+9,1)
		end
	end
	
	--hud
	camera()
	draw_banner("\f1",6)
	
	pal()
	--potion in hand
	rrectfill2(56,4,11,12,13)
	rrectfill2(57,5,9,10,6)
	if hold then	
		pset(67,10,13)
		draw_formula(hold,68,10,-1,0)
		spr(hold.s+64,58,6)
	end
	do_fade()
end

function draw_editor()
	pal()
	
	local cx,cy=lab_2_world(unpack(cbox))
	cam_y=mid(-16,cy-56,lab_h*16-80)
	cam_x=mid(80,cx-60,lab_w*16-16)
	camera(cam_x,cam_y)
	
	--background grid
	cls"1"
	map"64"
	fillp(▒)
	local x,y,x2,y2=95,31,
		96+lab_w*16,32+lab_h*16
	while x<x2 do
		line(x,31,x,y2,13)
		x+=16
	end
	while y<y2 do
		line(95,y,x2,y)
		y+=16
	end
	fillp()

	--cursor
	local cur_col,mach=2,get_mach(
		lab_2_world(cur_x,cur_y))
	if cur_x<lab_w and cur_y<lab_h
	and cur_y>=0 then
		if sel_mach then
			cur_col=14
		elseif mach then
			cur_col=12
		end
		local x,y=
			lab_2_world(unpack(cbox,3))
		local w,h=
			cbox[5]*16,cbox[6]*16
		rrectfill2(x-1,y-1,w+1,h+1,cur_col)
		rrectfill2(x,y,w-1,h-1,1)
		rrectfill2(
			97+cbox[1]*16,33+cbox[2]*16,
			13,13,13)
	end
	
	--machines
	for m in all(machines) do
		draw_mach(m,true)
	end
	
	pal()
	
	if sel_mach then
		local x,y=
			lab_2_world(cbox[3],cbox[4])
		--red rect for invalid placement
		if not can_place then
			local w,h=sel_mach.lw*16-1,
				sel_mach.lh*16-1
			rrectfill2(x,y,w,h,8)
		end
		
		--selected machine
		draw_mach_body(sel_mach.typ,
			x,y,true)
	end
	
	--expand lab width option
	pal()
	if cur_x>=lab_w then
		pal(1,12)
	end
	local x,y=lab_2_world(lab_w,lab_h/2)
	spr(203,x+5,y-16,1,4)
	
	--expand lab height option
	pal()
	if cur_y>=lab_h then
		pal(1,12)
	end
	local x,y=lab_2_world(lab_w/2,lab_h)
	oprintc("\14expand",x,y+4,6,1)
	
	--buy machines
	pal()
	if cur_y<0 then
		pal(1,12)
	end
	local x,y=
		lab_2_world(lab_w/2,-1)
	oprintc("\14buy machines",
		x,y-4,6,1)
	if new_mach then
		draw_new_mach(x+27,y-8)
	end
	
	--shop
	camera()
	draw_banner("\f1",13)
	
	--background
	rrectfill2(0,-shop_slide,0,67,1)
	rrectfill2(0,-shop_slide,128,66,7)
	rrectfill2(0,-shop_slide,128,65,6)

	--lock "spr"
	lock="\^:0e111f1b1f000000"

	local name,w,h,price,desc=
		unpack(mach_data[sel])
	rrectfill2(8,29-shop_slide,33,33,1)
	local lvl_req=mach_unlock[sel]
	if level<lvl_req then
		name="locked"
		desc="unlocked at lvl "..lvl_req
		print(lock,22,44-shop_slide,13)
	else
		--price
		print("\014$"..price,43,
			36-shop_slide,money>=price and 1 or 2)
		--size
		print(w.."x"..h,71,
			36-shop_slide,1)
		--owned
		print(mach_count[sel].." owned",
			91,36-shop_slide,1)
		--preview
		draw_mach_body(sel,25-w*8,
			46-h*8-shop_slide,true)
	end
	
	pal()	
	--name
	print("\014"..name,43,
		30-shop_slide,1)
	--description
	print(desc,43,44-shop_slide,13)
	--arrows
	if sel>1 then
		spr(86,⧗/10%2,42-shop_slide)
	end
	if sel<shop_size then
		spr(86,120.9-⧗/10%2,
			42-shop_slide,1,1,true)
	end
	
	--label previews
	pal(split"7,2,3,4,5,1,1,8,9,6,11,12,1,13,15")
	for i=-5,5 do
		local ind,x=
			mid(5,sel,shop_size-4)+i,
			58+14*i+hslide*14
		if ind>0 and ind<=shop_size then
			rrectfill2(x,66-shop_slide,13,
				11,(ind==sel) and 12 or 6)
			rrectfill2(x+1,67-shop_slide,
				11,9,10)
			md=mach_data[ind]
			rectfill2(x+2,68-shop_slide,
					9,7,6)
			if level<mach_unlock[ind] then
				print(lock,x+4,
					69-shop_slide,14)
			else
				if md[10]>0 then
					sspr(md[10],md[11],9,7,x+2,
						68-shop_slide)
				else
					print(md[1][1],x+5,
						69-shop_slide,1)
				end
				if not mach_seen[ind] then
					draw_new_mach(x+8,
						64-shop_slide)
				end
			end
		end
	end
	pal()
	
	--hud
	draw_banner("\f6",1)
end

function start_day()
	--customers come between
	--9:00 and 17:00
	tme=540 --9:00
	cust={}
	cust_line={}
	cust_times={}
	for i=1,24 do
		add(cust_times,
			flr(540+rnd"480"))
	end
end

function clear_save()
	setup()
	save_game()
	poke(0x5e10,unpack(split"1,0, 255,255,255,255, 255,255,255,255, 15,48, 18,32, 9,51, 10,52, 14,36, 255,255,255,255, 13,20,"))
	load_game()
end

function setup()
	⧗=0
	_upd=update_title
	_drw=draw_title
	
	money=10
	show_money=10
	level=1
	tme=540
	open=false
	power=0
	capacity=0
	charge=0
	hold=nil
	
	butt_hold=0	
	shop_size=14
	sel=1
	shop_slide=54
	hslide=0
	toptext=""
	🅾️text=""
	❎text=""
	
	lab_w,lab_h=4,5
	
	birds={}
	
	mach_seen={}
	mach_count={}
	for i=1,#mach_data do
		mach_count[i]=0
	end
	
	machines={}
	add_mach(17,80,96) --register
	offer_counters={
		add_mach(16,80,48),
		add_mach(16,80,64),
		add_mach(16,80,80),
	}
	
	--buffer for sprites in lab
	--to draw them in y-sort order 
	lab_sprs={}
end
-->8
--sprites

function new_sprite(x,y,w,h,ox,oy)
	return {
		x=x or 0,
		y=y or 0,
		w=w or 8,
		h=h or 8,
		ox=ox or 0,
		oy=oy or 0,
	}
end

function new_char(x,y)
	local skin_cols,hair_cols,shirt_cols,coat_cols,pants_cols=
		split"4,12,13,14,15",
		split"1,2,4,5,8,9,10,11,12,13,14",
		split"1,2,3,4,5,8,9,10,11,12,13,14,15",
		split"1,2,3,4,5,8,9,10,11,12,13,14,15",
		split"1,2,3,4,5,8,9,10,11,12,13,14,15"
	
	local p=new_sprite(x,y,6,6,1,10)
	p.head=flr(rnd"8")
	p.body=flr(rnd"8")
	p.frame=0
	p.face=0
	
	p.skin=rnd(skin_cols)
	del(hair_cols,p.skin)
	--del(shirt_cols,p.skin)
	del(coat_cols,p.skin)
	
	p.hair=rnd(hair_cols)
	p.shirt=rnd(shirt_cols)
	del(coat_cols,p.shirt)
	
	p.coat=rnd(coat_cols)
	del(pants_cols,p.coat)
	
	p.pants=rnd(pants_cols)
	
	p.draw=draw_char
	
	return p
end

function draw_char(p,head_only)
	pal(15,p.skin)
	pal(14,dpal[p.skin])
	
	local ox,oy=
		flr(p.frame)*64,-flr(p.frame)
		
	pal(4,p.hair)
	pal(2,dpal[p.hair])
	pal(1,0) --pupil
	sspr(p.head*8+ox,16,8,5,
		p.x,p.y+oy,8,5,p.flp)
	
	if not head_only then
		pal(8,p.shirt)
		pal(12,p.pants)
		pal(11,p.coat)
		pal(3,dpal[p.coat])
		sspr(p.body*8+ox,21,8,11,
			p.x,p.y+oy+5,8,11,p.flp)
	end
end

function add_bird(x,y)
	local b=new_sprite(x,y,8,4,0,4)
	b.frame=0
	b.state="wait"
	b.⧗=30
	b.draw=draw_bird
	add(birds,b)
	return b
end

function draw_bird(b)
	spr(112+flr(b.frame),b.x,b.y,
		1,1,b.flp)
end

--★
function update_bird(b)
	if b.state=="wander" then
		b.x+=b.dx
		b.y+=b.dy
		b.frame=(b.frame+.2)%2
		b.flp=b.dx<0
		if abs(b.tx-b.x)<1
		and abs(b.ty-b.y)<1
		or collision_mach(b) then
			b.x=flr(b.x-b.dx)
			b.y=flr(b.y-b.dy)
			b.state="wait"
			b.⧗=⧗+rnd"60"+30
		end
	elseif b.state=="wait" then
		b.frame=0
		local spooked=collision(웃,b)
		if ⧗>=b.⧗ or spooked then
			b.state="wander"
			b.tx=rnd(lab_w*16)+88
			b.ty=rnd(lab_h*16)+24
			b.dx,b.dy=b.tx-b.x,b.ty-b.y
			--normalize
			local len=sqrt(b.dx^2+b.dy^2)
			b.dx/=len
			b.dy/=len
			if spooked then
				sfx_no_overlap"9"
				if rnd"1"<.1 
				and not hold then
					hold=rand_pot(mats[1],
						input_sizes[1])
					hold.s=0
				end
			end
		end
	end
end

--sets a machine's hitbox
--to its lower half
function half_box(m)
	m.h,m.oy=8,8
end

--returns a machine that is
--colliding with s
function collision_mach(s)
	for m in all(machines) do
		if collision(m,s) then
			return m
		end
	end
end
-->8
--tools

--★
--function normalize(x,y)
--	local len=sqrt(x*x+y*y)
--	if len>0 then
--		return x/len,y/len
--	end
--	return x,y
--end

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

function collision(a,b)
	local a⬅️,a➡️,a⬆️,a⬇️,
							b⬅️,b➡️,b⬆️,b⬇️,
							ox_dif,oy_dif=
							a.x,a.x+a.w,
							a.y,a.y+a.h,
							b.x,b.x+b.w,
							b.y,b.y+b.h,
							b.ox-a.ox,b.oy-a.oy
	return not (a➡️<=b⬅️+ox_dif
										or a⬅️>=b➡️+ox_dif
										or a⬇️<=b⬆️+oy_dif
										or a⬆️>=b⬇️+oy_dif)
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
	return print(s,0,1000)
end

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

--function sign(n)
--	return n==0 and 0 or sgn(n)
--end

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
	for i=46,49 do
		if stat(i)==tonum(s) then
			return
		end
	end
	sfx(s)
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
		local char=text[i]
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
	local sign=targ-val
	sign=sign==0 and sign or sgn(sign) 
	return val+delta*sign
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

function split0(s,val)
	t=split(s)
	t[0]=val or 0
	return t
end

function move(s)
	s.x+=s.dx
	s.y+=s.dy
end
-->8
--potions

function rand_pot(mats,sizes)
	local i=rnd(#sizes)\2*2+1
	local pot={
		w=sizes[i],
		h=sizes[i+1],
		tl=rnd(mats),
		tr=rnd(mats),
		bl=rnd(mats),
		br=rnd(mats),
	}
	if pot.w==1 then
		pot.tr,pot.br=nil
	end
	if pot.h==1 then
		pot.bl,pot.br=nil
	end
	pot.s=pot_spr(pot)
	
	return pot
end

function draw_formula(pot,x,y,hor,ver)
	if not tonum(pot.w) then
		debug.w=pot.w
		return
	end
	local w,h=pot.w*8,pot.h*8
	
	if hor==0 then
		x-=w/2+1
	elseif hor>0 then
		x-=w+2
	end
	if ver==0 then
		y-=h/2+1
	elseif ver>0 then
		y-=h+2
	end
	
	--rrectfill2(x,y,w+3,h+3,13)
	shade_rrect(x,y,w+3,h+3,bpal)
	rectfill2(x+1,y+1,w+1,h+1,7)
	
	if (pot.tl) spr(pot.tl,x+2, y+2)
	if (pot.tr) spr(pot.tr,x+10,y+2)
	if (pot.bl) spr(pot.bl,x+2, y+10)
	if (pot.br) spr(pot.br,x+10,y+10)
end

function pot_spr(pot)
	local looks=
		(pot.tl or -1)~
		((pot.tr or -1)<<1)~
		((pot.bl or -1)<<2)~
		((pot.br or -1)<<3)
 return abs(looks)%15+1
end

--normalizes a potion
--justifies all shapes to the
--top left
function norm_pot(pot)
	local w,h,tl,tr,bl,br=1,1,
		pot.tl,pot.tr,pot.bl,pot.br
	
	if tl and tr
	or bl and br then
		w=2
	else
		tl=tl or tr
		bl=bl or br
		tr=nil
		br=nil
	end
	if tl and bl
	or tr and br then
		h=2
	else
		tl=tl or bl
		tr=tr or br
		bl=nil
		br=nil
	end
	
	local p={
		w=w,
		h=h,
		tl=tl,
		tr=tr,
		bl=bl,
		br=br,
	}
	p.s=pot_spr(p)
	return p
end

function init_processes()
	processes={
		--1 cut h
		function(pots)
			local pot=pots[1] or pots[2]
			return {norm_pot({
				w=pot.w,
				h=1,
				tl=pot.tl,
				tr=pot.tr,
			}),norm_pot({
				w=pot.w,
				h=1,
				tl=pot.bl,
				tr=pot.br,
			})}
		end,
		
		--2 join v
		function(pots)
			local pot1,pot2=unpack(pots)
			return {norm_pot({
				w=max(pot1.w,pot2.w),
				h=2,
				tl=pot1.tl,
				tr=pot1.tr,
				bl=pot2.tl,
				br=pot2.tr,
			})}
		end,
		
		--3 cut v
		function(pots)
			local pot=pots[1] or pots[2]
			return {norm_pot({
				w=1,
				h=pot.h,
				tl=pot.tl,
				bl=pot.bl,
			}),norm_pot({
				w=1,
				h=pot.h,
				tl=pot.tr,
				bl=pot.br,
			})}
		end,
		
		--4 join h
		function(pots)
			local pot1,pot2=unpack(pots)
			return {norm_pot({
				w=2,
				h=max(pot1.w,pot2.w),
				tl=pot1.tl,
				tr=pot2.tl,
				bl=pot1.bl,
				br=pot2.bl,
			})}
		end,
		
		--5 turn cw
		function(pots)
			local pot=pots[1]
			return {norm_pot({
				w=pot.h,
				h=pot.w,
				tl=turn_cw[pot.bl],
				tr=turn_cw[pot.tl],
				bl=turn_cw[pot.br],
				br=turn_cw[pot.tr],
			})}
		end,
		
		--6 turn ccw
		function(pots)
			local pot=pots[1]
			return {norm_pot({
				w=pot.h,
				h=pot.w,
				tl=turn_ccw[pot.tr],
				tr=turn_ccw[pot.br],
				bl=turn_ccw[pot.tl],
				br=turn_ccw[pot.bl],
			})}
		end,
		
		--7 flip h
		function(pots)
			local pot=pots[1]
			return {norm_pot({
				w=pot.w,
				h=pot.h,
				tl=flip_h[pot.tr],
				tr=flip_h[pot.tl],
				bl=flip_h[pot.br],
				br=flip_h[pot.bl],
			})}
		end,
		
		--8 flip v
		function(pots)
			local pot=pots[1]
			return {norm_pot({
				w=pot.w,
				h=pot.h,
				tl=flip_v[pot.bl],
				tr=flip_v[pot.br],
				bl=flip_v[pot.tl],
				br=flip_v[pot.tr],
			})}
		end,
		
		--9 trash
		function(pots)
			return {}
		end,
	}
end

function pots_match(a,b)
	if not (a and b) then
		return
	end
	
	return a.tl==b.tl
	and a.tr==b.tr
	and a.bl==b.bl
	and a.br==b.br
end

function rand_offer(lvl,buy)
	local pot=rand_pot(mats[lvl],
		buy and output_sizes[lvl] or
		input_sizes[lvl])
	local price,r=0,rnd"3"+1
	--buy/sell from the
	--customer's perspective
		price+=material_price(r,buy,pot.tl)
		price+=material_price(r,buy,pot.tr)
		price+=material_price(r,buy,pot.bl)
		price+=material_price(r,buy,pot.br)
	return pot,flr(price)
end

function material_price(r,buy,mat)
	return mat and r+(buy and upcharge[mat] or 0) or 0
end

function save_pot(pot)
	pot=pot or {}
	return {
		pot.tl or 255,
		pot.tr or 255,
		pot.bl or 255,
		pot.br or 255,
	}
end

function load_pot(data)
	local tl,tr,bl,br=data[1],
		data[2],data[3],data[4]
	if (tl==255) tl=nil
	if (tr==255) tr=nil
	if (bl==255) bl=nil
	if (br==255) br=nil
	
	if tl or tr or bl or br then
		return norm_pot({
			tl=tl,
			tr=tr,
			bl=bl,
			br=br,
		})
	end
end
-->8
--machines

--adds a machine at the given
--world coordinates
function add_mach(typ,x,y)
--	local data=mach_data[typ]
	local name,w,h,price,desc,
		min_count,container,cond,
		proc=unpack(mach_data[typ])
	local m={
		typ=typ,
		x=x,y=y,
		ox=0,oy=0,
		name=name,
		w=w*16,h=h*16,
		lw=w,lh=h,
		draw=mach_draw,
		prog=0,
		max_prog=120,
		min_count=min_count,
		condition=conditions[cond],
		process=processes[proc],
		ready={},
		frame=0,
	}
	if container=="true" then
		m.pots={}
	end
	
	add(machines,m)
	mach_count[typ]+=1
	
	if name=="dynamo" then
		m.glow=0
		half_box(m)
	elseif name=="editor" then
		editor,m.h=m,8
	elseif name=="bed" then
		bed,m.h,m.oy=m,8,24
	elseif name=="nest" then
		half_box(m)
		m.bird=add_bird(x+4,y)
	elseif name=="treadmill" then
		m.w,m.h=0,0
	elseif name=="battery" then
		capacity+=480
	end

	return m
end

--gets the machine at the given
--world coordinates
function get_mach(x,y)
	for m in all(machines) do
		local x2,y2=m.x+m.lw*16-1,
			m.y+m.lh*16-1
		if  mid(m.x,x2,x)==x
		and mid(m.y,y2,y)==y then
			return m
		end
	end
end

--gets the machine at the given
--location, along with the index
--of the cell w/in the mach, and
--the pot at that index
function get_m_pot_ind(x,y)
	local m=get_mach(x,y)
	if (not m or not m.pots) return m
	--has to be this way. can't
	--add first then divide
	local ind=m.lw*(y\16-m.y\16)+
		(x\16-m.x\16)+1
	return m,m.pots[ind],ind
end

--trades potions w the
--machine at x,y
function swap_pots(x,y)
	local m,pot,ind=get_m_pot_ind(x,y)
	if m.name=="counter"
	and cur_cust then
		local price=m.price
	
		--player buys a potion
		if pot and not hold
		and money>=price then
			money-=price
			m.trade=not m.trade
			
		--player sells a potion
		elseif not pot
		and pots_match(hold,m.offer_pot) then
			money+=price
			m.trade=not m.trade
		else
			return
		end
	end
	
	if m.pots then
		m.pots[ind]=hold
		hold=pot
		m.prog=0
		if (m.pots or hold) sfx(hold and 3 or 4)
	end
end

function save_mach(m)
	local data,x,y={},
		world_2_lab(m.x,m.y)
	data[1]=m.typ
	data[2]=(x<<4)+y
	if m.pots then
		local ind=3
		for i=1,m.lw*m.lh do
			local pot_data=save_pot(m.pots[i])
			for j=1,4 do
				data[ind]=pot_data[j]
				ind+=1
			end
		end
	end
	return data
end

function do_treadmill(m)
	local dynamos=0
	for i=1,4 do
		local m=get_mach(m.x+dirx[i]*16,
			m.y+diry[i]*16)
		if m and m.name=="dynamo" then
			dynamos+=1
		end
	end
	power+=4*dynamos
	웃.frame=1
	m.frame=(m.frame+1)%4
end

function draw_dynamo(m)
	pal()
	local x,y,cols=m.x,m.y,
		split"2,14,7"
	for i=1,3 do
		local r=m.glow*(5.85-1.05*i+
			sin(time()*2.5)*.8)
		for _x=3,11,8 do
			circfill(x+_x,y+2,r,cols[i])
		end
	end
end

function draw_mach_body(typ,x,y,bp,f)
	pal()
	--bed
	if (typ==15 and not bp) palt(6,true)
	local sprs=bp and blup_sprs[typ] or mach_sprs[typ]
	local data=mach_data[typ]
	local ind,f=1,(not bp and f) or 0
	for ty=0,2*data[3]-1 do
		for tx=0,2*data[2]-1 do
			spr(sprs[ind]+f*2,x+8*tx,y+8*ty)
			ind+=1
		end
	end
	
	--front label
	if bp then
		pal(split"7,2,3,4,5,6,7,8,9,10,11,12,6,14,15")
		palt(6,true)
	end
	if data[10]>0 then
		sspr(data[10],data[11],9,7,
			x+data[12],y+data[13])
	end
end

function draw_mach(m,bp)
	local mx,my,data=m.x,m.y,
		mach_data[m.typ]
	
	if m.name=="dynamo" then
		draw_dynamo(m)
	end

	draw_mach_body(m.typ,mx,my,bp,
		m.frame)
	
	if bp then return end

	--indicator leds
	for i=1,3 do
		local led_x,led_y=
			unpack(data,i*2+12)
		if led_x!=0 or led_y!=0 then
			pset(mx+led_x,my+led_y,
				m.ready[i] and 8 or 5)
		end
	end
	
	--battery leds
	if m.name=="battery" then
		for i=1,4*charge/capacity+sin(time())/2+.5 do
			pset(m.x+2,m.y+15-i*2,8)
		end
	end
	
	--potions in machines
	if m.pots then
		for py=0,m.lh-1 do
			for px=0,m.lw-1 do
				local pot=m.pots[px+py*m.lw+1]
				if pot then
					sspr(pot.s*8,32,8,7,
						mx+4+px*16,my+py*16)
				end
			end
		end
	end
	
	--new mach unlocked
	if m.name=="editor"
	and new_mach then
		draw_new_mach(m.x+9,m.y-3)
	end
		
	--debug stuff
	--print(m.typ,m.x,m.y,8)
end

--wrapper function to be the
--machine's :darw() call
function mach_draw(m)
	draw_mach(m,_upd==update_editor)
end

function is_empty(m)
	if (not m.pots) return true
	for i=1,4 do
		if (m.pots[i]) return false
	end
	return true
end

function draw_new_mach(x,y)
	local anim,yoff=
		split0("189,189,189,189,189,189,189,189,189,189,189,189,190,190,190,190,189,191,189",189),
		split0"0,0,0,0,0,0,0,0,0,0,0,0,-1,-3,-3,-1,0,0,0"
	local f=⧗%(2*#anim)\2
	spr(anim[f],x,y+yoff[f])
end
-->8
--hud and ui

function show_dia(ind)
	cur_dia=ind
	dia_char=0
	_upd=update_dia
	sel=1
	sfx"11"
end

function update_dia()
	if dia_y>dia_y_targ then
		dia_y=lerp(dia_y,dia_y_targ,.4,1)
	else
		dia_char+=1
	end
	
	local choices=dia_actions[cur_dia]
	
	if choices then
		if btnp"0" then
			sel=max(sel-1,1)
		elseif btnp"1" then
			sel=min(sel+1,#choices)
		end
	end

	if btnp"4" then
		if dia_char<#dia_table[cur_dia] then
			dia_char=#dia_table[cur_dia]
		elseif choices then
			choices[sel]()
		else
			cur_dia+=1
			dia_char=0
		end
	end
end

function close_dia(new_upd)
	dia_page,dia_text,_upd=1,"",new_upd
	sfx"4"
end

function draw_dia()
	rrectfill2(0,dia_y,128,34,13)
	rrectfill2(0,dia_y+1,128,34,6)
	if not cur_dia then return end
	
	local text,choices=
		sub(dia_table[cur_dia],1,dia_char),
		choi_text[cur_dia]
	
	print(text,7,dia_y+3,1)
	
	if choices
	and dia_char>#text then
		local inc=128/(1+#choices)
		for i=1,#choices do
			local t,c="  ",13
			if sel==i then
				c=1
				t="🅾️"
			end
			printc(t..choices[i],
				inc*i,dia_y+24,c)
		end
	end
end

function update_title()
	--fade back in
	if fade_perc>0 then
		fade_perc=max(fade_perc-0.04,0)
	end
	
	dia_y=lerp(dia_y,128,.4,1)
	
	if btnp"4" then
		_upd=update_game
		_drw=draw_game
		start_day()
	end
	
	--background animation
	for i=1,15 do
		local ln=bkg[i]
		
		ln.x+=ln.dx
		if ln.x>128+#ln*8
		or ln.x<-8-#ln*8 then
			ln.x-=(128+#ln*8)*ln.dx
			ln.y=flr(rnd"16")*8
		end
		
		ln.y+=ln.dy
		if ln.y>128+#ln*8
		or ln.y<-8-#ln*8 then
			ln.y-=(128+#ln*8)*ln.dy
			ln.x=flr(rnd"16")*8
		end
	end
end

function draw_title()
	cls(7)
	
	for i=0,15 do
		pal(i,lpal[i])
		--if (i!=7) pal(i,6)
	end
	palt(7,true)
	
	for i=1,15 do
		local ln=bkg[i]
		local x,y=ln.x,ln.y
		for j=1,#ln do
			spr(ln[j],x-j*ln.dx*8,
				y-j*ln.dy*8)
		end
	end
	pal()
	
	oprintc("\014tiny alchemist",
		64,32,1,7)
	oprintc("press 🅾️ to start",
		64,96,1,7)
	oprint(version,1,1,6,7)
		
	do_fade()
end

function draw_banner(txt_col,bkg_col)
	camera()
	pal()
	rrectfill2(0,-1,128,24,13)
	rrectfill2(0,-1,128,23,bkg_col)
	
	print(toptext,2,2)
	print(🅾️text,2,9)
	print(❎text,2,16)
	
	print_money(txt_col)
	printr(txt_col.."\14level "..
		flr(level),127,8)
	line(87,14,125,14,13)
	line(87,14,87+(level%1)*40,
		14,txt_col)
	print_time(txt_col)
--	print(level,10,20,8)
end

--prints formatted money
--col is a string control codes
function print_money(col)
	local m_str=col..tostr(flr(show_money))
	while #m_str<9 do
		m_str="0"..m_str
	end
	printr("\014$\fd"..m_str,127,1,col)
end

--col is a string control code
function print_time(col)
--	printr(col.."\014day "..day,127,9)
	if open then
		local hours,minutes=
			col.."\14"..(tme\60)..":",
			flr(tme%60)
		if minutes<10 then
			minutes="0"..minutes
		end
		printr(hours..minutes,127,16)
	else
		printr(col.."\14closed",127,16)
	end
end
-->8
--file i/o

function save_game()
	poke2(0x5e00,money)
	poke4(0x5e02,level)
	--todo: character appearance
	-- 0x5e06-0x5e08
	local data=save_pot(hold)
	for i=0,3 do
		poke(0x5e09+i,data[i+1])
	end
	poke(0x5e0d,(lab_w<<4)+lab_h)
	--unused:0x5e0e-0x5e0f

	--wipe the existing mach data
	for i=0,239 do
		poke(0x5e10+i,0)
	end

	--save all the current machines
	local addr=0x5e10
	for i=0,#machines-1 do
		local m=machines[i+1]
		if m.name!="counter"
		and m.name!="register" then
			local data=save_mach(m)
			for j=1,#data do
				poke(addr,data[j])
				addr+=1
			end
		end
	end
end

function load_game()
	--gamestate info
	money=%0x5e00
	show_money=money
	level=$0x5e02
	
	--todo: load character appearance
	
	--holding potion
	data={}
	for i=0,3 do
		data[i+1]=@(0x5e09+i)
	end
	if data[1]!=255 then
		hold=load_pot(data)
	end
	
	--lab size
	d=@0x5e0d
	lab_w,lab_h=flr(d>>4),d%16
	fill_invalid_tiles()
	
	--machines
	local addr=0x5e10
	while true do
		local typ=@addr
		if (typ==0) break
		addr+=1
		
		local pos=@addr
		addr+=1
		local x,y=lab_2_world(
			flr(pos>>4),pos%16)
		local m=add_mach(typ,x,y)
		
		--pots in machine
		if m.pots then
			for pot_ind=1,m.lw*m.lh do
				local pot_data={}
				for j=1,4 do
					add(pot_data,@addr)
					addr+=1
				end
				m.pots[pot_ind]=load_pot(pot_data)
			end
		end
	end
end

__gfx__
77ccc77733333337777744777447777799999997977777977555777777755577877777777777778788888887888888877ee7ee777ee77777777777777777ee77
7ccccc773333333777774447444777777999997799777997775557575755577788777777777778877888888788888877eeeeeee7eeee7777777e7777777eeee7
ccccccc73333333777744447444477777799977799979997755555575555557788877777777788877788888788888777eeeeeee7eeeee77777eee77777eeeee7
ccccccc733333337774447777744477777797777999999975555555755555557888877777778888777788887888877777eeeee777eeeee777eeeee777eeeee77
ccccccc7333333374444777777744447779997779997999755555577755555578888877777888887777788878887777777eee777eeeee777eeeeeee777eeeee7
7ccccc773333333744477777777744477999997799777997575557777755575788888877788888877777788788777777777e7777eeee7777eeeeeee7777eeee7
77ccc7773333333774477777777744779999999797777797777555777555777788888887888888877777778787777777777777777ee777777ee7ee777777ee77
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
71111177717771777111117771111177bbbb7777777777b7777bbbb7b777777777ddd77777dd777777dd7777777dd77777ddd77777dd7777777dd777777dd777
111777171777771717771117111111177bbbb77777bbbbb777bbbb77bbbbb7777ddddd777ddd7777777d7777777ddd777ddddd777ddd7777777d7777777ddd77
117777771777771777777117117771177bbbbb777bbbbbb77bbbbb77bbbbbb77ddddddd7dddd77d7777d7777777dddd7ddddddd7dddd7777777d7777d77dddd7
117777771777771777777117177777177bbbbb77bbbbbbb77bbbbb77bbbbbbb7ddddddd7ddddddd7ddddddd7ddddddd7ddddddd7ddddddd7ddddddd7ddddddd7
117777771177711777777117177777177bbbbb77bbbbbb777bbbbb777bbbbbb7777d7777dddd7777ddddddd7d77dddd7777d7777dddd77d7ddddddd7777dddd7
1117771711111117177711171777771777bbbb77bbbbb7777bbbb77777bbbbb7777d77777ddd77777ddddd77777ddd77777d77777ddd77777ddddd77777ddd77
71111177711111777111117771777177777bbbb7b7777777bbbb7777777777b7777dd77777dd777777ddd777777dd77777dd777777dd777777ddd777777dd777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
00444400044444400044024000444400000000000000000000000044044000000044440004444440004402400044440000000000000000000000004404400000
04442240022222200442244004444440000000000044440000444442444400000444224002222220044224400444444000000000004444000044444244440000
44222224444444444444444404222224004444000444224004422222444244004422222444444444444444440422222400444400044422400442222244424400
422221e00eee71e00eee71e00eee71e00f4471f0022271f0042e71e0022e71f0422221e00eee71e00eee71e00eee71e00f4471f0022271f0042e71e0022e71f0
222e71f00eff71f00eff71f00eff71f00fff71f00eef71f00eef71f002ef71f0222e71f00eff71f00eff71f00eff71f00fff71f00eee71f00eef71f002ef71f0
0ffffff00ffffff00ffffff0bbfffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff00ffffff0bbfffff00ffffff00ffffff00ffffff00ffffff0
0fffff003bbfff000fffff0033bfff000fffff000fffff000fffff000bbbffb00fffff003bbfff000fffff0033bfff000fffff000fffff000fffff000bbbffb0
0bb88b00b33b8b0008888800bb3b8bb00bb88b000bbb33000bbb3b00b33383300bb88b00b33b8b0008888800bb3b8bb00bb88b000bbb33000bbb3b00b3338330
b33b88b0bbb3883008888800bbb38830b33b88b0bbb38830bbb383b0bbb38830b33b88b0bbb3883008888800bbb38830b33b88b0bbb38830bbb383b0bbb38830
bb3b88b0bbb3883008888800bbb38830bb3b88b0bbb38830bbb38830bbb38830bb3b88b0bbb3883008888800bbb38830bb3b88b0bbb38830bbb38830bbb38830
bbbb88b0bbb3883008888800bbb38830bbbb88b0bbb38830bbb38830bbb38830bbbb88b0bbb3883008888800bbb38830bbbb88b0bbb38830bbb38830bbb38830
3bbb88b0bbb3883008888800bb388830bbbb88b0bbb38830bbb38830bb3888303bbb88b0bbb3883008888800bb388830bbbb88b0bbb38830bbb38830bb388830
0333cc30bb3ccc300ccccc00b3cccc30bbbbccb0bbb3cc30bbb3cc30b3cccc000333cc30bb3ccc300cccccc0b3ccccc0bbbbccb0bbb3cc30bbb3ccc0b3ccccc0
0c000c0033000c000c000c00b3333c00333b0cb033300c30bbb33c30b3333c000c00000c3300000c0c00000cb333330c333b00bc3330003cbbb3333cb333330c
0c000c000c000c000c000c003c333c000c000c000c000c00bbb33c303c300c00c000000cc000000cc000000c3333300cc000000cc000000cbbb3333c3330000c
0c000c000c000c000c000c000c000c000c000c000c000c0033333c300c000c000000000000000000000000000000000000000000000000003333333000000000
00000000004440000044400000444000004440000044400000444000004440000044400000444000004440000044400000444000004440000044400000444000
00cc3000007770000077700000777000007770000077700000777000007770000077700000777000007770000077700000777000007770000077700000777000
0c7ccc00007070000070700000707000007070000070700000707000007070000070700000707000007070000070700000707000007070000070700000707000
07c3cc0007111700072227000777770007444700075557000733370007ccc700078887000799970007aaa70007bbb7000766670007ddd70007eee70007fff700
ccccc3c07171117072722270777777707474447075755570737333707c7ccc7078788870797999707a7aaa707b7bbb70767666707d7ddd707e7eee707f7fff70
cc3c3cc07111117072222170777776707444427075555170733335707cccc17078888270799994707aaaa9707bbbb37076666d707dddd5707eeee2707ffff970
3ccccc307111117072221170777766707444227075551170733355707ccc117078882270799944707aaa99707bbb33707666dd707ddd55707eee22707fff9970
0cc3c300077777000777770007777700077777000777770007777700077777000777770007777700077777000777770007777700077777000777770007777700
004440000000bb00000000b30000000000000700000000000006dd600330330056ddddddd000d000d000d0000077700000777000000000000000000000000000
0077700000bb33b000000b33007877000000076000000b30006d7d60333033305d000000000d000d000d000d0700070007000700000000000000000000000000
007070000b33b0300009a33007788880000076700000b30006d77d6033333330d00ddddd00d000d000d000d00700070007000700000000000000000000000000
0700070003044000009a9aa00888887000076700000b33006d777d6000333000d0d00d000d000d000d000d000700070007000700007000000000700000000000
70700070000220000a99a9a00877887006767600000b300006d77d6033333330d0d0d000d000d000d000d0000070700000707000077000000000770000000000
700000700004400009999990000ff000076760000bb33000006d7d6033303330d0dd000dddddddddd00d000d0700077777000700700700000007007000000000
700000700000200009a9a900000ff00000760000003300000006dd6003303300d0d000d0000000000dd000d07070706000707070706077777770007000000000
0777770000004000009990000000000000000000000000000000660000000000d0d00d00dddddddd00d00d007600060006000670760006000600067000000000
0000000000000000000000000000000000000000000000000000000000000000d000dd0dd000d000d0d0d0000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000d0d0d000d000dd0dd000d0000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000d00d0d00d000d0d0d000d00000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000d000d0d0d000d00d0d00d000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000d000dd0dd000d000d0d0d0000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000d0d0d000d000dd0dd000d0000000000000000077777777777777777777700
000000000000000000000000000000000000000000000000000000000000000000d00d0d00d000d0d0d000d00000000000000000706000600060006000600070
00000000000000000000000000000000000000000000000000000000000000000d000d0d0d000d00d0d00d000007777777770000760006000600060006000670
0000088000000880000000000000000000000000000000000000000000000000d0d0d000dddddddd00d0d0000070600060007000700060006000600060006070
0000414000004140000000000000000000000000000000000000000000000000d0dd000d000000000ddd000d0607000600070600700600060006000600060070
4400444944004449000000000000000000000000000000000000000000000000d0d000d0ddddddddddd000d00600777777700600677777777777777777777760
4444494044444940000000000000000000000000000000000000000000000000d0d00d000d000d000d000d000600000000000600600000000000000000000060
2999994029999940000000000000000000000000000000000000000000000000d0d0d000d000d000d000d0000060000000006000600000000000000000000060
2299944022999440000000000000000000000000000000000000000000000000d00ddddd000d000d000d000d0006666666660000600000000000000000000060
02222200022222000000000000000000000000000000000000000000000000005d00000000d000d000d000d00000000000000000066666666666666666666600
009090000900090000000000000000000000000000000000000000000000000056dddddd0d000d000d000d000000000000000000000000000000000000000000
06666666666666006666666677777777777777777777777777777777777777777777700000000000000000000766666666666700077777777777777777777700
66666666666666606666666666611166666661666666611166666666666666111116600000000000000000007666666666666670700600060006000600060070
66666666666666606666666666666666661166611666611166666116116661111111600000000000000000007666666666666670706000600060006000600070
66666666666666606666666666161616661161611666666666666116116666161616600000d000000000d0007666666666666670760006000600060006000670
6666666666666660666666666666666666116661166661116666611611666616161660000dd000000000dd007666ddddddd66670700060006000600060006070
6666ddddddd66660ddd66666666111666666616666666111666666666666666111666000dddd0000000dddd0766d1111111d6670700600060006000600060070
666d1111111d6660111d6666ddddddddddddddddddddddddddddddddddddddddddddd000ddddddddddddddd0766d1111111d6670706000600060006000600070
6666ddddddd66660ddd66666777777777777777777777777777777777777066616660000ddd777777777ddd07666ddddddd66670760006000600060006000670
666666666666666066666666616111666666111616666161666666666666066116660000d6766777777776d07d67777777776d70700060006000600060006070
6666666666666660dddddddd61166616666166611666611166666116116606111666000066767777777776607dd661111166dd70700600060006000600060070
6666666666666660dddddddd666666666666666666666666666666161666061111160000667777777777766078d611111116dd70706000600060006000600070
6666666666666660dddddddd66166611661166616666611166666116116606661116000066777777777776607dd661616166dd70760006000600060006000670
6666666666666660dddddddd66611161661611166666616166666666666606661166000066777777777776607dd661616166dd70700060006000600060006070
6666666666666660dddddddddddddddddddddddddddddddddddddddddddd06661666000066677777777766607dd666111666dd70700600060006000600060070
6666666666666660555555550000000000000000000000000000000000000000000000006666666666666660075ddddddddd5700706000600060006000600070
66666666666666600000000000000000000000000000000000000000000000000000000066666666666666600000000000000000760006000600060006000670
666666666666666066666666566666666666666d5666666600000000000066000660000062222222222222600007557075570000677777777777777777777760
6666666666666660dddddddd566666666666666d5666666600000000000066000660000028888888888888200007557775570000600000000000000000000060
6666666666666660dddddddd566666666666666d5666666600000000000766777667000088888888888888800076556665567000600000000000000000000060
6666666666666660dddddddd566666666666666d566666660000000000706600066070008888888888888880076d55d6d55d6700600000000000000000000060
6666666666666660dddddddd566666666666666d5666666600000000007000000000700088888888888888800766dd666dd66700600000000000000000000060
6666ddddddd66660dddddddd566666666666666d5666dddd000000000067777777776000888888888888888007d666666666d700600000000000000000000060
666d1111111d6660dddddddd5666666666666665566d1111000000000060000000006000888888888888888007ddddddddddd000066666666666666666666600
6666ddddddd66660dddddddd56666666666666605666dddd0000000000600007000060008888888888888880005d6661666dd000000000000000000000000000
d6666666666666d0ddddddddd56665ddd5ddd5dd5d666666000000000060007700006000888888888888888000dd6611666dd000000000000082800000000000
ddddddddddddddd0dddddddddd555ddddd555ddd5ddddddd0000000000600777000060002888888888888820005d6111666dd000008280000082800000000000
ddddddddddddddd0ddddddddd5ddd5ddd56665dd5ddddddd000000000060077777006000822222222222228000dd6111116dd000088288000088800000000000
ddddddddddddddd0dddddddd5ddddd55566666555ddddddd0000000000600007770060008888888888888880005d6661116dd000088888000082800088828880
ddddddddddddddd0ddddddddd5ddd5ddd56665dd5ddddddd000000000060000770006000888888888888888000dd6661166dd000088288000088800088888880
ddddddddddddddd0dddddddddd555ddddd555ddd5ddddddd000000000060000700006000d8888888888888d0005d6661666dd000028882000088800088828880
055555555555550055555555d56665ddd5ddd5dd5ddddddd00000000000666666666000055577777777755500005ddddddd50000002220000022200022222220
000000000000000000000000566666555ddddd555ddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001666661000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001666661000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001616161000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001611161000000000000000000000000000000000
05555555555555500555555555555550055555555555555005555555555555500000000000000000000000001111111000000000000000000000000000000000
5ddd5ddd5ddd5dd555ddd5ddd5ddd5d55d5ddd5ddd5ddd5d5dd5ddd5ddd5ddd50000000000000000000000001661661000000000000000000000000000000000
5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd50000000000000000000000001666661000099999999900000000000000000000
5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd50000000000000000000000001116111000944444444490000000000000000000
5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd500000000000000000000000016616610099a2422442a99000000000000000000
5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd5dddd5ddd5ddd5ddd50000000000000000000000001111111009a9aaaaaaa9a4000000000000000000
555555555555555dd55555555555555dd55555555555555dd55555555555555500000000000000000000000016666610049a9a9a9a9a94000000000000000000
5dd51111111156d55dd5111111115d6556d5111111115dd55d65111111115dd50000000000000000000000001666661000494499494940000000000000000000
5d65111111115dd556d5111111115dd55dd5111111115d655dd51111111156d50000000000000000000000001116161000022222222200000000000000000000
05555555555555500555555555555550055555555555555005555555555555500000000000000000000000000011611000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111111000000000000000000000000000000000
00555000005550000000000000000000566666666666666006666666666666000000000000000000000000001666661000000000000000000000000000000000
05655500056555000000000000000000567777666666666066111111111116600000000000000000000000001666661000000000000000000000000000000000
05555500055555000000000000000000565ddd7666666660661d777d17d716600000000000000000000000001116161000000000000000000000000000000000
05555500055555000000000000000000565d8dd77777666066171117117d16600000000000000000000000001666611000000000000000000000000000000000
00555000005550000000000000000000565ddd15d8d17660661d777d111116600000000000000000000000001111111000000000000000000000000000000000
00050000000500000000000000000000565d1dd5dd1d566066111111d77d16600000000000000000000000001666661000000000000000000000000000000000
76555666665556700000000000000000565ddd85d1d8566066177d711d1116600000000000000000000000001666661000000000000000000000000000000000
66656666666566600000000000000000561111d5dd8d566066111111111116600000000000000000000000001111161000000000000000000000000000000000
66d5d66666d5d660000000000000000056155515d1d15660d6666666666666d01111111111100000000000001666611000000000000000000000000000000000
666d6666666d666000000000000000005615555111115660ddddddddddddddd01d777d17d7100000000000001111111000000000000000000000000000000000
d6666666666666d000000000000000005615555555551660ddddddddddddddd0171117117d100000000000001666661000000000000000000000000000000000
ddddddddddddddd000000000000000005611111111111660ddddddddddddddd01d777d1111100000000000001666661000000000000000000000000000000000
ddd8d8d8d8d8ddd000000000000000005666666666666660ddddddddddddddd0111111d77d100000000000001611161000000000000000000000000000000000
ddddddddddddddd000000000000000005666666666666660ddddddddddddddd0177d711d11100000000000001166611000000000000000000000000000000000
05555555555555000000000000000000566666666666666005555555555555000000000000000000000000000111110000000000000000000000000000000000
00000000000000000000000000000000566666666666666000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66661666dd666dd666dd666dd666dd66611666116666666666666666666666666666666666666666666666666666666661161611116111161161666666611666
6661116dd6d6dd6d6dd6d6dd6d6dd6d6111661161666666666666666666666666666666666666666666666666666666661161611666116661161666666111666
6661666dd6d6dd6d6dd6d6dd6d6dd6d6611661161666666666666666666666666666666666666666666666666666666661161611166111661116666666611666
6661116dd6d6dd6d6dd6d6dd6d6dd6d661166116166666ddddddddd6666666666666666666666666666666666666666661111611666116661161666666611666
66661666dd666dd666dd666dd666dd661111661166666dd6666666dd666666666666666666666666666666666666666661111611116111161161666666111166
666666666666666666666666666666666666666666666d666666666d666666666666666666666666666666666666666666666666666666666666666666666666
666886886668868866688688666886886668868866666d666666666d666666666666666666666666666666666666666666666666666666666666666666666666
668888888688888886888888868888888688888886666d666666666d666666666666666666666666666666666666666666111611616111661116611166116166
668888888688888886888888868888888688888886666d666666666d666666666666666666666666666666666666666661166611616116161161611616116166
666888886668888866688888666888886668888866666d666666666d666666666666666666666666666666666666666661111611616116161161611116111166
666688866666888666668886666688866666888666666d666666666d666666666666666666666666666666666666666666611611616116161161611616611666
666668666666686666666866666668666666686666666d666666666d666666666666666666666666666666666666666661116661116116161116611616611666
666666666666666666666666666666666666666666666d666666666d666666666666666666666666666666666666666666666666666666666666666666666666
66666d6666666d6666666d6666666d6666666d6666666dd6666666dd666666666666666666666666666666666666666666666666666666666666666666666666
6666ddd66666ddd66666ddd66666ddd66666ddd6666666ddddddddd6666666666666666666666666666666666666666666666661166611666116666116111166
66ddddddd6ddddddd6ddddddd6ddddddd6ddddddd666666666666666666666666666666666666666666666666666666666666611166116166116661116116666
666ddddd666ddddd666ddddd666ddddd666ddddd6666666666666666666666666666666666666666666666666666666666666661166116166666616116111166
666d666d666d666d666d666d666d666d666d666d6666666666666666666666666666666666666666666666666666666666666661166116166116611116661166
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666611116611666116666116111666
d666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666d
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dd55566666555ddddd555ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
d5ddd56665ddd5ddd5dd566666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
5ddddd555ddddd555ddd566666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
65ddd5ddd5ddd56665dd566666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
66555ddddd5556666655566666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
65ddd5ddd5ddd56665dd566666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
5ddddd555ddddd555ddd566666666666666ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
d5ddd56665ddd5ddd5dd566666666666666555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
dd55566666555ddddd55566666666666666777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
d5ddd56665ddd5ddd5dd566666666666666776666666666666777666666666666677766666666666667776666666666666777666666666666666666666666666
5ddddd555ddddd555ddd566666666666666767777777777777676777777777777767677777777777776767777777777777676666666666666666666666666666
65ddd5ddd5ddd56665dd566666666666666767777777777777676777777777777767677777777777776767777777777777676666666666666666666666666666
66555ddddd5556666655566666666666666767777777777777676777777777777767677777777777776767777777777777676666666666666666666666666666
65ddd5ddd5ddd56665dd566666666666666767777777777777676777777777777767677777777777776767777777777777676666666666666565656666666666
5ddddd555ddddd555ddd566666666666666767777777777777676777777777777767677777777777776767777777777777676666ddddddd666666666ddddddd6
d5ddd56665ddd5ddd5dd56666666666666676777777777777767677777777777776767777777777777676777777777777767666d1111111d6666666d1111111d
dd55566666555ddddd55566666666666666767777777777777676777777777777767677777777777776767777777777777676666ddddddd666666666ddddddd6
d5ddd56665ddd5ddd5dd56666666666666676777777777777767677777777777776767777777777777676777777777777767d666666666677777777766666666
5ddddd555ddddd555ddd56666666666666676777777777777767677777777777776767777777777777676777777777777767ddddddddddd666666666dddddddd
65ddd5ddd5ddd56665dd56666666666666676777777777777767677777777777776767777777777777676777777777777767ddddddddddd661161166dddddddd
66555ddddd555666665556666666666666676777777777777767677777777777776767777777777777676777777777777767ddddddddddd661161166dddddddd
65ddd5ddd5ddd56665dd56666666666666676777777777777767677777777777776767777777777777676777777777777767ddddddddddd661161166dddddddd
5ddddd555ddddd555ddd56666666666666676777777777777767677777777777776767777777777777676777777777777767ddddddddddd666666666dddddddd
d5ddd56665ddd5ddd5dd5666666666666667766666666666667776666666666666777666666666666677766666666666667775555555555ddddddddd55555555
dd55566666555ddddd55566666666666666777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
d5ddd56665ddd5ddd5dd566666444666666776666666666666777666666666666666666666666666667776666666666666777666666666666677766666666666
5ddddd555ddddd555ddd566666777666666767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd566666767666666767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
66555ddddd5556666655566667888766666767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd566678788876666767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
5ddddd555ddddd555ddd566678888276666767777777777777676666ddddddd666666666ddddddd6666767777777777777676777777777777767677777777777
d5ddd56665ddd5ddd5dd566d7888227d66676777777777777767666d1111111d6666666d1111111d666767777777777777676777777777777767677777777777
dd55566666555ddddd555666ddddddd6666767777777777777676666ddddddd666666666ddddddd6666767777777777777676777777777777767677777777777
d5ddd56665ddd5ddd5dd566666666666666767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
5ddddd555ddddd555ddd561666116611166767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd511161116666116767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
66555ddddd5556666655516666116661116767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd511166116666116767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
5ddddd555ddddd555ddd561661111611166767777777777777676666666666666666666666666666666767777777777777676777777777777767677777777777
d5ddd56665ddd5ddd5dd566666666666666776666666666666776666666666666666666666666666666776666666666688777666666666666677766666666666
dd55566666555ddddd55566666666666666777777777777777776666666666666666666666666666666777777777777414777777777777777777777777777777
d5ddd5644524d5ddd5dd566666444666666776666666666666776666666666666666666666666666666776666664466444977666666666666677766666666666
5ddddd442244dd555ddd566666777666666767777777777777676666666666666666666666666666666767777774444494676666666666666667677777777777
65ddd4444444456665dd566666767666666767777777777777676666666666666666666666666666666767777772999994676666666666666667677777777777
66555dddd70d56666655566667bbb766666767777777777777676666666666666666666666666666666767777772299944676666666666666667677777777777
65ddd5dcc70cd56665dd56667b7bbb76666767777777777777676666666666666666666666666666666767777777222227676666666666666667677777777777
5dddddccccccdd555ddd56667bbbb376666767777777777777676666ddddddd666666666ddddddd6666767777777797977676666ddddddd66667677777777777
d5ddd5cccccdd5ddd5dd566d7bbb337d66676777777777777767666d1111111d6666666d1111111d66676777777777777767666d1111111d6667677777777777
dd5556eeeee55ddddd555666ddddddd6666767777777777777676666ddddddd666666666ddddddd6666767777777777777676666ddddddd66667677777777777
d5ddd5eeeeedd5ddd5dd56666666666666676777777777777767d66666666666666666666666666666d76777777777777767d6677777777766d7677777777777
5dddddeeeeeddd555ddd56666166611166676777777777777767ddddddddddddddddddddddddddddddd76777777777777767ddd666666666ddd7677777777777
65ddd5eeeeedd56665dd56661116116166676777777777777767ddddddddddddddddddddddddddddddd767777777777777675dd661161166ddd7677777777777
66555deeeee55666665556661666111166676777777777777767ddddddddddddddddddddddddddddddd76777777777777767ddd666161666ddd7677777777777
65ddd511111dd56665dd56661116161166676777777777777767dddddddaaaadddddddddddddddddddd76777777777777767ddd661161166ddd7677777777777
5ddddd155d1ddd555ddd56666166111666676777777777777767dddddda99aaaddddddddddddddddddd76777777777777767ddd666666666ddd7677777777777
d5ddd516651dd5ddd5dd5666666666666667766666666666667775555a99999aa55555555555555555777666666666666677755ddddddddd5577766666666666
dd55561666155ddddd5556666666666666677777777777777777777777d09999a777777777777777777777777777777777777777777777777777777777777777
d5ddd56665ddd5ddd5dd56666644466666677666666666666677766666c07d999677766666666666667776666666666666777666666666666677766666666666
5ddddd555ddddd555ddd56666677766666676666666666666667677777cccccff767677777777777776767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd566666767666666766666666666666676777777cccfee767677777777777776767777777777777676777777777777767677777777777
66555ddddd5556666655566667fff76666676666666666666667677777ff3feff767677777777777776767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd56667f7fff7666676666666666666667677777e33efff767677777777777776767777777777777676777777777777767677777777777
5ddddd555ddddd555ddd56667ffff97666676666666666666667677777e33efff767677777777777776767777777777777676777777777777767677777777777
d5ddd56665ddd5ddd5dd566d7fff997d66676666666666666667677777e33efff767677777777777776767777777777777676777777777777767677777777777
dd55566666555ddddd555666ddddddd666676666666666666667677777e333eff767677777777777776767777777777777676777777777777767677777777777
d5ddd56665ddd5ddd5dd56666666666666676666666666666667677777e8888ef767677777777777776767777777777777676777777777777767677777777777
5ddddd555ddddd555ddd5666616661166667666666666666666767777778eeeef767677777777777776767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd5666111611116667666666666666666767777778eee8e767677777777777776767777777777777676777777777777767677777777777
66555ddddd5556666655566616666611666766666666666666676777777877787767677777777777776767777777777777676777777777777767677777777777
65ddd5ddd5ddd56665dd566611166116666766666666666666676777777777777767677777777777776767777777777777676777777777777767677777777777
5ddddd555ddddd555ddd566661661111666766666666666666676777777777777767677777777777776767777777777777676777777777777767677777777777
d5ddd56665ddd5ddd5dd566666666666666776666666666666777666666666666677766666666666667776666666666666777666666666666677766666666666
dd55566666555ddddd55566666666666666777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
d5ddd56665ddd5ddd5dd566666666666666776666666666666777766666666666777766666666666667776666666666666777666666666666677765556666655
5ddddd555ddddd555ddd567777666666666767777777777777677666666666666677677777777777776766666666666666676777777777777767656555777565
65ddd5ddd5ddd56665dd565ddd766666666767777777777777677666666666666677677777777777776766666666666666676777777777777767655555777555
66555ddddd5556666655565d8dd77777666767777777777777677666666666666677677777777777776766666666666666676777777777777767655555777555
65ddd5ddd5ddd56665dd565ddd15d8d1766767777777777777677666ddddddd66677677777777777776766666666666666676777777777777767675557777755
5ddddd555ddddd555ddd565d1dd5dd1d56676777777777777767766d1111111d667767777777777777676666ddddddd666676555555555555557677577777775
d5ddd56665ddd5ddd5dd565ddd85d1d856676777777777777767766d1111111d66776777777777777767666d1111111d66675ddd5ddd5ddd5dd5765556666655
dd55566666555ddddd55561111d5dd8d566767777777777777677666ddddddd6667767799999999977676666ddddddd666675ddd5ddd5ddd5ddd666566666665
d5ddd56665ddd5ddd5dd56155515d1d1566767777777777777677d67777777776d776794444444449767d6677777777766d75ddd5ddd5ddd5ddd66d5d66666d5
5ddddd555ddddd555ddd561555511111566767777777777777677dd661111166dd77699a2422442a9967ddd666111616ddd75ddd5ddd5ddd5ddd666d6666666d
65ddd5ddd5ddd56665dd5615555555551667677777777777776775d611111116dd7769a9aaaaaaa9a4675dd661666116ddd75ddd5ddd5ddd5dddd66666666666
66555ddddd5556666655561111111111166767777777777777677dd661616166dd77649a9a9a9a9a9467ddd666666666ddd7555555555555555ddddddddddddd
65ddd5ddd5ddd56665dd566666666666666767777777777777677dd661616166dd776749449949494767ddd611666166ddd75dd51111111156d5ddd8d8d8d8d8
5ddddd555ddddd555ddd566666666666666767777777777777677dd666111666dd776772222222227767ddd616111666ddd75d65111111115dd5dddddddddddd
d5ddd56665ddd5ddd5dd56666666666666677666666666666677775ddddddddd57777666666666666677755ddddddddd55777555555555555557755555555555
dd55566666555ddddd55566666666666666777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
d5ddd56665ddd5ddd5dd56dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
5ddddd555ddddd555ddd5d1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
65ddd5ddd5ddd56665ddd11ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
66555ddddd5556666655d1d11d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d11
65ddd5ddd5ddd56665ddd1d1d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111
5ddddd555ddddd555dddd1dd111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d
d5ddd56665ddd5ddd5ddd1d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d1
dd55566666555ddddd55d1d11d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d11
d5ddd56665ddd5ddd5ddd1d1d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111
5ddddd555ddddd555dddd1dd111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d
65ddd5ddd5ddd56665ddd1d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d1
66555ddddd5556666655d1d11d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d11
65ddd5ddd5ddd56665ddd1d1d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111
5ddddd555ddddd555dddd1dd111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d
d5ddd56665ddd5ddd5ddd1d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d1
dd55566666555ddddd55d1d11d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d111d11

__map__
b3b4b3b4b3b4b3b4b3b46a6969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4785959595959595959595959595959595a6969696969696969696969696969696969696969690000000000000000000000000000000000000000000000000000785959595959595959595959595959595a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4b5a2a2a2a2a2a2a2a2a2a2a2a2a2a2a26a6969696969696969696969696969696969696969690000000000000000000000000000000000000000000000000000000000000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a3a4b2b2b2b2b2b2b2b2b2b2b2b2b2b26a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4a39100000000000000000000000000006a69696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000009d9f00000000000000000000000000006a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4587979797979797979797979797979797a6969696969696969696969696969696969696969690000000000000000000000000000000000000000000000000000587979797979797979797979797979797a69696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b46a6969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b46a6969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b46a6969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
b3b4b3b4b3b4b3b4b3b4696969696969696969696969696969696969696969696969696969696969696969696969696900000000000000000000000000000000000000000000000000006a6969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969696969
__sfx__
91020a00106100000000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c610
540200000451004510045100451004520045200452004520045300453004530045300454004540045400454004540045400454004540045400453004530045300453004520045200452004510045100451004510
0106000017623197451a6231b755106130e7550000028040315453153531525315153100031000310000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400001501017021220400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010400002204017021150100000000001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001
000200003571030510305303052535710305103053030525357103051030530305253571030510305303053030530305203052030515005000050000500005000050000500005000050000500000000000000000
010200002a7102a510325203253000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00060000136300f625315001d630236102e5403303033020330150000000001000010000100001000010000100001000010000100001000010000100001000010000100001000010000000000000000000000000
500600001513010140001002b2402c1412c1312a11125115261000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
500700001212716147131271213716127111170f11500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
910100000863500605086050060508605006050060500605006050060500605006050863500605006050060500605006050060500605006050060508635006050060500605006050060500605006050060500605
000400001204014021160211a0312c0511a0001d00123000000000000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001
c01800001105011040110451505015040150451306013050130550c0600c0500c0400c045000000c0500c0400c045130501304013045150601505015055110601105011040110450000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e00000907515510155150000000655000000907526515090750000000000185150065517515000001851509075135101351500600006550000009075105000907500000000000060000645006550066500675
010e00002175521755000002675526755000002475524755000001f7551f755000002175521755217552175021750217552675026755000002475024755000002175021755267502675500000287402876028770
010e00002675426751267550070000700007002475424751247550070021754217550070000700247542475521750217552675526755267552675026750267552875028750287502875500700007000070000000
010e00002675426751267550070000700007002475424751247550070021754217550070000700247542475521754217552675424750217501d7501d7501d7551c7501c7501c7501c75500700007001c7541d751
000e000021540215352150021540215350000021540215351a5401a545245001a5401a545245001a5401a54524550245450000000000000000000026552265422654226545000000000000000000000000000000
000e0000090751551015515000000065500000090752651509075000000000018515006551751500000185151f5301f5350000000600006550000021532215322153221535000000060000655000000000000600
010e00002153021525000000000000000000002654026535000002450124541245312353123531245402750024540245350000000000000000000026552265422654226535000000000000000000000000000000
000e0000215302152500000000000000000000265402653500000000002453500000235250000024535000001f5401f535000000000000000000001c5401c5350000000000000000000000000000000000000000
000e00000907515510155150000000655000000907526515090750000000000185150065517515000001851509075135101351500600006550000009075105000907500000000000060000655000000000000600
__music__
01 3f3e4344
00 3c3d4344
00 3f3e4344
00 3c3b4344
00 3f3e4344
00 3c3d4344
00 3f3e4344
00 3c3b4344
00 3f3a4344
00 37394344
00 3f3a4344
00 37384344
00 3f3a4344
00 37394344
00 3f3a4344
02 37384344

