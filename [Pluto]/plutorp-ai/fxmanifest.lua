
fx_version 'bodacious'
games { 'gta5' }

-- Define the resource metadata
name 'sky-ai'
description 'KoilDickLicker'
author 'Dw#2139'
version 'v1.1.0'



client_script "config.lua"
client_script "client.lua"


server_script "config.lua"
server_script "version_check.lua"

files {
	'events.meta',
	'relationships.dat'
}

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'