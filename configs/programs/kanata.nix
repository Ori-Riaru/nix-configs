{
  services.kanata = {
    enable = true;
    keyboards = {
      "default" = {
        port = 8008;

        # Basic configuration options
        extraDefCfg = ''
          process-unmapped-keys yes
          concurrent-tap-hold yes
          override-release-on-activation yes
        '';

        config = ''
          ;; =====================
          ;; Basic Configuration
          ;; =====================

          (defvar
            idle-time 50
            tap-time 100
            hold-time 140
            chord-time 200
          )

          ;; Base keyboard layout
          (defsrc
            q w e r    t   y    u     i o p
            a s d f    g   h    j     k l ;
            z x c v    b   n    m     , . /
                  lalt spc ralt rmet  rctl
          )

          ;; ====================
          ;; Aliases & Shortcuts
          ;; ====================

          (defalias
            ;; Text macros
            email (macro o r i - r i a r u S-2 p r o t o n . m e)
            google (macro o r i . r i a r u S-2 g m a i l . c o m)

            ;; General shortcuts
            undo        C-z
            redo        C-S-z
            cut         C-x
            paste       C-v
            cliphist    M-v
            websearch   M-s
            copy        C-c
            find        C-f
            replace     C-h
            save        C-s
            sall        C-a
            sexpand     C-e
            sline       C-l
            back        A-left
            forward     A-rght
            screenshot  M-p
            close       C-w

            ;; Window management
            open     C-o
            pallet   C-p
            launch   M-g
            overview M-o
            quit     M-q
            size     M-r
            size-back M-C-r
            full     M-f
            max      M-S-f
            float    M-w

            ;; Focus movement
            monitor M-d
            focus-left  (tap-hold $tap-time $hold-time M-left  lmet)
            focus-up    (tap-hold $tap-time $hold-time M-up    lalt)
            focus-down  (tap-hold $tap-time $hold-time M-down  lshft)
            focus-right (tap-hold $tap-time $hold-time M-right lctrl)
            move-monitor M-C-d
            move-left   M-C-lft
            move-up     M-C-up
            move-down   M-C-down
            move-right  M-C-rght

            ;; Applications
            ghostty  M-C-g
            firefox  M-C-f
            nautilus M-C-n
            codium   M-C-c
            vesktop  M-C-v
            lights M-l

            ;; Modifiers
            spc  (tap-hold $tap-time $hold-time spc (layer-while-held nav))
            esc  (tap-hold $tap-time $hold-time esc (layer-while-held mouse))
            ret  (tap-hold $tap-time $hold-time ret (layer-while-held num))
            tab  (tap-hold $tap-time $hold-time tab lalt)
            bspc (tap-hold $tap-time $hold-time bspc (layer-while-held menu))

            ;; Mouse
            ms-up      (movemouse-accel-up    1 1000 1 5)
            ms-down    (movemouse-accel-down  1 1000 1 5)
            ms-left    (movemouse-accel-left  1 1000 1 5)
            ms-right   (movemouse-accel-right 1 1000 1 5)

            ;; Dynamic macro recording/playback
            m-rec-1    (dynamic-macro-record 1)
            m-rec-2    (dynamic-macro-record 2)
            m-play-1   (dynamic-macro-play 1)
            m-play-2   (dynamic-macro-play 2)
            m-stop     dynamic-macro-record-stop

            ;; Layer switching
            game      (layer-switch game)
            base      (layer-switch default)
            qwerty    (layer-switch qwerty)
            menu      (layer-while-held menu)
            nav-shift (layer-while-held nav-shift)
            gamenum   (layer-while-held gamenum)
            typing (tap-dance-eager 500 (
              (tap-hold $tap-time $hold-time ret (layer-while-held default-game))
              (layer-while-held num)
            ))

            ;; Special functions
            .tp (switch
                  () (multi
                    (layer-switch typing)
                    (on-idle $idle-time tap-vkey to-base)
                  ) break
                )

            .spc-typing (multi (layer-switch default) spc)
          )

          ;; =====================
          ;; Templates & Helpers
          ;; =====================

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

          ;; =====================
          ;; Chord Definitions
          ;; =====================

          (defchordsv2
            ;; Global chords
            (w e) tab              $chord-time first-release (game gamenum qwerty typing nav)
            (x c) (caps-word 1000) $chord-time first-release (game gamenum qwerty typing)
            (e r) /                $chord-time first-release (game gamenum qwerty typing)
            (q w) S-`              $chord-time first-release (game gamenum qwerty typing)

            ;; Navigation chords
            (p spc)   C-v    $chord-time first-release (        game qwerty gamenum num typing)
            (j k)     home   $chord-time first-release (default game qwerty gamenum num typing)
            (j k spc) home   $chord-time first-release (        game qwerty gamenum num typing)
            (k l)     end    $chord-time first-release (default game qwerty gamenum num typing)
            (k l spc) end    $chord-time first-release (        game qwerty gamenum num typing)
            (d j k)   S-home $chord-time first-release (default game qwerty gamenum num typing)
            (d k l)   S-end  $chord-time first-release (default game qwerty gamenum num typing)

            ;; Number/Symbol chords
            (a s) }   $chord-time first-release (default game qwerty gamenum nav typing)
            (s d) S-} $chord-time first-release (default game qwerty gamenum nav typing)
            (d f) S-0 $chord-time first-release (default game qwerty gamenum nav typing)
            (a f) S-, $chord-time first-release (default game qwerty gamenum nav typing)
          )

          ;; =====================
          ;; Key Overrides
          ;; =====================

          (defvirtualkeys
            to-base (layer-switch default)
          )

          (defoverrides
            (lsft .)    (,)
            (rsft .)    (,)
            (lsft ,)    (lsft .)
            (lsft bspc) (del)
            (rsft bspc) (del)
          )

          ;; =====================
          ;; Layer Definitions
          ;; =====================

          ;; Default layer
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

            a (t! homerowmod       $tap-time 150 a lmet)
            s (t! homerowmod       $tap-time 150 o lalt)
            d (t! homerowmodfilter $tap-time 140 e lsft (a b))
            f (t! homerowmod       $tap-time 140 u lctl)
            g (multi i @.tp)
            h (multi d @.tp)
            j (t! homerowmod       $tap-time 140 h rctl)
            k (t! homerowmodfilter $tap-time 140 t rsft (j))
            l (t! homerowmod       $tap-time 150 n ralt)
            ; (t! homerowmod       $tap-time 150 s rmet)

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
            rmet @bspc
            rctl @bspc
          )

          (deflayermap (default-game)
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

            a (tap-hold             $tap-time 150 a lmet)
            s (tap-hold             $tap-time 150 o lalt)
            d (tap-hold-except-keys $tap-time 140 e lsft (a b))
            f (tap-hold             $tap-time 140 u lctl)
            g i
            h d
            j (tap-hold             $tap-time 140 h rctl)
            k (tap-hold-except-keys $tap-time 140 t rsft (j))
            l (tap-hold             $tap-time 150 n ralt)
            ; (tap-hold             $tap-time 150 s rmet)

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

            lalt @esc
            spc  (tap-hold $tap-time $hold-time spc (layer-while-held nav))
            ralt _
            rmet @bspc
            rctl @bspc
          )

          ;; Additional layers
          (deflayer typing
            ' - . p y   f    g  c r l
            a o e u i   d    h  t n s
            ; q j k x   b    m  w v z
            @esc spc @ret @bspc @bspc
          )

          (deflayer num
            `   S-3 S-7 S-\ S-5 /   1 2 3 =
            <   [   S-[ S-9 S-6 S-8 4 5 6 0
            S-2 S-4 S-/ S-1 \   S-= 7 8 9 -
            . @nav-shift @ret @bspc @bspc
          )

          (deflayer nav
            @quit       @full      @launch     @open        @pallet  @save      @undo    @copy    @cut @paste
            @focus-left @focus-up  @focus-down @focus-right @monitor @find      lft      up       down rght
            @back       @size-back @size       @forward     @float   @sall      @sexpand @sline   _    _
                                               _            _        @nav-shift del del
          )

          (deflayer nav-shift
            @close     @max     @websearch _         _ @cliphist F1 F2 F3 F10
            @move-left @move-up @move-down @move-right @move-monitor @replace F4 F5 F6 F11
            _          _        _          _           _ _        F7 F8 F9 F12
                                           _           _ _        _  _
          )

          (deflayer menu
            @email   @google   _        @screenshot _         @lights @base @game @qwerty _
            @codium  @nautilus @firefox @ghostty    @vesktop  _       left  up    down    right
            @m-rec-1 @m-rec-2  @m-stop  @m-play-1   @m-play-2 prev    pp    volu  voldwn  next
            _       _         _        _           _
          )

          (deflayer mouse
            _          mwl        @ms-up     mwr         _          _    mlft mmid mrgt _
            _     @ms-left   @ms-down   @ms-right        _ _   mlft mmid mrgt _
            _          mbck       mwd        mwu         mfwd       _    _    _    _    _
                                  mlft       mrgt        @menu      _    _
          )

          (deflayer qwerty
            q w e r    t   y    u    i o p
            a s d f    g   h    j    k l ;
            z x c v    b   n    m    , . /
              lalt spc ralt @menu @menu
          )

          (deflayer game
            tab  q w e        r   t   y     up   i     j
            shft a s d        f   g   left  down right ret
            ctl  z x c        v   b   h     u    n     m
                     @gamenum spc @typing   @bspc @bspc
          )

          (deflayer gamenum
            esc 1 2 3 - +   F1 F2  F3  F4
            tab 4 5 6 0 S-8 F5 F6  F7  F8
            /  7 8 9 .  =   F9 F10 F11 F12
                  _ _ _ _ _
          )
        '';
      };
    };
  };
}
