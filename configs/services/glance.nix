{settings, ...}: {
  services.glance = {
    enable = true;
    openFirewall = true;
    settings = {
      server = {
        host = "${settings.serverTailscaleIP}";
        port = 8080;
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
                      links = [
                        {
                          title = "Github";
                          url = "https://github.com/";
                        }
                        {
                          title = "Anilist";
                          url = "https://anilist.co/";
                        }
                        {
                          title = "Proton";
                          url = "https://mail.proton.me/u/4/inbox";
                        }
                        {
                          title = "Claude";
                          url = "https://claude.ai/";
                        }
                        {
                          title = "Letterboxd";
                          url = "https://letterboxd.com/";
                        }
                        {
                          title = "My Void";
                          url = "https://my.v0id.nl/";
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "videos";
                  channels = [
                    "UCshObcm-nLhbu8MY50EZ5Ng" # Benn Jordan
                    "UCx_Qyb3447P9bBaT4o8QSjQ" # LilAggy
                    "UCdBXOyqr8cDshsp7kcKDAkg" # Big A
                    "UCXuqSBlHAE6Xw-yeJA0Tunw" # Linus Tech Tips
                    "UCKtix2xNNXdcEfEFnoOnvMw" # Aliensrock
                    "UCZXW8E1__d5tZb-wLFOt8TQ" # Bog
                    "UCxkM67T_Iele-mRVUiBkRqg" # Jet Lag: The Game
                    "UCNIXUCzBMXoWu69iDOtbx5A" # Nomad Push
                    "UCpXwMqnXfJzazKS5fJ8nrVw" # shiey
                    "UCgv4dPk_qZNAbUW9WkuLPSA" # Atrioc
                    "UCbguawtJlHjxXzdAskubQVg" # William Osman 2
                    "UCKzJFdi57J53Vr_BkTfN3uQ" # Primer
                    "UCeeFfhMcJa1kjtfZAGskOCA" # TechLinked
                    "UCLNGY9N9Xmnc2kUpHoSJ5ng" # Dr. Zye
                    "UCQeDjGVRTWAApRmP_xFWaRA" # Not David
                    "UC58IKuPHnZkdCZ6T5mSRGCg" # Night Mind
                    "UC6biysICWOJ-C3P4Tyeggzg" # Low Level
                    "UCHnyfMqiRRG1u-2MsSQLbXA" # Veritasium
                    "UC3_kehZbfRz-KrjXIqeIiPw" # Leadhead
                    "UC3azLjQuz9s5qk76KEXaTvA" # suckerpinch
                    "UCkCGANrihzExmu9QiqZpPlQ" # How Money Works
                    "UCSp-OaMpsO8K0KkOqyBl7_w" # Let's Get Rusty
                    "UC9o-c3jnKS_rKJTlfFjVY9g" # SyedHussimDev
                    "UCSpFnDQr88xCZ80N-X7t0nQ" # Corridor Crew
                    "UCXSFnQc5niQR7jHMf0U7aQA" # Dev Detour
                    "UCusb0SpT8elBJdbcEJS_l2A" # Tale Foundry
                    "UCUW49KGPezggFi0PGyDvcvg" # Zack Freedman
                    "UCj1VqrHhDte54oLgPG4xpuQ" # Stuff Made Here
                    "UCWizIdwZdmr43zfxlCktmNw" # Alec Steele
                    "UCdM0LgFN54j-pRL-P0Ea_lg" # LearnThatStack
                    "UCb31gOY6OD8ES0zP8M0GhAw" # Max Fosh
                    "UCHCLaCRBrMIWCLcW9EsEnZA" # Alice Lunazera
                    "UC5UAwBUum7CPN5buc-_N1Fw" # The Linux Experiment
                    "UCNJ1Ymd5yFuUPtn21xtRbbw" # AI Explained
                    "UChrYe70o7NmDioL02PRVWVg" # MattKC
                    "UConVfxXodg78Tzh5nNu85Ew" # Welch Labs
                    "UCfeonoaE60LpuJLlBidc5IA" # Reid Captain
                    "UCpwIxbmFFNeU4EtlLHmFShA" # Premature Abstraction
                    "UCWQaM7SpSECp9FELz-cHzuQ" # Dreams of Code
                    "UCPX22eBpVB8bDVOb6BbhrlQ" # Blargis
                    "UC6LBo0GXFaUtf-mWccqfw-w" # The Backlogs
                    "UCSW_6zSlR7mn6Gqh-njFWFw" # Artem Yashin
                    "UCoxcjq-8xIDTYp3uz647V5A" # Numberphile
                    "UC6Ii2PPnHDkjLTJJQgOw7sQ" # Jeaney Collects
                    "UCV5vCi3jPJdURZwAOO_FNfQ" # The Thought Emporium
                    "UCFR-QlAx0qFHN9-QmcrpHnQ" # Pezzza's Work
                    "UCJfJWct8jN1RpCuVWk3zHTA" # Daryl Talks Games
                    "UCHqDTfIX-0DGaHlWvv6JZCw" # Lateral with Tom Scott
                    "UCmb7zAvq9IxHi_UnP93AVSQ" # Jesse Welles
                    "UCGKEMK3s-ZPbjVOIuAV8clQ" # Core Dumped
                    "UC7EUiC7Jl-1rzwuepuIz5vw" # optozorax
                    "UCI7XWNL-pkqYeY9MLyL5roQ" # 2AM
                    "UCRRDyhBaxOCv88mwwZmVFiQ" # Joon
                    "UCGpoeEhUBQBaaKZ_a8HB67Q" # Coding2GO
                    "UCeXksuVW8H1x9v4gh7DWoyQ" # Physics for the Birds
                    "UC9-y-6csu5WGm29I7JiwpnA" # Computerphile
                    "UCwbRile4jo-LcW_PQwmMdBw" # Captain KRB
                    "UCV4Rx1m-9HmtqHET7GjnVOA" # braintruffle
                    "UCnBYZ7OshtQyAOo9hHq_KMQ" # Aurailus
                    "UC4teYwW5DI82AbRmV_Fq7TQ" # Deckard
                    "UCR1IuLEqb6UEA_zQ81kwXfg" # Real Engineering
                    "UC2avWDLN1EI3r1RZ_dlSxCw" # Integza
                    "UCCk6atPf8zBPd-5C7rgEkRg" # Gneiss Name
                    "UCj2iyEUusvLJlWAS8HV4y1Q" # Miss Twisted
                    "UCQdI1zYa-0MvrGpCPNYj2CA" # Urban Planner Explained
                    "UC1VLQPn9cYSqx8plbk9RxxQ" # The Action Lab
                    "UCDRhoKKIzUZrJPzLCHo9s-w" # Fractal Philosophy
                    "UC9z7EZAbkphEMg0SP7rw44A" # carykh
                    "UCcWZY8dxd4HhlH5vY_Luzgw" # CyanVoxel
                    "UCH_7doiCkWeq0v3ycWE5lDw" # Any Austin
                    "UCrv269YwJzuZL3dH5PCgxUw" # CodeParade
                    "UCcem9I78ybZLHLRUlkUO3sw" # The Proper People
                    "UC5--wS0Ljbin1TjWQX6eafA" # bigboxSWE
                    "UCu6mSoMNzHQiBIOCkHUa2Aw" # Cody'sLab
                    "UCYeiozh-4QwuC1sjgCmB92w" # DevOps Toolbox
                    "UCy0tKL1T7wFoYcxCe0xjN6Q" # Technology Connections
                    "UCckETVOT59aYw80B36aP9vw" # MatthiasWandel
                    "UCFsUH7Zyy0UXAfv6KQGq9eg" # Noggi
                    "UC2_X49uo6B7jSVSOwJSjznQ" # YukkoEX
                    "UCfIqCzQJXvYj9ssCoHq327g" # How To Make Everything
                    "UCpwl7jNE9PJc-lBTShNs5TQ" # Coding with Sphere
                    "UChl_NKOs1qqh_x7yJfaDpDw" # Tantan
                    "UC_zBdZ0_H_jn41FDRG7q4Tw" # Vimjoyer
                    "UCuWLGQB4WRBKvW1C26zA2og" # Daedalus Community
                    "UCmEzz-dPBVrsy4ZluSsYHDg" # Hyperplexed
                    "UCU496leq6TmIPrdEaJ9ATxw" # Derafog
                    "UCop6aovOTLqHsw2IgrRgYTQ" # Whatcookie
                    "UCr3cBLTYmIK9kY0F_OdFWFQ" # Casually Explained
                    "UCUxIu91gGsK9Q0tTcQM8iNw" # abe's projects
                    "UCto7D1L-MiRoOziCXK9uT5Q" # Let's Game It Out
                    "UCb_MAhL8Thb3HJ_wPkH3gcw" # Phil Edwards
                    "UCUmd1iHHPmGO-CXVmwPuLyA" # camwing
                    "UCx-PpwbajI5ToAY0WwJO2Kg" # PortalRunner
                    "UCUuMYw2l2UeWyTGYixYfRCA" # Evan and Katelyn
                    "UCJZv4d5rbIKd4QHMPkcABCw" # Kevin Powell
                    "UCoUmahSj6YHyUb8kuGR-lwg" # Drumsy
                    "UCggHsHce2n3vvbJf_8YKrMA" # Nerdforge
                    "UC2YWpSMLrUNUoPoavgmiIoQ" # PolyaMath
                    "UCMOqf8ab-42UUQIdVoKwjlQ" # Practical Engineering
                    "UCCQF_BTf5_hGC7QS4jSi9-Q" # optozorax second channel
                    "UCz28y3fThmxHaIh7Zl-i6KA" # mattbatwings
                    "UCsyoRY68bchruU8JgIA3dyQ" # astryuuna
                    "UCEIwxahdLz7bap-VDs9h35A" # Steve Mould
                    "UC-lHJZR3Gqxm24_Vd_AJ5Yw" # PewDiePie
                    "UCj74rJ9Lgl3WTngq675wxKg" # Noodle
                    "UCp7EwodJcppc6GqiRcnCpOw" # Blender Secrets
                    "UCctd5MdW-o2lRMwgogoUZHQ" # Zanzlanz
                    "UCHL9bfHTxCMi-7vfxQ-AYtg" # Abroad in Japan
                    "UCUHW94eEFW7hkUMVaZz4eDg" # minutephysics
                    "UC92TPuPT-yh2hxUN9JD9LZg" # Computing: the Details
                    "UCmEmX_jw_pRp5UbAdzkZq-g" # Posy
                    "UCphSIVLw-cAidx1Kb0ys-Zg" # astrid ztar
                    "UCSJ2epYmnRCdXWWg_xjpgfA" # Momo PTFL
                    "UC6mIxFTvXkWQVEHPsEdflzQ" # GreatScott!
                    "UC8W5jDneAuOeFNDAB9-8lmQ" # 原口沙輔
                    "UChHxJaKDqH4bOs0pX3hkKnA" # Basically Homeless
                    "UCsrxrOtjmWnH5FJhJnkTRBg" # cubicmetre
                    "UC-ufRLYrXxrIEApGn9VG5pQ" # Reject Convenience
                    "UCSju5G2aFaWMqn-_0YBtq5A" # Stand-up Maths
                    "UC0intLFzLaudFG-xAvUEO-A" # Not Just Bikes
                    "UCqZgilaCgI6P0BD7tPrDXhg" # zacoons 🎄
                    "UC9OFDumeHCcZfzUKZW8F7gw" # MallBat
                    "UCp68_FLety0O-n9QU6phsgw" # colinfurze
                    "UCpFN5_YDQpHMF2XGpV9JKrA" # Chris Staecker
                    "UCn_FAXem2-e3HQvmK-mOH4g" # GLITCH
                    "UCX6OQ3DkcsbYNE6H8uQQuVA" # MrBeast
                    "UC1MmrnDaPnNa55twYBiH4NA" # Polyfjord
                    "UCs-quWodefaZcu4zV4NFCCA" # Lewis is Trying to Animate
                    "UCSbdMXOI_3HGiFviLZO6kNA" # ThrillSeeker
                    "UC05_rCcohJMdYRMW61TPfZw" # efron
                    "UCdbetV_5wxUnBTdb_d51qoA" # Synthet
                    "UCqV402dP2XOA8PFDlMA0iDA" # Alice in Wonder1and
                    "UCsBjURrPoezykLs9EqgamOA" # Fireship
                    "UCeTfBygNb1TahcNpZyELO8g" # Jacob Geller
                    "UC2M2T4FSz1kSqNhhL-n9R9A" # Advanced Tinkering
                    "UCO3AOLFI3GsXAuRhYOR-wyA" # sorry stacy
                    "UC-BIyaiQIzNbjXErkDRCqXg" # ito can't sleep
                    "UC0AJ676UuHdQ0zshDEkyfTA" # Marc Evanstein / music․py
                    "UCsn6cjffsvyOZCZxvGoJxGg" # Corridor Digital
                    "UCFtc3XdXgLFwhlDajMGK69w" # NightHawkInLight
                    "UC5GA5nrjEdAGHsYwmDOpEfQ" # Kumo Blender
                    "UCfHmyqCntYHQ81ZukNu66rg" # Razbuten
                    "UCyiCGuV7iQJhIx7QhG6yLHg" # WhatsItLike
                    "UCE1jXbVAGJQEORz9nZqb5bQ" # Ahoy
                    "UCyAUKU-gFG86xLn3ypJ3LjQ" # Mia's Paw
                    "UCfBkUgaJ6eqYA9_TX2cmq9A" # 理芽 -RIM-
                    "UCZkyo1y266HHDYGu6C4Qowg" # CreativePaddy
                    "UCzQotxwdNzIELgzNoTnKJeg" # Kamikaze_Shortbus
                    "UC2tN8yIRVdZ8-Ig2REhPPWg" # ano official channel
                    "UClLOsBKtKS8i9N12l6Uza3g" # Azeal
                    "UCQG40havu4kNpB4pxUDQhYQ" # Acerola
                    "UCrk2bNxxxLP-Qd77KxBJ3Xg" # diinki
                    "UCMX1A8WPVQtOTZmanT8YseA" # Useless Game Dev
                    "UCjWrRy5b2fntu1-u5EiFNtw" # HyperNeutrino
                    "UC3KEoMzNz8eYnwBC34RaKCQ" # Simone Giertz
                    "UCg6gPGh8HU2U01vaFCAsvmQ" # Chris Titus Tech
                    "UCh_OTB8eXIdI8E0-TL4alJA" # Samaye
                    "UC2gyBYnMGTCVTEc6UM1gt-A" # Ai Angel
                    "UCfKA1OFAOHIpL-s4DCaA8iw" # ゆーり🍎🐥〔24〕・yuri
                    "UC4oq9HdusDHPKChMP3tuFxw" # G. Nervadof
                    "UCcY_-mkCVSd8LwkOFN-GkPQ" # SillyPau
                    "UC2C_jShtL725hvbm1arSV9w" # CGP Grey
                    "UC7M-Wz4zK8oikt6ATcoTwBA" # Freya Holmér
                    "UCSksodwjNeOQ3Oywr1G4Nag" # Engineezy
                    "UCA2FRonDi81FIkgI-49zV3g" # Azalae
                    "UCiMxz108IEFwYsiYIp1ZvLw" # PixelzwithaZ
                    "UC0SNGrU20N1Q0SPWimGu7gQ" # Malloc
                    "UCr0oCYeULCgv--aP0WMsWBw" # Nachtwind
                    "UCLLj278KKxRAIJ1ZdNY4nsg" # Will Morrison
                    "UCp1GVorJ_63HU8lRfHVK-jg" # Arglin Kampling [Third Gen]
                    "UCf_mM4e4fKMnLHyagLPpA0A" # green hoodie cat
                    "UCqSSszY8L-Qfn4HKAllnxVg" # leddoo
                    "UCIcGc8tDHYZ3vY3NcS8JXaQ" # b2studios
                    "UCSVbNLYVIBrNQmtOPCFcD1A" # Ooqui
                    "UCqf_y7wvdWBYcJ0YkifFdKg" # MarbleScience
                    "UCRsSVa7zu3l5e0CI3j14NrA" # soiboi soft
                    "UCwffSP9kO8pMZVr1Ugqvbzw" # HTX Studio
                    "UCsyXL4K687fGa3fOrbX2yPQ" # Deadlock
                    "UCOMNjGz5ZPKgK9dsg-Q5weQ" # SSSP
                    "UCT7JcTffv7NsTMa4jbr-oQw" # Ellie Rasmussen
                    "UCyNtlmLB73-7gtlBz00XOQQ" # Folding Ideas
                    "UCiNLr9wX35KksK77mrQgxiw" # 2swap
                    "UCbWcXB0PoqOsAvAdfzWMf0w" # Fredrik Knudsen
                    "UCXh9mHdcBD-3aGCiECZMP1Q" # Not An Engineer
                    "UCe8dQ26klK0jAb5yH0-qotw" # zweek
                    "UCR1D15p_vdP3HkrH8wgjQRw" # Internet Historian
                    "UCbCq5Y0WPGimG2jNXhoQxGw" # Atomic Frontier
                    "UCVQa3eDp9rFpKw3LZ3AsMCg" # Um, Actually
                    "UCSlSaMmly1g3RjdNuFQIa_g" # Smellizabeth
                    "UCdVO_WUYVHVuQ8JnJWJHzkQ" # tripflag
                    "UCxq5GS5pcR0SNazjC3qYQSQ" # Marblr
                    "UCsWaVYzOFvEWDsEuvuZJ-8A" # EmergentMind
                    "UCkaRHEADYAt97-QeVcKXj2A" # kodiakwhale
                    "UC6nSFpj9HTCZ5t-N3Rm3-HA" # Vsauce
                    "UC4NNPgQ9sOkBjw6GlkgCylg" # Ben Vallack
                    "UCjREVt2ZJU8ql-NC9Gu-TJw" # Code to the Moon
                    "UCBciYThS5hOiuQ4aOxw4hHg" # Inkbox
                    "UC7Dr19bFdqkkfREMITgY9Vg" # underscores
                    "UCkQPwIetp1enwWKyPP61oVw" # Oddmin
                    "UCJZ0pbf29b2nrLde-a-LuDQ" # Streetcraft
                    "UC2TRpRpIB9R1HrBSCkKnPaQ" # Potomy
                    "UClNikN9BUpb0K7xNB33VihQ" # Make art not content.
                    "UCUv35okF8MSo2dFQx5LrNmA" # Chalk Talk
                    "UCVeuUOqcnoAzOvx9rrvU9FQ" # Tap3boy
                    "UClt01z1wHHT7c5lKcU8pxRQ" # hbomberguy
                    "UChRxI4p6X8u7vCaRmpHK-rw" # Riloe
                    "UCA1VwEPTqVLO2XtuM545Idg" # たたかう伊藤
                    "UCjGwX6OWGYxJpdS4udyzlyg" # Portal 2: Community Edition
                    "UCSdma21fnJzgmPodhC9SJ3g" # NakeyJakey
                    "UC2wNnyb3vWhOt0K6LpBrtGg" # Mental Checkpoint
                    "UCSp46R5hLdz3v9FeQIiOEwQ" # Rei Akaridge
                    "UCEbWPbv8IN8KmE5UFsp1ImA" # RiaRosella
                    "UC7cmH--tFhYduIshTKzQUJQ" # Stylized Station
                    "UCnj5nrmtoxyJPwLYdGdLqpw" # Drenindok
                    "UCzRfLYOv0deo80qzA6uD0zA" # Foone Turing
                    "UCZ_cuJGBis0vi6U3bWmvDIg" # FaceDev
                    "UCv67fDx_0CPnWK_XISUzdyQ" # EndVertex
                    "UCcmEL8JoDBE25gvCFkrqhcw" # TheVolgun
                    "UC-qC-Fmxe949YVQrOYb8NrA" # Levi Magony
                    "UCmfJPEfaEMGTu6CaJNr0AEQ" # Doodley
                    "UCUPpIIEpCpuy-5BeSwFSLzQ" # Foudo
                    "UCMMBpWfWUd3xlcOxrot_neA" # The Virtual Reality Show
                    "UCzLhksxo7oTu0r91TsY9h5Q" # はしメロ
                    "UCLusf7tT1gGAcoZbGwVAR5w" # MARKitekta
                    "UCKTrVE19d1NJ92ak9t3QZKg" # BonelessVR
                    "UCl_dlV_7ofr4qeP1drJQ-qg" # Tantacrul
                    "UCUVzyC4knaI7IHeMKyRaDYw" # allen's lab
                    "UCCQNkmRNM3fPbYeo4XQKogw" # Tahvo
                    "UCCWeRTgd79JL0ilH0ZywSJA" # AlphaPhoenix
                    "UCQBQeWDycPczq1zril7hHHg" # Polylog
                    "UCJW0LKesaIjIM_7GC3wxjZg" # Evan Zhou
                    "UCRb6Mw3fJ6OFzp-cB9X29aA" # Junferno
                    "UCFhXFikryT4aFcLkLw2LBLA" # NileRed
                    "UCt1XYkNgMJuIrYn84rpuDnQ" # Quantum Developer
                    "UClSfrg5hVNhIlwv7hEmVD2g" # Jam2go
                    "UCz-yrxeZYIYdpEZgHGvIydA" # Nic Barker
                    "UCvW5ZYoNR2fkn0xkanZKdWA" # Bryce Bostwick
                    "UC7UukP_hxrOsrwHrcHxOxxg" # Kay Lack
                    "UCqek-BNp_65jxX-zCYBoiWA" # wye
                    "UC5KlA1-QEEb5INm48mfyzLA" # chantako
                    "UCqVEHtQoXHmUCfJ-9smpTSg" # Answer in Progress
                    "UCEEVcDuBRDiwxfXAgQjLGug" # Dreams of Autonomy
                    "UCV0t1y4h_6-2SqEpXBXgwFQ" # AngeTheGreat
                    "UCRcgy6GzDeccI7dkbbBna3Q" # LEMMiNO
                    "UC67gfx2Fg7K2NSHqoENVgwA" # Tom Stanton
                    "UCMwLVepB4YOgpyo48iyg7HA" # Vercidium
                    "UCpFFItkfZz1qz5PpHpqzYBw" # Nexpo
                    "UCtEb98_ptdXj6N6woTfgxVQ" # ICKY
                    "UCwPdVunI5mD-dpuLogOawbw" # adumb
                    "UCRORSN_alHEPyyM_x27wBXQ" # savannahXYZ
                    "UCVbpA94Zek3v6wZ8E2Dh60g" # Hiding in Public
                    "UCdmcAwbdiXQWs9d4Qd4KzDw" # 2 Much ColinFurze
                    "UCJYJgj7rzsn0vdR7fkgjuIA" # styropyro
                    "UC0G7e3uCtTyKQy2vZbRaKxg" # Works By Design
                    "UCsCnD4lVDN7mYNAWmjQchwQ" # Vertex Arcade
                    "UC9pXmjxsQHeFH9vgCeRsHcw" # Brendan Galea
                    "UCmMubqzMeJDrW7u6d4SJh-Q" # a_lilian
                    "UCDrcOrGBdvxMKOPVbrnkl3g" # Bran Sculpts
                    "UClB2t8sIPbneCMz-iHpc-dw" # Cody Gindy
                    "UC1GIcHjdwQW7Bo-W4gqG49g" # mrkogamedev
                    "UCc5MSmIx-pROLCviehbvlLw" # harry blends
                    "UCaSCt8s_4nfkRglWCvNSDrg" # CodeAesthetic
                    "UCXtsVKa5592wMCigq_bfjlQ" # NoBS Code
                    "UCVVfZqD4M8RrshfCBsBK_Xg" # RemmitingFall
                    "UCniqJdv-ZQHj1w1Xg6eLWYA" # From Scratch
                    "UCPvQE9paZfKZ5zE32Rk792Q" # Cadaeic Studios
                    "UCUQo7nzH1sXVpzL92VesANw" # DIY Perks
                    "UCimiUgDLbi6P17BdaCZpVbg" # exurb1a
                    "UCEOXxzW2vU0P-0THehuIIeg" # Captain Disillusion
                    "UCCZkc96h2dlElrfYmMWr8KQ" # Engineer Bo
                    "UC2Kaq_xADsJSi97iWbttPlQ" # MAISONdes -メゾン・デ- / 日曜日のメゾンデ
                    "UCzGSyu4UQm4UGSlmpMlRozg" # Quiietjay
                    "UCeZyoDTk0J-UPhd7MUktexw" # LibrePhoenix
                    "UC4ioPEsmoihUiV_0IP0Pkew" # [][][][][] [][] [][𝑥][][][][][][][].
                    "UCEc1YzMOSKKtJD7H-q71HgQ" # Creepy Nuts
                    "UCY1kMZp36IQSyNx_9h4mpCg" # Mark Rober
                    "UCtEwVJZABCd0tels2KIpKGQ" # aarthificial
                    "UCSRp5VNnG16gd80vNZp4neA" # Neoly
                    "UCXQ97LE03Ks1mW8KfpcQW0A" # Comfee Mug
                    "UClUc_jq1BuEczLm0asOeNcw" # Mirabeau Studios
                    "UCeEf90AEmmxaQs5BUkHqR3Q" # mitxela
                    "UCpimbHDD86lfAg4-D8pLLlg" # Shoko
                    "UCj4OTbKSiCxjGoQhalUvrdg" # runevision
                    "UCW9KvoeUz2CsBwIGh3ux1ew" # Cymaera
                    "UCjFXxPECBuCPUJP9i1usJlA" # iris olympia
                    "UCCokj-ZnFWavlYfQNtHHn4Q" # brahkie
                    "UCUMwY9iS8oMyWDYIe6_RmoA" # No Boilerplate
                    "UCEwhtpXrg5MmwlH04ANpL8A" # SimonDev
                    "UCkUD_8b1JoTL2ipOVtxfNKw" # Will Cogley
                    "UC_4YBM08hcpJqLl3vvgTqXg" # Emily The Engineer
                    "UCYO_jab_esuFRV4b17AJtAw" # 3Blue1Brown
                    "UCcXhhVwCT6_WqjkEniejRJQ" # Wintergatan
                    "UC_znV4_o--GnfqTYxGbBj6w" # CaptainLuma
                    "UCa8W2_uf81Ew6gYuw0VPSeA" # Juxtopposed
                    "UCmtyQOKKmrMVaKuRXz02jbQ" # Sebastian Lague
                    "UC6107grRI4m0o2-emgoDnAA" # SmarterEveryDay
                    "UCJLZe_NoiG0hT7QCX_9vmqw" # I did a thing
                    "UCJXa3_WNNmIpewOtCHf3B0g" # LaurieWired
                    "UCe0DNp0mKMqrYVaTundyr9w" # VaatiVidya
                    "UCqf0X7s2oubwgX1MvBqH7ZA" # josh (with parentheses)
                    "UCaXh9z3or5QbM0HPGen2Quw" # TodePond
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
