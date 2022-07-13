local lng = {
    ["EVENT"] = {
        ["HTTP-REQUEST"] = {
            [1] = "Connexion en cours aux serveurs de NMCP.",
            [2] = "Connecté aux serveurs de NMCP.",
            [3] = "Une erreur est survenue lors de la connexion aux serveurs de NMCP. (%1)"
        },
        ["VERSION-CHECK"] = {
            [1] = "Ceci est la dernière version disponible de NMCP. (%1)",
            [2] = "Cette version n'est pas la dernière... Merci de mettre à jour de %1 à %2.",
            [3] = "Impossible de vérifier si NMCP est à jour."
        }
    },
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
            [3] = "écrit ce message.",
            [4] = "créer un honeypot."
        },
        ["ERROR"] = {
            [1] = "Il n'y a pas d'argument correct... (Essayer: nmcp help)"
        }
	}
}

function GetLanguage()
    return lng
end