MRP.Commands = MRP.Commands or {}
MRP.Commands.Registered = MRP.Commands.Registered or {}

AddEventHandler("plutorp-core:exportsReady", function()
    addModule("Commands", MRP.Commands)
end)
