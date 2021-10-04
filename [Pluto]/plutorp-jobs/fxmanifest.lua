fx_version 'bodacious'
games { 'rdr3', 'gta5' }

server_export 'AddJob' 

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/pricedown.ttf',
	'html/cursor.png',
	'html/background.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
}

client_scripts {
    'client/cl_*.lua',
}

server_scripts {
    'server/sv_*.lua'
}