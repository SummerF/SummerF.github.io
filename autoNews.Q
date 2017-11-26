[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=940d9157-93ff-4a51-8d01-35c4aad0c764
Description=我的脚本1
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
//包坐标的变量
Global x1	
Global y1	
Global y2	

//任务坐标的变量
Global renwu1_x
Global renwu1_y
Global renwu2_x
Global renwu2_y

//包颜色的变量
Global baoColor1
Global baoColor2

//任务 1 颜色的变量
Global renwu1_Color_1
Global renwu1_Color_2

//任务 2 颜色的变量
Global renwu2_Color_1
Global renwu2_Color_2

//任务卡住时的颜色
Global errorColor1



x1 = 134	//第一，二个包的 x 坐标
y1 = 120	//第一个包的 y 坐标
y2 = 137	//第二个包的 y 坐标

renwu1_x = 330	//任务1的 x 坐标
renwu1_y = 675	//任务1的 y 坐标

renwu2_x = 657	//任务2的 x 坐标
renwu2_y = 675	//任务2的 y 坐标

renwu1_Color_1 = "FEFEFE"	//任务 1 正在刷新的颜色
renwu1_Color_2 = "7B874"	//任务 1 没有刷新的颜色

renwu2_Color_1 = "7B874"	//任务 2 没有刷新的颜色
renwu2_Color_2 = "FEFEFE"	//任务 2 正在刷新的颜色

baoColor1 = "FF"	//第一个包的颜色
baoColor2 = "8000"	//第二个包的颜色

errorColor1 = "A0A0A0"	//页面卡顿时的颜色


//============第一个包的位置==================
//移动到第一个包
MoveTo x1, y1
Rem top
//判断第一个包的颜色
IfColor x1,y1,baoColor1,0 Then
    //鼠标点击一次
    LeftClick 1
    //按下键盘 R 键
    KeyPress "R", 1
    //等待1秒
    Rem Now2
    Delay 500
    //判断是不是没有刷新
    IfColor renwu2_x, renwu2_y, renwu2_Color_1, 0 Then
    	//调用 init 函数，执行其他代码！！
    	Call init()
	Else    
    	//跳回上一级判断
    	Goto Now2
	End If

    
Else    
    MessageBox "第一个包的颜色不一样哦！！！"
End If

Function init()
	//移动到 任务2
	//============任务 2 的位置==================
	MoveTo renwu2_x, renwu2_y
	//等待 0.5 秒
	Delay 500
	Rem now_1
	//判断 任务2 是否没有刷新
	IfColor renwu2_x,renwu2_y,renwu2_Color_1,0 Then
    	//点击刷新
    	LeftClick 1
    	Delay 500
    	
    	Rem renwu2
    	//判断 任务2 是否正在刷新
    	IfColor renwu2_x,renwu2_y,renwu2_Color_2,0 Then
    		//颜色一样
    		LeftClick 1
    		//============任务 1 的位置==================
			//移动到 任务 1
    		MoveTo renwu1_x, renwu1_y
    		//等待 0.5 秒
    		Delay 500
    		Rem iNow1
	
			//判断 任务 1 是否在刷新
    		IfColor renwu1_x,renwu1_y,renwu1_Color_1,0 Then
    			//颜色一样
    			LeftClick 1
    			Rem iNow2
    			//等待 0.5 秒
    			Delay 500
    			//任务 1 没有刷新
    			IfColor renwu1_x,renwu1_y,renwu1_Color_2,0 Then
    				//颜色一样
    				LeftClick 1
    				Rem iNow3
    				//等待 0.5 秒
    				Delay 500
    				//任务 1 正在刷新
    				IfColor renwu1_x,renwu1_y,renwu1_Color_1,0 Then
    					//颜色一样
    					LeftClick 1
    					//等待0.5秒
    					Delay 500
    					//============第二个包的位置==================
    					//移动到第二个包的位置
						MoveTo x1, y2
						//等待0.5秒
						Delay 500
						//判断第二个包的颜色是否相等
						IfColor x1,y2,baoColor2,0 Then
    						//点击一次
    						LeftClick 1
    						//按下键盘 R 键
    						KeyPress "R", 1
    						//等待1秒
    						Delay 1000
    						//重新运行脚本
							RestartScript
						Else    
    						MessageBox "第二个包的颜色不对哦！！"
						End If
					Else    
    					//跳回上级重新判断
    					Goto iNow3
					End If
	
				Else    
    				//跳回上级重新判断
    				Goto iNow2
				End If
			Else    
    			//第一个任务不在刷新状态
    			//等待0.5秒
    			Delay 500
    			//跳回上级重新判断
				Goto iNow1
			End If
		Else 
			Goto renwu2
		End If
    	
	Else    
    	//判断是否处于灰色状态
    	IfColor renwu2_x,renwu2_y,errorColor1,0 Then
    		//等待五秒
    		Delay 1000
    		//是否仍然处于卡顿状态
    		IfColor renwu2_x, renwu2_y, errorColor1, 0 Then
    			//继续等待 5 秒
    			Delay 1000
    			//返回 任务 2
				Goto now_1
			Else    
    			//返回 任务 2 
    			Goto now_1
			End If
		Else 
	    	//任务 2 不是灰色，正在刷新。。。
    		IfColor renwu2_x,renwu2_y,renwu2_Color_2,0 Then
    			//任务 2 取消刷新
    			LeftClick 1
    			//Goto now2
			Else    
    			//颜色不一样
			End If
		End If
	
	End If
End Function
