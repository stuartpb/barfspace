# Steam on Stuzzy

[Uncommented multilib in pacman.conf](https://wiki.archlinux.org/index.php/Official_repositories#multilib)\

`yay -S lib32-vulkan-icd-loader lib32-mesa vulkan-intel lib32-vulkan-intel steam ttf-liberation`

doing `yay -S steam-native-runtime` (the extra metapackage of deps needed to make `steam-native` work) for kicks (although it brings in a lot of packages, they only add up to about 79 megs more)
