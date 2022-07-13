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
            [1] = "There is no argument valid... (Try: nmcp help)"
        }
	}
}

function GetLanguage()
    return lng
end