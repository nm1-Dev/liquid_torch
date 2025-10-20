fx_version 'cerulean'
game 'gta5'

author 'Nmsh'
description 'FiveM Simple Torch Script'
version '1.0.0'

shared_script {
  'shared/config.lua'
}

client_scripts {
  'client/custom/*.lua',
  'client/client.lua'
}

server_scripts {
  'server/server.lua'
}

data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_torch_fire001.ytyp'

lua54 'yes'
