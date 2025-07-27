{pkgs, ...}: {
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
            tap-time 120
            hold-time 170
           )

           (defoverrides
            (lsft .) (,)
            (rsft .) (,)
            (lshft ,) (lsft .)
            (lsft bspc) (del)
            (rsft bspc) (del)
          )

           (defalias
            ;; home row mods
            a (tap-hold $tap-time $hold-time a lmet)
            o (tap-hold $tap-time $hold-time o lalt)
            e (tap-hold $tap-time $hold-time e lsft)
            u (tap-hold $tap-time $hold-time u lctl)
            h (tap-hold $tap-time $hold-time h rctl)
            t (tap-hold $tap-time $hold-time t rsft)
            n (tap-hold $tap-time $hold-time n ralt)
            s (tap-hold $tap-time $hold-time s rmet)

            ;; layer switching
            spc (tap-hold $tap-time $hold-time spc (layer-while-held nav))
            esc (tap-hold $tap-time $hold-time esc (layer-while-held menu))
            ret (tap-hold $tap-time $hold-time ret (layer-while-held num))
            game (layer-switch game)
            base (layer-switch default)
            menu (layer-while-held menu)
            qwerty (layer-while-held qwerty)
            nav-shift (layer-while-held nav-shift)

            ;; macros
            undo C-z
            redo C-S-z
            cut C-x
            paste C-v
            copy C-c
            find C-f
            replace C-h
            sall C-a
            sword (macro C-right C-left C-S-right)
            sexpand C-w
            launch M-g
            size M-r
            email (macro o r i - r i a r u S-2 p r o t o n . m e)
            back A-left
            forward A-rght
            pallet C-p

            ;; window navigation
            quit M-q
            full M-f
            max M-S-f
            float M-v
            overview M-o
            focus-left (tap-hold $tap-time $hold-time M-left lmet)
            focus-up (tap-hold $tap-time $hold-time M-up lalt)
            focus-down (tap-hold $tap-time $hold-time M-down lshft)
            focus-right (tap-hold $tap-time $hold-time M-right lctrl)
            move-left M-C-lft
            move-up M-C-up
            move-down M-C-down
            move-right M-C-rght

            ;; gaming layer
            tab (tap-hold $tap-time $hold-time tab lalt)
            gesc (tap-hold $tap-time $hold-time esc (layer-while-held gamenum))
          )

          (defchordsv2
            ;;all
            (a w) tab 100 all-released ()

            ;; nav only
            (j k) home 50 all-released (default game gamenum num)
            (l ;) end 50 all-released (default game gamenum num)
            (d j k) S-home $hold-time all-released (default game gamenum num)
            (d l ;) S-end $hold-time all-released (default game gamenum num)

            ;; num only
            (a z) S-, $hold-time all-released (default game gamenum nav)
            (s x) S-} $hold-time all-released (default game gamenum nav)
            (d c) }   $hold-time all-released (default game gamenum nav)
            (f v) S-0 $hold-time all-released (default game gamenum nav)
          )

          (deflayer default
            ' - . p  y  f      g     c    r  l
            @a @o @e @u i      d     @h   @t @n @s
            ;  q  j  k  x      b     m    w  v  z
                     @esc @spc @ret  bspc bspc
          )

          ( deflayer num
             S-5 S-4 S-7 S-3 `   S-=  7     8 9 S-8
             <   [   S-[ S-9 S-` 0    4     5 6 .
             S-2 S-\ S-/ S-1 \   =    1     2 3 /
                         _   _   _  _ _
          )

          (deflayer nav
             @quit       @full     @size       @pallet      @overview @redo @undo  @cut   @copy @paste
             @focus-left @focus-up @focus-down @focus-right @launch   @find lft    up     down  rght
             @back        pgup      pgdn       @forward     @float    _     @sword @sall  @sexpand  _
                                               _            _         @nav-shift   del del
          )

          (deflayer nav-shift
            _          @max     _          _           _  _ _ _ _ _
            @move-left @move-up @move-down @move-right _  @replace _ _ _ _
            _          _        _ _                    _  _ _ _ _ _
                  _                                    _  _  _ _
          )

          (deflayer menu
             _ _       _     _     @email _ volu mute voldwn _
             _ @qwerty @game @base _      _ prev pp   next  _
             _ _       _     _     _      _ _    _    _     _
                             _     _      _ _    _
          )

          (deflayer qwerty
            q w e r    t   y    u     i o p
            a s d f    g   h    j     k l ;
            z x c v    b   n    m     , . /
                  lalt spc ralt  rmet rctl
          )

          (deflayer game
            @tab  q w e    r   t   y     up   i     _
            shft a s d     f   g   left  down right _
            ctl  z x c     v   b   h     _    _     m
                     @gesc spc ret @menu @menu
          )

          (deflayer gamenum
             _ 6 7 8 9      e _ _ _ _
             1 2 3 4 5      _ _ _ _ _
             _ _ _ _ _      _ _ _ _ _
                   _ _      _ _ _
          )
        '';
      };
    };
  };
}
