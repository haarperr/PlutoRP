fx_version 'adamant'
games { 'gta5' }

client_script 'config.lua'
client_script 'blips_client.lua'

server_script 'config.lua'
server_script 'blips_server.lua'


client_script "@plutorp-infinity/client/cl_lib.lua"
server_script "@plutorp-infinity/server/sv_lib.lua"