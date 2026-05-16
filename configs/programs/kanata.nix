{config, ...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      "default" = {
        port = 8008;
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
          override-release-on-activation yes
          dynamic-macro-max-presses 1000
        '';

        config = ''
          (defvar
            tap-time   160
            hold-time  180
            chord-time 200
          )

          ;; Base keyboard layout
          (defsrc
            tab   q w e r t y u i o p
            lctrl a s d f g h j k l ;
            lshft z x c v b n m , . /
            lalt spc esc ret ralt rmet rctl
          )

          ;; === Aliases & Shortcuts ===

          (defalias
            ;; Text macros
            email (macro o r i - r i a r u S-2 p r o t o n . m e)
            google (macro o r i . r i a r u S-2 g m a i l . c o m)

            ;; General shortcuts
            undo       C-z
            redo       C-S-z
            cut        C-x
            paste      C-v
            cliphist   M-v
            websearch  M-s
            copy       C-c
            find       C-f
            replace    C-h
            save       C-s
            sall       C-a
            sexpand    C-e
            sline      C-l
            back       A-left
            forward    A-rght
            screenshot M-p
            close      C-w

            ;; Window management
            open      C-o
            pallet    C-p
            launch    M-g
            overview  M-o
            quit      M-q
            size      M-r
            size-back M-C-r
            h-up      M-h
            h-down    M-C-h
            full      M-f
            max       M-S-f
            float     M-w

            ;; Focus movement
            monitor M-d
            focus-left   (tap-hold $tap-time $hold-time M-left  lmet)
            focus-up     (tap-hold $tap-time $hold-time M-up    lalt)
            focus-down   (tap-hold $tap-time $hold-time M-down  lshft)
            focus-right  (tap-hold $tap-time $hold-time M-right lctrl)
            move-monitor M-C-d
            move-left    M-C-lft
            move-up      M-C-up
            move-down    M-C-down
            move-right   M-C-rght

            ;; Applications
            ghostty  M-C-g
            browser  M-C-f
            nautilus M-C-n
            codium   M-C-c
            vesktop  M-C-v
            lights   M-l

            ;; Modifiers
            esc  (tap-hold $tap-time $hold-time esc (layer-while-held mouse))
            tab  (tap-hold $tap-time $hold-time tab lalt)
            bspc (tap-hold $tap-time $hold-time bspc (layer-while-held menu))

            ;; Dynamic macro recording/playback
            m-rec-1  (dynamic-macro-record 1)
            m-rec-2  (dynamic-macro-record 2)
            m-play-1 (dynamic-macro-play 1)
            m-play-2 (dynamic-macro-play 2)
            m-stop   (dynamic-macro-record-stop-truncate 1)

            ;; Layer switching
            game      (layer-switch game)
            gametype  (layer-switch game-type)
            base      (layer-switch default)
            qwerty    (layer-switch qwerty)
            menu      (layer-while-held menu)
            nav-shift (layer-while-held nav-shift)
            gamenum   (tap-hold $tap-time $hold-time esc (layer-while-held gamenum))
          )

          ;; === Key Overrides ===

          (defoverrides
            (lsft .)    (,)
            (rsft .)    (,)
            (lsft ,)    (lsft .)
            (lsft bspc) (del)
            (rsft bspc) (del)
          )

          ;;  === Chord Definitions ===

          (defchordsv2
            ;; Global chords
            (s d          ) tab    $chord-time first-release (game gamenum qwerty  nav)
            (x c) (caps-word 1000) $chord-time first-release (game gamenum qwerty)
            (w e) /                $chord-time first-release (game gamenum qwerty)
            (q w) S-`              $chord-time first-release (game gamenum qwerty)

            ;; Navigation chords
            (p spc)   C-v    $chord-time first-release  (game qwerty gamenum num)
            (j k)     home   $chord-time first-release (default game qwerty gamenum num)
            (j k spc) home   $chord-time first-release (default game qwerty gamenum num)
            (k l)     end    $chord-time first-release (default game qwerty gamenum num)
            (k l spc) end    $chord-time first-release (default game qwerty gamenum num)
            (d j k)   S-home $chord-time first-release (default game qwerty gamenum num)
            (d k l)   S-end  $chord-time first-release (default game qwerty gamenum num)

            ;; Number/Symbol chord
            (a s) }     $chord-time first-release (default game qwerty gamenum nav)
            ;;(s d) S-} $chord-time first-release (default game qwerty gamenum nav)
            (d f) S-0   $chord-time first-release (default game qwerty gamenum nav)
            (a f) S-,   $chord-time first-release (default game qwerty gamenum nav)
          )

          ;; === Layers ===

          ;; Default layer
          (deflayermap (default)
            q '
            w -
            e .
            r p
            t y
            y f
            u g
            i c
            o r
            p l

            a (tap-hold $tap-time $hold-time a lmet)
            s (tap-hold $tap-time $hold-time o lalt)
            d (tap-hold $tap-time $hold-time e lsft)
            f (tap-hold $tap-time $hold-time u lctl)
            g i
            h d
            j (tap-hold $tap-time $hold-time h rctl)
            k (tap-hold $tap-time $hold-time t rsft)
            l (tap-hold $tap-time $hold-time n ralt)
            ; (tap-hold $tap-time $hold-time s rmet)

            z ;
            x q
            c j
            v k
            b x
            n b
            m m
            , w
            . v
            / z


          ${
            if config.networking.hostName == "lain"
            then ''
              spc  @esc
              esc  (tap-hold $tap-time $hold-time spc (layer-while-held nav))
              ret  (tap-hold $tap-time $hold-time ret (layer-while-held num))
              ralt @bspc
              rctl @bspc
            ''
            else ''
              lalt @esc
              spc  (tap-hold $tap-time $hold-time spc (layer-while-held nav))
              ralt (tap-hold $tap-time $hold-time ret (layer-while-held num))
              rmet @bspc
              rctl @bspc
            ''
          }
          )

          (deflayer num
           _ `   S-3 S-7 S-\ S-5 /   1 2 3 =
           _ <   [   S-[ S-9 S-6 S-8 4 5 6 0
           _ S-2 S-4 S-/ S-1 \   S-= 7 8 9 -
           ${
            if config.networking.hostName == "lain"
            then "_ .          @nav-shift    ret @bspc _     _"
            else ". @nav-shift _             _   ret   @bspc @bspc"
          }
          )

          (deflayer nav
            _ @quit       @full      @launch     @open           @pallet  @save @undo    @copy  @cut @paste
            _ @focus-left @focus-up  @focus-down @focus-right    @monitor @find lft      up     down rght
            _ @back       @size-back @size       @forward        @float   @sall @sexpand @sline _    _
            ${
            if config.networking.hostName == "lain"
            then "_ _ _    @nav-shift del        _   _"
            else "_ _ _    _          @nav-shift del del"
          }
          )

          (deflayer nav-shift
            _ @close     @max     @websearch _              _             @cliphist F1 F2 F3 F10
            _ @move-left @move-up @move-down @move-right    @move-monitor @replace  F4 F5 F6 F11
            _ _          @h-up    @h-down    _              _             _         F7 F8 F9 F12
            _ _ _    _ _ _ _
          )

          (deflayer menu
            _ @email   @google   _        @screenshot    _         @lights @base @game @gametype @qwerty
            _ @codium  @nautilus @browser @ghostty       @vesktop  _       left  up    down    right
            _ @m-rec-1 @m-rec-2  @m-stop  @m-play-1      @m-play-2 prev    pp    volu  voldwn  next
            _ _ _    _ _ _ _
          )

          (deflayer mouse
            _ 0   1 2 3 .       _ mlft mmid mrgt _
            _ -   4 5 6 0       _ mlft mmid mrgt _
            _ C-z 7 8 9 mfwd    _ _    _    _    _
            ${
            if config.networking.hostName == "lain"
            then "_ mlft mrgt    _ @menu _     _"
            else "mlft mrgt _    _ _     @menu @menu"
          }
          )

          (deflayer qwerty
            _ q w e r t    y u i o p
            _ a s d f g    h j k l ;
            _ z x c v b    n m , . /
            ${
            if config.networking.hostName == "lain"
            then "_    lalt spc    _ @menu _     _"
            else "lalt spc  _      _ _     @menu @menu"
          }
          )

          (deflayer game
            _ tab  q w e r    t y    up   i     j
            _ shft a s d f    g left down right ret
            _ ctl  z x c v    b h    u    n     m
            ${
            if config.networking.hostName == "lain"
            then "_        @gamenum spc    _     @bspc _     _"
            else "@gamenum spc      _      _     _     @bspc @bspc"
          }
          )

          (deflayer game-type
            _ tab  ' , . p    y f g c r
            _ shft a o e u    i d h t n
            _ ctl  ; q j k    x b m w v
            ${
            if config.networking.hostName == "lain"
            then "_ @gamenum spc    _ @bspc _     _"
            else "@gamenum spc _    _ _     @bspc @bspc"
          }
          )

          (deflayer gamenum
            _ _   1 2 3 - +      F1 F2  F3  F4
            _ alt 4 5 6 0 S-8    F5 F6  F7  F8
            _ ~   7 8 9 . =      F9 F10 F11 F12
            _ _ _    _ _ _ _
          )
        '';
      };
    };
  };
}
