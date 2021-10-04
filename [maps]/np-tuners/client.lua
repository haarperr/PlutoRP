Citizen.CreateThread(function()
	RequestIpl("denis3d_tunershop_milo_")
	interiorID = GetInteriorAtCoords(137.70090000, -3029.30400000, 11.79530000)

	if IsValidInterior(interiorID) then
		--EnableInteriorProp(interiorID, "ipl_by_haitux_1")
		--EnableInteriorProp(interiorID, "ipl_by_haitux_2")
		EnableInteriorProp(interiorID, "ipl_by_haitux_3")
		EnableInteriorProp(interiorID, "ipl_by_haitux_4")
		RefreshInterior(interiorID)
	end
end)