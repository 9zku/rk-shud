fx_version ( 'cerulean' )
game ( 'gta5' )

author ({ 'RK' })
version ({ '1.0.0' })

ui_page ({ 'dist/index.html' })

files ({
    'dist/**',
    'dist/assets/**',
})

shared_scripts ({
    '@ox_lib/init.lua',
    'config/**'
})

server_scripts ({
    'server-version.lua'
})

client_scripts ({
    'client-main.lua',
    'client/**',
    'client/**/**'
})

dependencies ({
    'ox_lib',
})

lua54 ( 'true' )