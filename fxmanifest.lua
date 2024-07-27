fx_version 'cerulean'
game 'gta5'

author 'SinorSystem'
description 'shops'
lua54 'yes'

shared_scripts {
    'config.lua'
}

server_scripts {
    "server/main.lua"
}

client_scripts {
    "client/main.lua"
}

escrow_ignore {
    'config.lua',  
    "client/main.lua",  
    "server/main.lua"
  }

  data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_shop_locker.ytyp'