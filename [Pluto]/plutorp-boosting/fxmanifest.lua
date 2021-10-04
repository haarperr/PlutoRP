fx_version 'bodacious'
game 'gta5'

ui_page 'html/frame-1.html'
files {
	'html/js/scripts.js',
	'html/js/debounce.js',
	'html/*.html',
	'html/css/*.css',
	'html/img/*.png',
	'html/img/*.svg'
}

client_scripts {
	'client/main.lua'
}

shared_script '@plutorp-lib/import.lua'

server_scripts {
	'server/main.lua'
}