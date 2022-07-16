concommand.Add( "nmcp_admin_menu", function()  
	net.Start("NMCP::ADMIN-MENU")
	net.SendToServer()
end )

local is_open = false
net.Receive("NMCP::ADMIN-MENU", function(len,ply)
	local is_auth = net.ReadBool()
	if is_auth then
		if is_open == false then
			is_open = true
            -- Then font named "Font" compacted on one line.
            surface.CreateFont("NMCP::Font::Title", {
                font = "Arial",
                extended = true,
                size = 20,
				weight = 5000
            })
			surface.CreateFont("NMCP::Font::BTN-TAB", {
                font = "Arial",
                extended = true,
                size = 15,
				weight = 5000
            })
            surface.CreateFont("NMCP::Font::TAB::Title", {
                font = "Arial",
                extended = true,
                size = 25,
				weight = 5000
            })
            surface.CreateFont("NMCP::Font::TAB::Text", {
                font = "Arial",
                extended = true,
                size = 15
            })
                
            local faded_black = Color(18, 18, 40)
            local DermaPanel = vgui.Create("DFrame") 
            DermaPanel:SetSize(500, 600) 
            DermaPanel:Center()
            DermaPanel:SetTitle("")
            DermaPanel:SetDraggable(false)
            DermaPanel:MakePopup()
			
			DermaPanel.OnClose = function()
				is_open = false
			end
                
            DermaPanel.Paint = function(self, w, h)
                draw.RoundedBox(2, 0, 0, w, h, faded_black)
                draw.SimpleText("No More Cancerous Player", "NMCP::Font::Title", 250, 15, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
                
                
			local DPanel = vgui.Create( "DPanel", DermaPanel )
            DPanel:SetPos( 0, 0 ) -- Set the position of the panel
            DPanel:SetSize( 120, 600 ) -- Set the size of the panel
			DPanel.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, faded_black)
			end
                
            local selected = 1
            local select_color = Color(240, 190, 40)
            local nselect_color = Color(140, 90, 40)
            local tbl_clr = {select_color,nselect_color,nselect_color,nselect_color}
                
            local BTN_HOME = vgui.Create( "DButton", DPanel )
            BTN_HOME:SetPos( 0, 0 ) -- Set the position of the panel
            BTN_HOME:SetSize( 120, 120 ) -- Set the size of the panel
            BTN_HOME:SetText( "" )
			BTN_HOME.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, tbl_clr[1])
				draw.SimpleText("Home", "NMCP::Font::BTN-TAB", 60, 100, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
            BTN_HOME.DoClick = function()
				DoUpdateScreen(1)
			end
                
            local BTN_MODULE_ANTINET = vgui.Create( "DButton", DPanel )
            BTN_MODULE_ANTINET:SetPos( 0, 120 ) -- Set the position of the panel
            BTN_MODULE_ANTINET:SetSize( 120, 120 ) -- Set the size of the panel
            BTN_MODULE_ANTINET:SetText( "" )
			BTN_MODULE_ANTINET.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, tbl_clr[2])
				draw.SimpleText("Anti-Net", "NMCP::Font::BTN-TAB", 60, 100, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
            BTN_MODULE_ANTINET.DoClick = function()
				DoUpdateScreen(2)
			end
                
            local BTN_MODULE_PHYSIC = vgui.Create( "DButton", DPanel )
            BTN_MODULE_PHYSIC:SetPos( 0, 240 ) -- Set the position of the panel
            BTN_MODULE_PHYSIC:SetSize( 120, 120 ) -- Set the size of the panel
            BTN_MODULE_PHYSIC:SetText( "" )
			BTN_MODULE_PHYSIC.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, tbl_clr[3])
				draw.SimpleText("Physicgun limitation", "NMCP::Font::BTN-TAB", 60, 100, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
            BTN_MODULE_PHYSIC.DoClick = function()
				DoUpdateScreen(3)
			end

            local BTN_MODULE_NONE = vgui.Create( "DPanel", DPanel )
            BTN_MODULE_NONE:SetPos( 0, 360 ) -- Set the position of the panel
            BTN_MODULE_NONE:SetSize( 120, 240 ) -- Set the size of the panel
            BTN_MODULE_NONE:SetText( "" )
			BTN_MODULE_NONE.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, tbl_clr[4])
			end


            local TAB_HOME = vgui.Create( "DPanel", DermaPanel )
            TAB_HOME:SetPos( 120, 50 ) -- Set the position of the panel
            TAB_HOME:SetSize( 380, 550 ) -- Set the size of the panel
			TAB_HOME.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, faded_black)
                draw.SimpleText("Accueil", "NMCP::Font::TAB::Title", 190, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Bienvenue dans le menu d'administration de NMCP !", "NMCP::Font::TAB::Text", 190, 50, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Vous pouvez changez les paramètres des modules ici et", "NMCP::Font::TAB::Text", 190, 65, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                draw.SimpleText("Voir leurs options avancées.", "NMCP::Font::TAB::Text", 190, 80, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
            TAB_HOME:SetVisible(true)


            local TAB_MODULE_ANTINET = vgui.Create( "DPanel", DermaPanel )
            TAB_MODULE_ANTINET:SetPos( 120, 50 ) -- Set the position of the panel
            TAB_MODULE_ANTINET:SetSize( 380, 550 ) -- Set the size of the panel
			TAB_MODULE_ANTINET.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, faded_black)
                draw.SimpleText("ANTI-NET Configuration", "NMCP::Font::TAB::Title", 190, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
            TAB_MODULE_ANTINET:SetVisible(false)

            local TAB_MODULE_ANTINET_ENABLE = TAB_MODULE_ANTINET:Add( "DCheckBoxLabel" )
            TAB_MODULE_ANTINET_ENABLE:SetPos( 25, 50 )
            TAB_MODULE_ANTINET_ENABLE:SetText("Enable the module")
            TAB_MODULE_ANTINET_ENABLE:SetValue( true )
            TAB_MODULE_ANTINET_ENABLE:SizeToContents()

            local TAB_MODULE_ANTINET_ENABLE_ANALYSE = TAB_MODULE_ANTINET:Add( "DCheckBoxLabel" )
            TAB_MODULE_ANTINET_ENABLE_ANALYSE:SetPos( 25, 70 )
            TAB_MODULE_ANTINET_ENABLE_ANALYSE:SetText("When the server start, start a scan of the nets.")
            TAB_MODULE_ANTINET_ENABLE_ANALYSE:SetValue( true )
            TAB_MODULE_ANTINET_ENABLE_ANALYSE:SizeToContents()

            local TAB_MODULE_ANTINET_ENABLE_HP = TAB_MODULE_ANTINET:Add( "DCheckBoxLabel" )
            TAB_MODULE_ANTINET_ENABLE_HP:SetPos( 25, 90 )
            TAB_MODULE_ANTINET_ENABLE_HP:SetText("When the server start, create a honeypot.")
            TAB_MODULE_ANTINET_ENABLE_HP:SetValue( true )
            TAB_MODULE_ANTINET_ENABLE_HP:SizeToContents()


            local TAB_MODULE_PHYSIC = vgui.Create( "DPanel", DermaPanel )
            TAB_MODULE_PHYSIC:SetPos( 120, 50 ) -- Set the position of the panel
            TAB_MODULE_PHYSIC:SetSize( 380, 550 ) -- Set the size of the panel
			TAB_MODULE_PHYSIC.Paint = function(self, w, h)
				draw.RoundedBox(2, 0, 0, w, h, faded_black)
                draw.SimpleText("Physic-gun Configuration", "NMCP::Font::TAB::Title", 190, 10, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
            TAB_MODULE_PHYSIC:SetVisible(false)

            local TAB_MODULE_PHYSIC_ENABLE = TAB_MODULE_PHYSIC:Add( "DCheckBoxLabel" )
            TAB_MODULE_PHYSIC_ENABLE:SetPos( 25, 90 )
            TAB_MODULE_PHYSIC_ENABLE:SetText("Enable the module.")
            TAB_MODULE_PHYSIC_ENABLE:SetValue( true )
            TAB_MODULE_PHYSIC_ENABLE:SizeToContents()
                
			function DoUpdateScreen(int)
                if int == 1 then
                    TAB_HOME:SetVisible(true)
                    tbl_clr[1] = select_color
                else
                    TAB_HOME:SetVisible(false)
                    tbl_clr[1] = nselect_color
                end
                if int == 2 then
                    TAB_MODULE_ANTINET:SetVisible(true)
                    tbl_clr[2] = select_color
                else
                    TAB_MODULE_ANTINET:SetVisible(false)
                    tbl_clr[2] = nselect_color
                end
                if int == 3 then
                    TAB_MODULE_PHYSIC:SetVisible(true)
                    tbl_clr[3] = select_color
                else
                    TAB_MODULE_PHYSIC:SetVisible(false)
                    tbl_clr[3] = nselect_color
                end
			end
		end
	else
		notification.AddLegacy( "You have to be superadmin to open this menu.", 0, 5 )
        surface.PlaySound( "buttons/button15.wav" )
        Msg( "You have to be superadmin to open this menu.\n" )
	end
end)