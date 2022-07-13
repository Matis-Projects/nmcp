local lng = {
	["CMD"] = {
        ["ANALYSE"] = {
            [1] = "Vérifications en cours des nets.",
            [2] = "Vérifications terminée."
        },
        ["HONEYPOT"] = {
            [1] = "Créations du honeypot en cours...",
            [2] = "Listes des nets piégés: %1",
            [3] = "Le honeypot à été correctement installé."
        },
        ["HELP"] = {
            [1] = "Voici la liste des commandes: ",
            [2] = "lance une analyse des nets.",
            [3] = "écrit ce message."
        },
        ["ERROR"] = {
            [1] = "Il n'y a pas d'argument correct... (Essayer: nmcp help)"
        }
	}
}

function GetLanguages()
    return lng
end