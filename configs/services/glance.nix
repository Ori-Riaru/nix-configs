{settings, ...}: {
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        host = "${settings.serverTailscaleIP}";
        port = 7777;
      };

      theme = {
        background-color = "0 0 7";
        primary-color = "254 100 76";
        disable_picker = true;
      };

      pages = [
        {
          name = "Home";
          columns = [
            {
              size = "small";
              widgets = [
                {
                  type = "clock";
                  hour-format = "24h";
                }
                {
                  type = "calendar";
                }
                {
                  type = "to-do";
                }
              ];
            }
            {
              size = "full";
              widgets = [
                {
                  type = "bookmarks";
                  groups = [
                    {
                      same-tab = true;
                      links = [
                        {
                          title = "Github";
                          url = "https://github.com/";
                        }
                        {
                          title = "Proton";
                          url = "https://mail.proton.me/u/4/inbox";
                        }
                        {
                          title = "Online Fix";
                          url = "https://online-fix.me/";
                        }
                        {
                          title = "Anilist";
                          url = "https://anilist.co/";
                        }
                        {
                          title = "Letterboxd";
                          url = "https://letterboxd.com/riaru/films/by/entry-rating/";
                        }
                        {
                          title = "Jellyfin";
                          url = "https://riaru.undo.it/web";
                        }
                        {
                          title = "Void";
                          url = "https://my.v0id.nl";
                        }
                        {
                          title = "Lemmy";
                          url = "https://phtn.app/?type=Subscribed";
                        }
                        {
                          title = "Claude";
                          url = "https://claude.ai/";
                        }
                        {
                          title = "ChatGPT";
                          url = "https://chatgpt.com";
                        }
                        {
                          title = "Gemini";
                          url = "https://gemini.google.com/app";
                        }
                        {
                          title = "Arena";
                          url = "https://arena.ai";
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "iframe";
                  source = "https://riaru.home.kg/apps/calendar/timeGridWeek/now";
                  height = 1024;
                }
              ];
            }
          ];
        }
        {
          name = "Youtube";
          columns = [
            {
              size = "full";
              widgets = [
                {
                  type = "videos";
                  style = "grid-cards";
                  limit = 50;
                  channels = [
                    # spell-checker: disable
                    "UCdmcAwbdiXQWs9d4Qd4KzDw" # 2 Much ColinFurze
                    "UCI7XWNL-pkqYeY9MLyL5roQ" # 2AM
                    "UCiNLr9wX35KksK77mrQgxiw" # 2swap
                    "UCYO_jab_esuFRV4b17AJtAw" # 3Blue1Brown
                    "UCNJ1Ymd5yFuUPtn21xtRbbw" # AI Explained
                    "UCHL9bfHTxCMi-7vfxQ-AYtg" # Abroad in Japan
                    "UCQG40havu4kNpB4pxUDQhYQ" # Acerola
                    "UC2M2T4FSz1kSqNhhL-n9R9A" # Advanced Tinkering
                    "UCE1jXbVAGJQEORz9nZqb5bQ" # Ahoy
                    "UCWizIdwZdmr43zfxlCktmNw" # Alec Steele
                    "UCzRfLYOv0deo80qzA6uD0zA" # Alice Averlong
                    "UCKtix2xNNXdcEfEFnoOnvMw" # Aliensrock
                    "UCCWeRTgd79JL0ilH0ZywSJA" # AlphaPhoenix
                    "UCV0t1y4h_6-2SqEpXBXgwFQ" # AngeTheGreat
                    "UCqVEHtQoXHmUCfJ-9smpTSg" # Answer in Progress
                    "UCH_7doiCkWeq0v3ycWE5lDw" # Any Austin
                    "UCp1GVorJ_63HU8lRfHVK-jg" # Arglin Kampling [Third Gen]
                    "UCR2uRTQ53V_egXKFflMMaaw" # Artem Kirsanov
                    "UCSW_6zSlR7mn6Gqh-njFWFw" # Artem Yashin
                    "UCgv4dPk_qZNAbUW9WkuLPSA" # Atrioc
                    "UCA2FRonDi81FIkgI-49zV3g" # Azalae
                    "UClLOsBKtKS8i9N12l6Uza3g" # Azeal
                    "UChHxJaKDqH4bOs0pX3hkKnA" # Basically Homeless
                    "UCshObcm-nLhbu8MY50EZ5Ng" # Benn Jordan
                    "UCdBXOyqr8cDshsp7kcKDAkg" # Big A
                    "UCp7EwodJcppc6GqiRcnCpOw" # Blender Secrets
                    "UCZXW8E1__d5tZb-wLFOt8TQ" # Bog
                    "UC9pXmjxsQHeFH9vgCeRsHcw" # Brendan Galea
                    "UCvW5ZYoNR2fkn0xkanZKdWA" # Bryce Bostwick
                    "UC2C_jShtL725hvbm1arSV9w" # CGP Grey
                    "UCEOXxzW2vU0P-0THehuIIeg" # Captain Disillusion
                    "UCwbRile4jo-LcW_PQwmMdBw" # Captain KRB
                    "UCr3cBLTYmIK9kY0F_OdFWFQ" # Casually Explained
                    "UCUv35okF8MSo2dFQx5LrNmA" # Chalk Talk
                    "UCjREVt2ZJU8ql-NC9Gu-TJw" # Code to the Moon
                    "UCaSCt8s_4nfkRglWCvNSDrg" # CodeAesthetic
                    "UCrv269YwJzuZL3dH5PCgxUw" # CodeParade
                    "UCpwl7jNE9PJc-lBTShNs5TQ" # Coding with Sphere
                    "UCGpoeEhUBQBaaKZ_a8HB67Q" # Coding2GO
                    "UClB2t8sIPbneCMz-iHpc-dw" # Cody Gindy
                    "UC9-y-6csu5WGm29I7JiwpnA" # Computerphile
                    "UC92TPuPT-yh2hxUN9JD9LZg" # Computing: the Details
                    "UCGKEMK3s-ZPbjVOIuAV8clQ" # Core Dumped
                    "UCSpFnDQr88xCZ80N-X7t0nQ" # Corridor Crew
                    "UCsn6cjffsvyOZCZxvGoJxGg" # Corridor Digital
                    "UCcWZY8dxd4HhlH5vY_Luzgw" # CyanVoxel
                    "UC1qIX2Ya5ErOrU9tv0GVUAw" # CyberYamu
                    "UCW9KvoeUz2CsBwIGh3ux1ew" # Cymaera
                    "UCUQo7nzH1sXVpzL92VesANw" # DIY Perks
                    "UCuWLGQB4WRBKvW1C26zA2og" # Daedalus Community
                    "UCJfJWct8jN1RpCuVWk3zHTA" # Daryl Talks Games
                    "UCsyXL4K687fGa3fOrbX2yPQ" # Deadlock
                    "UC4teYwW5DI82AbRmV_Fq7TQ" # Deckard
                    "UCXSFnQc5niQR7jHMf0U7aQA" # Dev Detour
                    "UCYeiozh-4QwuC1sjgCmB92w" # DevOps Toolbox
                    "UCmfJPEfaEMGTu6CaJNr0AEQ" # Doodley
                    "UCLNGY9N9Xmnc2kUpHoSJ5ng" # Dr. Zye
                    "UCEEVcDuBRDiwxfXAgQjLGug" # Dreams of Autonomy
                    "UCWQaM7SpSECp9FELz-cHzuQ" # Dreams of Code
                    "UCT7JcTffv7NsTMa4jbr-oQw" # Ellie Rasmussen
                    "UCwBhBDsqiQflTMLy2epbQVw" # Emergent Garden
                    "UCsWaVYzOFvEWDsEuvuZJ-8A" # EmergentMind
                    "UCv67fDx_0CPnWK_XISUzdyQ" # EndVertex
                    "UCCZkc96h2dlElrfYmMWr8KQ" # Engineer Bo
                    "UCZ_cuJGBis0vi6U3bWmvDIg" # FaceDev
                    "UCsBjURrPoezykLs9EqgamOA" # Fireship
                    "UCyNtlmLB73-7gtlBz00XOQQ" # Folding Ideas
                    "UCUPpIIEpCpuy-5BeSwFSLzQ" # Foudo
                    "UCDRhoKKIzUZrJPzLCHo9s-w" # Fractal Philosophy
                    "UCbWcXB0PoqOsAvAdfzWMf0w" # Fredrik Knudsen
                    "UC7M-Wz4zK8oikt6ATcoTwBA" # Freya Holmér
                    "UCniqJdv-ZQHj1w1Xg6eLWYA" # From Scratch
                    "UCa5uMMs0cVg9opJt_Kw3HLA" # Futurology — An Optimistic Future
                    "UCn_FAXem2-e3HQvmK-mOH4g" # GLITCH
                    "UCCk6atPf8zBPd-5C7rgEkRg" # Gneiss Name
                    "UCwffSP9kO8pMZVr1Ugqvbzw" # HTX Studio
                    "UCVbpA94Zek3v6wZ8E2Dh60g" # Hiding in Public
                    "UCkCGANrihzExmu9QiqZpPlQ" # How Money Works
                    "UCjWrRy5b2fntu1-u5EiFNtw" # HyperNeutrino
                    "UCmEzz-dPBVrsy4ZluSsYHDg" # Hyperplexed
                    "UCJLZe_NoiG0hT7QCX_9vmqw" # I did a thing
                    "UCR1D15p_vdP3HkrH8wgjQRw" # Internet Historian
                    "UCeTfBygNb1TahcNpZyELO8g" # Jacob Geller
                    "UC6Ii2PPnHDkjLTJJQgOw7sQ" # Jeaney Collects
                    "UCmb7zAvq9IxHi_UnP93AVSQ" # Jesse Welles
                    "UCxkM67T_Iele-mRVUiBkRqg" # Jet Lag: The Game
                    "UCRRDyhBaxOCv88mwwZmVFiQ" # Joon
                    "UCRb6Mw3fJ6OFzp-cB9X29aA" # Junferno
                    "UCa8W2_uf81Ew6gYuw0VPSeA" # Juxtopposed
                    "UC7UukP_hxrOsrwHrcHxOxxg" # Kay Lack
                    "UCJZv4d5rbIKd4QHMPkcABCw" # Kevin Powell
                    "UCyefgpUZSjfXhlF5QZVGoUw" # Krzyhau
                    "UC5GA5nrjEdAGHsYwmDOpEfQ" # Kumo Blender
                    "UCRcgy6GzDeccI7dkbbBna3Q" # LEMMiNO
                    "UCHqDTfIX-0DGaHlWvv6JZCw" # Lateral with Tom Scott
                    "UCJXa3_WNNmIpewOtCHf3B0g" # LaurieWired
                    "UC3_kehZbfRz-KrjXIqeIiPw" # Leadhead
                    "UCdM0LgFN54j-pRL-P0Ea_lg" # LearnThatStack
                    "UCto7D1L-MiRoOziCXK9uT5Q" # Let's Game It Out
                    "UCSp-OaMpsO8K0KkOqyBl7_w" # Let's Get Rusty
                    "UC-qC-Fmxe949YVQrOYb8NrA" # Levi Magony
                    "UCeZyoDTk0J-UPhd7MUktexw" # LibrePhoenix
                    "UCXuqSBlHAE6Xw-yeJA0Tunw" # Linus Tech Tips
                    "UCnHX5FjwtQpxkCGziuh4NJA" # Logan Smith
                    "UCLusf7tT1gGAcoZbGwVAR5w" # MARKitekta
                    "UC9OFDumeHCcZfzUKZW8F7gw" # MallBat
                    "UC0SNGrU20N1Q0SPWimGu7gQ" # Malloc
                    "UCqf_y7wvdWBYcJ0YkifFdKg" # MarbleScience
                    "UCxq5GS5pcR0SNazjC3qYQSQ" # Marblr
                    "UCY1kMZp36IQSyNx_9h4mpCg" # Mark Rober
                    "UCckETVOT59aYw80B36aP9vw" # MatthiasWandel
                    "UCb31gOY6OD8ES0zP8M0GhAw" # Max Fosh
                    "UC2wNnyb3vWhOt0K6LpBrtGg" # Mental Checkpoint
                    "UClUc_jq1BuEczLm0asOeNcw" # Mirabeau Studios
                    "UCj2iyEUusvLJlWAS8HV4y1Q" # Miss Twisted
                    "UCSJ2epYmnRCdXWWg_xjpgfA" # Momo PTFL
                    "UCX6OQ3DkcsbYNE6H8uQQuVA" # MrBeast
                    "UCr0oCYeULCgv--aP0WMsWBw" # Nachtwind
                    "UCSdma21fnJzgmPodhC9SJ3g" # NakeyJakey
                    "UCSRp5VNnG16gd80vNZp4neA" # Neoly
                    "UCggHsHce2n3vvbJf_8YKrMA" # Nerdforge
                    "UC4oq9HdusDHPKChMP3tuFxw" # Nervadof
                    "UCpFFItkfZz1qz5PpHpqzYBw" # Nexpo
                    "UCz-yrxeZYIYdpEZgHGvIydA" # Nic Barker
                    "UC58IKuPHnZkdCZ6T5mSRGCg" # Night Mind
                    "UCFtc3XdXgLFwhlDajMGK69w" # NightHawkInLight
                    "UCFhXFikryT4aFcLkLw2LBLA" # NileRed
                    "UCUMwY9iS8oMyWDYIe6_RmoA" # No Boilerplate
                    "UCXtsVKa5592wMCigq_bfjlQ" # NoBS Code
                    "UCNIXUCzBMXoWu69iDOtbx5A" # Nomad Push
                    "UCj74rJ9Lgl3WTngq675wxKg" # Noodle
                    "UCXh9mHdcBD-3aGCiECZMP1Q" # Not An Engineer
                    "UCQeDjGVRTWAApRmP_xFWaRA" # Not David
                    "UC0intLFzLaudFG-xAvUEO-A" # Not Just Bikes
                    "UCSVbNLYVIBrNQmtOPCFcD1A" # Ooqui
                    "UC-lHJZR3Gqxm24_Vd_AJ5Yw" # PewDiePie
                    "UCFR-QlAx0qFHN9-QmcrpHnQ" # Pezzza's Work
                    "UCeXksuVW8H1x9v4gh7DWoyQ" # Physics for the Birds
                    "UCiMxz108IEFwYsiYIp1ZvLw" # PixelzwithaZ
                    "UC2YWpSMLrUNUoPoavgmiIoQ" # PolyaMath
                    "UCQBQeWDycPczq1zril7hHHg" # Polylog
                    "UCjGwX6OWGYxJpdS4udyzlyg" # Portal 2: Community Edition
                    "UCx-PpwbajI5ToAY0WwJO2Kg" # PortalRunner
                    "UCmEmX_jw_pRp5UbAdzkZq-g" # Posy
                    "UC2TRpRpIB9R1HrBSCkKnPaQ" # Potomy
                    "UCMOqf8ab-42UUQIdVoKwjlQ" # Practical Engineering
                    "UCpwIxbmFFNeU4EtlLHmFShA" # Premature Abstraction
                    "UCKzJFdi57J53Vr_BkTfN3uQ" # Primer
                    "UCt1XYkNgMJuIrYn84rpuDnQ" # Quantum Developer
                    "UCzGSyu4UQm4UGSlmpMlRozg" # Quiietjay
                    "UCfHmyqCntYHQ81ZukNu66rg" # Razbuten
                    "UCSp46R5hLdz3v9FeQIiOEwQ" # Rei Akaridge
                    "UC-ufRLYrXxrIEApGn9VG5pQ" # Reject Convenience
                    "UCVVfZqD4M8RrshfCBsBK_Xg" # RemmitingFall
                    "UChRxI4p6X8u7vCaRmpHK-rw" # Riloe
                    "UCOMNjGz5ZPKgK9dsg-Q5weQ" # SSSP
                    "UCmtyQOKKmrMVaKuRXz02jbQ" # Sebastian Lague
                    "UCpimbHDD86lfAg4-D8pLLlg" # Shoko
                    "UCcY_-mkCVSd8LwkOFN-GkPQ" # SillyPau
                    "UCEwhtpXrg5MmwlH04ANpL8A" # SimonDev
                    "UC6107grRI4m0o2-emgoDnAA" # SmarterEveryDay
                    "UCSju5G2aFaWMqn-_0YBtq5A" # Stand-up Maths
                    "UCm5mt-A4w61lknZ9lCsZtBw" # Steve Brunton
                    "UCEIwxahdLz7bap-VDs9h35A" # Steve Mould
                    "UCJZ0pbf29b2nrLde-a-LuDQ" # Streetcraft
                    "UCj1VqrHhDte54oLgPG4xpuQ" # Stuff Made Here
                    "UC9o-c3jnKS_rKJTlfFjVY9g" # SyedHussimDev
                    "UCdbetV_5wxUnBTdb_d51qoA" # Synthet
                    "UCusb0SpT8elBJdbcEJS_l2A" # Tale Foundry
                    "UCl_dlV_7ofr4qeP1drJQ-qg" # Tantacrul
                    "UChl_NKOs1qqh_x7yJfaDpDw" # Tantan
                    "UCjSEJkpGbcZhvo0lr-44X_w" # TechHut
                    "UCeeFfhMcJa1kjtfZAGskOCA" # TechLinked
                    "UCy0tKL1T7wFoYcxCe0xjN6Q" # Technology Connections
                    "UC1VLQPn9cYSqx8plbk9RxxQ" # The Action Lab
                    "UC5UAwBUum7CPN5buc-_N1Fw" # The Linux Experiment
                    "UCcem9I78ybZLHLRUlkUO3sw" # The Proper People
                    "UCV5vCi3jPJdURZwAOO_FNfQ" # The Thought Emporium
                    "UCcmEL8JoDBE25gvCFkrqhcw" # TheVolgun
                    "UCSbdMXOI_3HGiFviLZO6kNA" # ThrillSeeker
                    "UCaXh9z3or5QbM0HPGen2Quw" # TodePond
                    "UC67gfx2Fg7K2NSHqoENVgwA" # Tom Stanton
                    "UCVQa3eDp9rFpKw3LZ3AsMCg" # Um, Actually
                    "UCMX1A8WPVQtOTZmanT8YseA" # Useless Game Dev
                    "UCe0DNp0mKMqrYVaTundyr9w" # VaatiVidya
                    "UCMwLVepB4YOgpyo48iyg7HA" # Vercidium
                    "UCHnyfMqiRRG1u-2MsSQLbXA" # Veritasium
                    "UCsCnD4lVDN7mYNAWmjQchwQ" # Vertex Arcade
                    "UC_zBdZ0_H_jn41FDRG7q4Tw" # Vimjoyer
                    "UC6nSFpj9HTCZ5t-N3Rm3-HA" # Vsauce
                    "UConVfxXodg78Tzh5nNu85Ew" # Welch Labs
                    "UCop6aovOTLqHsw2IgrRgYTQ" # Whatcookie
                    "UCyiCGuV7iQJhIx7QhG6yLHg" # WhatsItLike
                    "UCLLj278KKxRAIJ1ZdNY4nsg" # Will Morrison
                    "UCbguawtJlHjxXzdAskubQVg" # William Osman 2
                    "UC0G7e3uCtTyKQy2vZbRaKxg" # Works By Design
                    "UC1X4v8N9U3qnVl6zzuEtUqQ" # Wumbo
                    "UC2_X49uo6B7jSVSOwJSjznQ" # YukkoEX
                    "UCUW49KGPezggFi0PGyDvcvg" # Zack Freedman
                    "UCctd5MdW-o2lRMwgogoUZHQ" # Zanzlanz
                    "UC4ioPEsmoihUiV_0IP0Pkew" # [][][][][] [][] [][𝑥][][][][][][][].
                    "UCmMubqzMeJDrW7u6d4SJh-Q" # a_lilian
                    "UCtEwVJZABCd0tels2KIpKGQ" # aarthificial
                    "UCUxIu91gGsK9Q0tTcQM8iNw" # abe's projects
                    "UCwPdVunI5mD-dpuLogOawbw" # adumb
                    "UCUVzyC4knaI7IHeMKyRaDYw" # allen's lab
                    "UCsyoRY68bchruU8JgIA3dyQ" # astryuuna
                    "UC5--wS0Ljbin1TjWQX6eafA" # bigboxSWE
                    "UCCokj-ZnFWavlYfQNtHHn4Q" # brahkie
                    "UCV4Rx1m-9HmtqHET7GjnVOA" # braintruffle
                    "UCUmd1iHHPmGO-CXVmwPuLyA" # camwing
                    "UC9z7EZAbkphEMg0SP7rw44A" # carykh
                    "UC5KlA1-QEEb5INm48mfyzLA" # chantako
                    "UCp68_FLety0O-n9QU6phsgw" # colinfurze
                    "UCsrxrOtjmWnH5FJhJnkTRBg" # cubicmetre
                    "UCrk2bNxxxLP-Qd77KxBJ3Xg" # diinki
                    "UCimiUgDLbi6P17BdaCZpVbg" # exurb1a
                    "UCf_mM4e4fKMnLHyagLPpA0A" # green hoodie cat
                    "UCc5MSmIx-pROLCviehbvlLw" # harry blends
                    "UClt01z1wHHT7c5lKcU8pxRQ" # hbomberguy
                    "UCjFXxPECBuCPUJP9i1usJlA" # iris olympia
                    "UC-BIyaiQIzNbjXErkDRCqXg" # ito can't sleep
                    "UCqf0X7s2oubwgX1MvBqH7ZA" # josh (with parentheses)
                    "UCkaRHEADYAt97-QeVcKXj2A" # kodiakwhale
                    "UCqSSszY8L-Qfn4HKAllnxVg" # leddoo
                    "UCz28y3fThmxHaIh7Zl-i6KA" # mattbatwings
                    "UCUHW94eEFW7hkUMVaZz4eDg" # minutephysics
                    "UCeEf90AEmmxaQs5BUkHqR3Q" # mitxela
                    "UC1GIcHjdwQW7Bo-W4gqG49g" # mrkogamedev
                    "UC7EUiC7Jl-1rzwuepuIz5vw" # optozorax
                    "UCCQF_BTf5_hGC7QS4jSi9-Q" # optozorax second channel
                    "UCj4OTbKSiCxjGoQhalUvrdg" # runevision
                    "UCRORSN_alHEPyyM_x27wBXQ" # savannahXYZ
                    "UCpXwMqnXfJzazKS5fJ8nrVw" # shiey
                    "UCRsSVa7zu3l5e0CI3j14NrA" # soiboi soft
                    "UCO3AOLFI3GsXAuRhYOR-wyA" # sorry stacy
                    "UCJYJgj7rzsn0vdR7fkgjuIA" # styropyro
                    "UC3azLjQuz9s5qk76KEXaTvA" # suckerpinch
                    "UCqZgilaCgI6P0BD7tPrDXhg" # zacoons
                    "UCe8dQ26klK0jAb5yH0-qotw" # zweek
                    "UCA1VwEPTqVLO2XtuM545Idg" # たたかう伊藤
                    "UCfKA1OFAOHIpL-s4DCaA8iw" # ゆーり🍎🐥〔25〕
                    "UC8W5jDneAuOeFNDAB9-8lmQ" # 原口沙輔
                    # spell-checker: enable
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };
}
