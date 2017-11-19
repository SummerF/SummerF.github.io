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
MacroID=051ecc73-7eeb-4609-add5-01ad094a9d92
Description=自动刷箱
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
//用法：
//1.坐标必填
//2.颜色必填
//3.在代码 33 - 50 行的变量里填写坐标及颜色值
//颜色坐标均可用按键精灵的“抓抓”工具获取

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

//等待时间变量
Global iTime

//////////////////////////////////////////////////////////////////
x1 = 125	//第一，二个包的 x 坐标
y1 = 129	//第一个包的 y 坐标
y2 = 146	//第二个包的 y 坐标

renwu1_x = 304	//任务1的 x 坐标
renwu1_y = 635	//任务1的 y 坐标

renwu2_x = 570	//任务2的 x 坐标
renwu2_y = 635	//任务2的 y 坐标

renwu1_Color_1 = "FEFEFE"	//任务 1 正在刷新的颜色
renwu1_Color_2 = "7BA77"	//任务 1 没有刷新的颜色

renwu2_Color_1 = "7BA77"	//任务 2 没有刷新的颜色
renwu2_Color_2 = "FEFEFE"	//任务 2 正在刷新的颜色

baoColor1 = "FF"	//第一个包的颜色
baoColor2 = "8000"	//第二个包的颜色

errorColor1 = "A0A0A0"	//页面卡顿时的颜色

iTime = 3000	//等待时间

/////////////////////////////////////////////////////////////////
//移动到第一个包
MoveTo x1, y1
//等待 2 秒
Delay iTime
//判断第一个包的颜色
IfColor x1,y1,baoColor1,0 Then
    //鼠标点击选中第一个包
    LeftClick 1
    //按下键盘R发送包
	KeyPress "R", 1
End If
//等待 2 秒
Delay iTime
//移动鼠标到任务 2
MoveTo renwu2_x, renwu2_y
//判断任务 2 是不是没有刷新
IfColor renwu2_x,renwu2_y,renwu2_Color_1,0 Then
    //点击一次
    LeftClick 1
    //等待 3 秒
    Delay iTime
    //判断任务 2 是不是正在刷新
	IfColor renwu2_x,renwu2_y,renwu2_Color_2,0 Then
		//鼠标单击一次
		LeftClick 1
		//移动到任务 1 的坐标
    	MoveTo renwu1_x,renwu1_y
    	////等待 3 秒
    	Delay iTime
    	//判断任务 1 是不是正在刷新
		IfColor renwu1_x,renwu1_y,renwu1_Color_1,0 Then
    		//点击一次
    		LeftClick 1
    		//等待 3 秒
    		Delay iTime
    		//判断任务 1 是不是没有刷新
    		IfColor renwu1_x,renwu1_y,renwu1_Color_2,0 Then
    				//点击一次
    				LeftClick 1
    				//等待 3 秒
    				Delay iTime
    				//判断任务 1 是不是正在刷新 
    				IfColor renwu1_x,renwu1_y,renwu1_Color_1,0 Then
    					//点击一次
    					LeftClick 1
    					//等待 3 秒
						Delay iTime
						//移动到第二个包的位置
						MoveTo x1, y2
						//判断第二个包的颜色
						IfColor x1,y2,baoColor2,0 Then
    						//鼠标点击选中第二个包
    						LeftClick 1
    						//按下键盘R发送包
							KeyPress "R", 1
							Delay iTime
							//脚本重新执行
    						RestartScript 
						End If
    					
					End If
			Else 
				//MessageBox "任务 1 第二次刷新失败"
				Delay iTime
				IfColor renwu1_x,renwu1_y,renwu1_Color_1,0 Then
    				//点击一次
    				LeftClick 1
    				//等待 3 秒
					Delay iTime
					//移动到第二个包的位置
					MoveTo x1, y2
					//判断第二个包的颜色
					IfColor x1,y2,baoColor2,0 Then
    					//鼠标点击选中第二个包
    					LeftClick 1
    					//按下键盘R发送包
						KeyPress "R", 1
						Delay iTime
						//脚本重新执行
    					RestartScript 
					End If
    				
				End If

			End If
		Else    
    		IfColor renwu1_x,renwu1_y,renwu1_Color_1,0 Then
    			//点击一次
    			LeftClick 1
    			//等待 3 秒
				Delay iTime
				//移动到第二个包的位置
				MoveTo x1, y2
				//判断第二个包的颜色
				IfColor x1,y2,baoColor2,0 Then
    				//鼠标点击选中第二个包
    				LeftClick 1
    				//按下键盘R发送包
					KeyPress "R", 1
					Delay iTime
					//脚本重新执行
    				RestartScript 
				End If
    			
			End If
		End If
	End If
Else    
    //第一个判断颜色不一样
    //判断任务 1 是不是处于卡顿状态
	IfColor renwu1_x,renwu1_y,errorColor1,0 Then
    	//等待 5 秒
    	Delay 5000
    	IfColor renwu2_x,renwu2_y,renwu2_Color_2,0 Then
    		//点击一次
    		LeftClick 1
    		//等待 2 秒
    		Delay iTime
    		//重新运行脚本
    		RestartScript
		Else    
    		//卡顿时间太长
    		MessageBox "卡顿时间太长"
		End If
	End If
End If

