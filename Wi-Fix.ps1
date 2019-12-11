while($true) # Pour que le programme tourne tout le temps (ça sert surtout si vous subissez une déconnexion intempestive)
{
    # On teste d'abord si la connexion est en place, en lançant un ping vers l'adresse 8.8.8.8
    $test = Test-Connection 8.8.8.8

    # Si la connexion n'est pas en place, alors on rentre dans le programme
    if($test -eq $null){
        # On récupère les infos de votre carte Wi-Fi
        $interface = netsh wlan show interface wi-fi

        # Si on est déjà connecté à un réseau Wi-Fi mais que celui-ci ne capte pas Internet, alors on se déconnecte de ce réseau
        if($interface[8] -like "*SSID*"){netsh wlan disconnect wi-fi}
        Sleep 1

        # On récupère les SSID connus par l'ordinateur
        $profiles = netsh wlan show profiles

        # On récupère les SSID trouvés par la carte Wi-Fi
        $ssid = netsh wlan show network | select-string SSID

        # Deux tableaux vides, qui s'incrémenteront avec respectivement les SSID disponibles et les SSID trouvés. Ces deux tableaux sont surtout là pourla lisiblité du programme
        # et pour la simplification des exécutions qui vont suivre.
        $available_ssid = @()
        $saved_ssid = @()

        # Cette chaîne de caractères va servir à stocker le SSID choisi par le programme, pour effectuer la connexion
        $the_ssid = ""

        # Vu que $ssid est un peu illisible, on va remplir $available_ssid avec les SSID des réseaux trouvés en appliquant un petit tri dans la chaine de caractères
        # pour en extraire UNIQUEMENT le SSID
        forEach($a in $ssid){
            $machin = $a -split ': '
            if($machin[1] -ne ""){
                $available_ssid += $machin[1]
            }
            
        }

        # Même chose qu'au-dessus, mais pour les SSID sauvegardés
        forEach($b in $profiles){
            if($b -like '*Tous les utilisateurs*'){
                $truc = $b -split ': '
                if($truc[1] -ne ""){
                    $saved_ssid += $truc[1]
                }
            }
            
        }

        # Et quand nos deux tableaux sont bien propres, on compare les valeurs et on stocke la première valeur trouvée dans $the_ssid
        forEach($i in $saved_ssid){
            forEach($j in $available_ssid) {
                if($i -eq $j){
                    if($the_ssid -eq ""){
                        $the_ssid += $i
                    }
                }
            }
        }
    }

    # Une fois que le tri a été effectué et que $the_ssid a été rempli, il ne nous reste plus qu'à lancer la connexion
    if($the_ssid -ne ""){
        netsh wlan connect name=$the_ssid
        $the_ssid = ""
    }

    # Et c'est fini ^^ Maintenant on repart au début! ;)
}
