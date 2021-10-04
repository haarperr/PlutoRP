fx_version 'bodacious'
games { 'rdr3', 'gta5' }

client_scripts {
  '@plutorp-rpc/client/cl_main.lua',
  'client/cl_*.lua',
}

shared_scripts {
  'sh/*.lua'
}

server_scripts {
  '@plutorp-rpc/server/sv_main.lua',
  'server/*.lua',
}

ui_page 'html/index.html'
file 'html/index.html'

exports {
	'showInteraction',
  'hideInteraction'
}