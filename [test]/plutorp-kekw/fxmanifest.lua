fx_version 'cerulean'
game 'gta5'


ui_page 'index.html'
file 'index.html'

server_scripts {
    "configs/config_cl.lua",
    "configs/config_sv.lua",
    "configs/tables.lua",
    "server.lua",
}

client_scripts {
    "configs/config_cl.lua",
    "configs/tables.lua",
    "client.lua",
}