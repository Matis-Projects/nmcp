local lng = {
    ["EVENT"] = {
        ["HTTP-REQUEST"] = {
            [1] = "Connexion en cours aux serveurs de NMCP.",
            [2] = "Connecté aux serveurs de NMCP.",
            [3] = "Une erreur est survenue lors de la connexion aux serveurs de NMCP. (%1)"
        },
        ["VERSION-CHECK"] = {
            [1] = "Ceci est la dernière version disponible de NMCP. (%1)",
            [2] = "Cette version n'est plus supportée... Merci de mettre à jour de %1 à %2.",
            [3] = "Impossible de vérifier si NMCP est à jour."
        },
        ["PHYSIC-GUN"] = {
            [1] = "Une entité est trop proche de cet objet pour la freeze!"
        },
        ["ADMIN-MENU"] = {
            [1] = "You have to be superadmin to open this menu.",
            [2] = "Les modifications ont été pris en compte!",
            [3] = "Un problème est survenue lors de la mise à jour du fichier CONFIG."
        },
        ["RELOAD"] = {
            [1] = "L'addon à été correctement chargé!"
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
            [1] = "Il n'y a pas d'argument correct... (Essayer: nmcp_antinet help)"
        }
	},
    ["ADMIN-MENU"] = {
        ["LEFT_BTN"] = {
            [1] = "Accueil",
            [2] = "Anti-Net",
            [3] = "Limitation Physic-Gun",
            [4] = "Sauvegarder"
        },
        ["TABS"] = {
            ["HOME"] = {
                ["TEXTS"] = {
                    [1] = "Bienvenue dans le menu d'administration de NMCP !",
                    [2] = "Vous pouvez changez les paramètres des modules ici et",
                    [3] = "Voir leurs options avancées."
                },
                ["INPUTS"] = {
                    [1] = "Langage : "
                }
            },
            ["ANTI-NET"] = {
                ["TEXTS"] = {},
                ["INPUTS"] = {
                    [1] = "Activer le module.",
                    [2] = "Quand le serveur démarre, lancer une analyse du serveur.",
                    [3] = "Quand le serveur démarre, créer un honeypot."
                }
            },
            ["PHYSIC-GUN"] = {
                ["TEXTS"] = {},
                ["INPUTS"] = {
                    [1] = "Activer le module.",
                    [2] = "Activer la limitation du physic-gun sur toutes les entités. (can't prop-kill).",
                    [3] = "Activer la limitation du physic-gun sur les véhicules. (player can't touch their vehicle)."
                }
            }
        }
    }
}

function GetLanguage()
    return lng
end