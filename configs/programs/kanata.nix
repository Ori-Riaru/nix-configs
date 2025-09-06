{...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      "default" = {
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
          override-release-on-activation yes
        '';
        config = ''
          (defsrc
            q w e r    t   y    u     i o p
            a s d f    g   h    j     k l ;
            z x c v    b   n    m     , . /
                  lalt spc ralt rmet  rctl
          )

          (defvar
            tap-time 200
            hold-time 150
            idle-time 60
          )

          (defvirtualkeys
            to-base (layer-switch default)
          )

          (deftemplate homerowmod (timeouttap timeouthold keytap keyhold)
            (tap-hold $timeouttap $timeouthold
              (multi $keytap  @.tp)
              $keyhold
            )
          )

          (deftemplate homerowmodfilter (timeouttap timeouthold keytap keyhold typinglist)
            (tap-hold-except-keys $timeouttap $timeouthold
              (multi $keytap  @.tp)
              $keyhold
              $typinglist
            )
          )

          (defalias
            ;; layers
            game      (layer-switch game)
            base      (layer-switch default)
            menu      (layer-while-held menu)
            qwerty    (layer-while-held qwerty)
            nav-shift (layer-while-held nav-shift)
            
            ;;gametype
            typing (tap-dance-eager 500 (
                (layer-while-held typing)
                (layer-while-held num)
              )
            )

            spc  (tap-hold $tap-time $hold-time spc (layer-while-held nav))
            esc  (tap-hold $tap-time $hold-time esc (layer-while-held menu))
            ret  (tap-hold $tap-time $hold-time ret (layer-while-held num))
            tab  (tap-hold $tap-time $hold-time tab lalt)
            gesc (tap-hold $tap-time $hold-time esc (layer-while-held gamenum))

            ;; macros
            email (macro o r i - r i a r u S-2 p r o t o n . m e)

            ;; shortcuts
            undo     C-z
            redo     C-S-z
            cut      C-x
            paste    C-v
            cliphist M-v
            copy     C-c
            find     C-f
            replace  C-h
            save     C-s
            sall     C-a
            sexpand  C-w
            back     A-left
            forward  A-rght
            pallet   C-p
            launch   M-g
            overview M-o
            quit     M-q
            size     M-r
            full     M-f
            max      M-S-f
            float    M-w
            focus-left  (tap-hold $tap-time $hold-time M-left  lmet)
            focus-up    (tap-hold $tap-time $hold-time M-up    lalt)
            focus-down  (tap-hold $tap-time $hold-time M-down  lshft)
            focus-right (tap-hold $tap-time $hold-time M-right lctrl)
            move-left  M-C-lft
            move-up    M-C-up
            move-down  M-C-down
            move-right M-C-rght

            .tp (switch
                  ()  (multi
                        (layer-switch typing)
                        (on-idle $idle-time tap-vkey to-base)
                      ) break
                )
            .spc-typing (multi (layer-switch default) spc)
          )

          (defchordsv2
            ;;all
            (w e) tab 100 first-release (game nav)
            (x c) (caps-word 1000) 100 first-release (game typing)
            (e r) / 100 first-release (game typing)
            (q w) S-` 100 first-release (game typing)

           ;; nav only
            (j k) home 150 first-release (default game gamenum num typing)
            (j k spc) home 150 first-release (game gamenum num typing)
            (k l) end 150 first-release (default game gamenum num typing)
            (k l spc) end 150 first-release (game gamenum num typing)
            (d j k) S-home $hold-time first-release (default game gamenum num typing)
            (d k l) S-end $hold-time first-release (default game gamenum num typing)

            ;; num only
            (a z) S-, $hold-time first-release (default game gamenum nav typing)
            (d c) S-} $hold-time first-release (default game gamenum nav typing)
            (s x) }   $hold-time first-release (default game gamenum nav typing)
            (f v) S-0 $hold-time first-release (default game gamenum nav typing)
          )

          (defoverrides
            (lsft .)    (,)
            (rsft .)    (,)
            (lsft ,)    (lsft .)
            
            (lsft bspc) (del)
            (rsft bspc) (del)
          )

          (deflayermap (default)
            q (multi ' @.tp)
            w (multi - @.tp)
            e (multi . @.tp)
            r (multi p @.tp)
            t (multi y @.tp)
            y (multi f @.tp)
            u (multi g @.tp)
            i (multi c @.tp)
            o (multi r @.tp)
            p (multi l @.tp)

            a (t! homerowmod       $tap-time 200 a lmet)
            s (t! homerowmod       $tap-time 200 o lalt)
            d (t! homerowmodfilter $tap-time 160 e lsft (a b))
            f (t! homerowmod       $tap-time 160 u lctl)
            g (multi i @.tp)
            h (multi d @.tp)
            j (t! homerowmod       $tap-time 160 h rctl)
            k (t! homerowmodfilter $tap-time 160 t rsft (j))
            l (t! homerowmod       $tap-time 200 n ralt)
            ; (t! homerowmod       $tap-time 200 s rmet)

            z (multi ; @.tp)
            x (multi q @.tp)
            c (multi j @.tp)
            v (multi k @.tp)
            b (multi x @.tp)
            n (multi b @.tp)
            m (multi m @.tp)
            , (multi w @.tp)
            . (multi v @.tp)
            / (multi z @.tp)

            lalt @esc
            spc  (tap-hold $tap-time $hold-time @.spc-typing (layer-while-held nav))

            ralt @ret
            rmet bspc
            rctl bspc
          )

          (deflayer (typing)
            ' - . p y   f    g   c r l
            a o e u i   d    h   t n s
            ; q j k x   b    m   w v z
                  @esc spc @ret bspc bspc
          )

          (deflayer num
            S-5 S-4 S-7 S-3 ` S-= 7 8 9 =
            <   [   S-[ S-9 _ S-8 4 5 6 0
            S-2 S-\ S-/ S-1 \ /   1 2 3 .
                    @esc   spc  @ret bspc bspc
          )

          (deflayer nav
            @quit       @full     @size       @pallet      @overview @redo      @undo @cut  @copy    @paste
            @focus-left @focus-up @focus-down @focus-right @launch   @find      lft   up    down     rght
            @back       pgup      pgdn        @forward     @float    _          @save @sall @sexpand _
                                              _            _         @nav-shift del del
          )

          (deflayer nav-shift
            _          @max     _          _           _ _        _ _ _ @cliphist
            @move-left @move-up @move-down @move-right _ @replace _ _ _ _
            _          _        _          _           _ _ _ _ _ _
                                           _           _ _ _ _
          )

          (deflayer menu
            _    volu mute voldwn @email  @base @game @qwerty _       _
            left up   down right  _       _     _     _       _       _
            _    prev pp   next   _       _     _     _       _       _
                           _      _       _ _ _
          )

          (deflayer qwerty
            q w e r    t   y    u     i o p
            a s d f    g   h    j     k l ;
            z x c v    b   n    m     , . /
                  lalt spc ralt rmet rctl
          )

          (deflayer game
            @tab q w e     r   t   y     up   i     @menu
            shft a s d     f   g   left  down right ret
            ctl  z x c     v   b   h     _    _     m
                     @gesc spc @typing   bspc bspc
          )

          (deflayer gamenum
            _   1 2 3 _ _ _ _ _ _
            tab 4 5 6 0 _ _ _ _ _
            _   7 8 9 _ _ _ _ _ _
                  _ _ _ _ _
          )
        '';
      };
    };
  };
}
