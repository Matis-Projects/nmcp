local lng = {
    ["EVENT"] = {
        ["HTTP-REQUEST"] = {
            [1] = "Connecting to NMCP's server.",
            [2] = "Connected to NMCP's server.",
            [3] = "An error as been expected when connecting to NMCP's server. (%1)"
        },
        ["VERSION-CHECK"] = {
            [1] = "This is the last version of NMCP. (%1)",
            [2] = "This isnt the last version. Please update NMCP from %1 to %2.",
            [3] = "Can't check if this is the last version of NMCP."
        },
        ["PHYSIC-GUN"] = {
            [1] = "There is a entity to close from your object to freeze it!"
        },
        ["ADMIN-MENU"] = {
            [1] = "You have to be superadmin to open this menu.",
            [2] = "All changes have been saved!",
            [3] = "An error has been detected when the file has been saved..."
        },
        ["RELOAD"] = {
            [1] = "This addon has fully loaded!"
        }
    },
	["CMD"] = {
        ["ANALYSE"] = {
            [1] = "Checking all nets...",
            [2] = "All nets has been checked!"
        },
        ["HONEYPOT"] = {
            [1] = "Creating of a honeypot...",
            [2] = "List of trapped net: %1.",
            [3] = "The honeypot has been correcly installed."
        },
        ["HELP"] = {
            [1] = "Here the lists of all commands: ",
            [2] = "launch the checking of nets.",
            [3] = "write this message.",
            [4] = "create an honeypot."
        },
        ["ERROR"] = {
            [1] = "There is no argument valid... (Try: nmcp_antinet help)"
        }
	},
    ["ADMIN-MENU"] = {
        ["LEFT_BTN"] = {
            [1] = "Home",
            [2] = "Anti-Net",
            [3] = "Physic-Gun Limitation",
            [4] = "Save"
        },
        ["TABS"] = {
            ["HOME"] = {
                ["TEXTS"] = {
                    [1] = "Welcome in the administration menu of NMCP !",
                    [2] = "You can change all settings of all modules here",
                    [3] = "And see their advanced options."
                },
                ["INPUTS"] = {
                    [1] = "Language : "
                }
            },
            ["ANTI-NET"] = {
                ["TEXTS"] = {},
                ["INPUTS"] = {
                    [1] = "Enable the module.",
                    [2] = "When the server start, start a scan of the nets.",
                    [3] = "When the server start, create a honeypot."
                }
            },
            ["PHYSIC-GUN"] = {
                ["TEXTS"] = {},
                ["INPUTS"] = {
                    [1] = "Enable the module.",
                    [2] = "Enable the physic-gun limitation to all entities (anti props-kill).",
                    [3] = "Enable the physic-gun limitation to all vehicles (can't touch with physic-gun)."
                }
            }
        }
    }
}

function GetLanguage()
    return lng
end