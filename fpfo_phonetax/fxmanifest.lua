fx_version "cerulean"
game "gta5"
lua54 "yes"

author "WRP"

client_scripts {
    "client.lua"
}

server_scripts {
    "server.lua"
}

shared_scripts {
    "config.lua",
    "@ox_lib/init.lua"
}

escrow_ignore {
    "config.lua",
    "fxmanifest.lua",
    "README.md"
}