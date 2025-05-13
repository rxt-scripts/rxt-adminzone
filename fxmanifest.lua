fx_version 'cerulean'
game 'gta5'

description 'RXT - Admin Zone with ACE Permissions'
author 'RXT Scripts'
version '1.0.0'

shared_script 'config.lua'
client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'client.lua'
}
server_script 'server.lua'

lua54 'yes'