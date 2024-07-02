return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local dashboard = require("dashboard")

        vim.keymap.set("n", "<leader>hs", function ()
            vim.cmd(":Dashboard")
        end)

        dashboard.setup {
            theme = 'hyper',
            config = {
                week_header = {
                    enable = false,
                },
                header = {
                    [[                                                   ]],
                    [[                                              ___  ]],
                    [[                                           ,o88888 ]],
                    [[                                        ,o8888888' ]],
                    [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
                    [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
                    [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
                    [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
                    [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
                    [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
                    [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
                    [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
                    [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
                    [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
                    [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
                    [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
                    [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
                    [[     ...:.'.:.::::"'    . . . . .'                 ]],
                    [[    .. . ....:."' `   .  . . ''                    ]],
                    [[  . . . ...."'                                     ]],
                    [[  .. . ."'                                         ]],
                    [[ .                                                 ]],
                    [[                                                   ]],
                },
                shortcut = {},
                disable_move = false,
                footer = {
                    [[                                                    ]],
                    [[                                                    ]],
                    [[                                                    ]],
                    [[     dMMMMb  dMMMMMP .aMMMb  dMP dMP dMP dMMMMMMMMb ]],
                    [[    dMP dMP dMP     dMP"dMP dMP dMP amr dMP"dMP"dMP ]],
                    [[   dMP dMP dMMMP   dMP dMP dMP dMP dMP dMP dMP dMP  ]],
                    [[  dMP dMP dMP     dMP.aMP  YMvAP" dMP dMP dMP dMP   ]],
                    [[ dMP dMP dMMMMMP  VMMMP"    VP"  dMP dMP dMP dMP    ]],
                    [[                                                    ]],
                    [[                                                    ]],
                    [[                                                    ]],
                },
                project = { enable = true, limit = 3 },
                mru = { limit = 7 },
            },
        }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
