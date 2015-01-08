local MenuTabs = {}
Mercury.Menu = {}

	function Mercury.Menu.AddMenuTab(index,icon,name,desc,func) 
		MenuTabs[index] = { name = name,icon = icon, desc = desc, genfunc = func}
	end


function Mercury.Menu.Open()

	for _,f in pairs(file.Find("mercury/menu/*.lua","LUA")) do
		local S,ER =	pcall(function() include("mercury/menu/" .. f) end) // OUCH!!!! MY MEMORY!!!
		if (S) then Msg("[Mercury-Menu]: Adding accessory: " .. f .. "\n") else
	 		 Msg("[Mercury-Menu]: Adding accessory: " .. ER .. "\n")
		end
	end   
 
 
	//////////MAIN MENU GENERATION//////////
	local rootwindow = vgui.Create( "DFrame" ) // Actual window frame
		rootwindow:SetSize( 640, 480 )
		rootwindow:Center()
 		rootwindow:SetTitle( "Mercury Menu" )
		rootwindow:SetVisible( true )
		rootwindow:MakePopup()



	local prosh = vgui.Create("DPropertySheet", rootwindow) // Property sheet in which everything attaches to.
	 prosh:SetSize( 640 , 450 )
	 prosh:SetPos(0,24)

	 function prosh:GetWindow()
	    return rootwindow
	 end 


	 function rootwindow:GetPropertySheet()
	 	return prosh
	 end

	 // 

	/////////////////////////////
	/////////////////////////////


 
  
	for k,v in pairs(MenuTabs) do
		local window = vgui.Create("DPanel",prosh)
			// window:DockPadding(2,2,2,2)
		window:SetSize(640,456)
		local gtab = MenuTabs[k]

		local gf = MenuTabs[k]["genfunc"]
		
		local stat , err = xpcall(gf,function(err) Mercury.Menu.ShowError(err .. " \n " .. debug.traceback()) end,window)

		
		prosh:AddSheet(  gtab.name ,window, gtab.icon , false, false, gtab.desc ) // Register window on propertysheet.
	end
end

function Mercury.Menu.ShowError(err)

	surface.PlaySound("mercury/mercury_error.ogg")
	local rootwindow = vgui.Create( "DFrame" ) // Actual window frame
		rootwindow:SetSize( 480, 480 )
		rootwindow:Center()
 		rootwindow:SetTitle( "Mercury - Error" )
		rootwindow:SetVisible( true )
		rootwindow:MakePopup()


		local DLabel = vgui.Create( "DLabel", rootwindow )
		DLabel:SetPos( 60, 50 )
		DLabel:SetText( "An error occured on clientside." )
		DLabel:SizeToContents()

	local tbox = vgui.Create("HTML", rootwindow) 
	 tbox:SetSize( 450 , 365)
	 tbox:SetPos(15,96)
	 tbox:SetHTML([[<pre>  <font color="white">]] .. err .. "<font></pre>")






end


function Mercury.Menu.ShowErrorCritical(err)

	surface.PlaySound("mercury/mercury_error.ogg")
	local rootwindow = vgui.Create( "DFrame" ) // Actual window frame
		rootwindow:SetSize( 480, 480 )
		rootwindow:Center()
 		rootwindow:SetTitle( "Mercury - Critical Failure" )
		rootwindow:SetVisible( true )
		rootwindow:MakePopup()


		local DLabel = vgui.Create( "DLabel", rootwindow )
		DLabel:SetPos( 60, 50 )
		DLabel:SetText( "A critical failure has occured." )
		DLabel:SizeToContents()

	local tbox = vgui.Create("HTML", rootwindow) 
	 tbox:SetSize( 450 , 365)
	 tbox:SetPos(15,96)
	 tbox:SetHTML([[<pre>  <font color="white">]] .. err .. "<font></pre>")





end