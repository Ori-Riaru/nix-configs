{...}: {
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
            tap-time 200
            hold-time 150
            idle-time 60
          )

          ;; Base keyboard layout
          (defsrc
            q w e r    t   y    u     i o p
            a s d f    g   h    j     k l ;
            z x c v    b   n    m     , . /
                  lalt spc ralt rmet  rctl
          )

          ;; =====================
          ;; Templates & Helpers
          ;; =====================

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

          ;; =====================
          ;; Aliases & Shortcuts
          ;; =====================

          (defalias
            ;; Layer switching
            game      (layer-switch game)
            base      (layer-switch default)
            qwerty    (layer-switch qwerty)
            menu      (layer-while-held menu)
            nav-shift (layer-while-held nav-shift)
            blender   (layer-switch blender)

            ;; Special typing modes
            typing (tap-dance-eager 500 (
                (tap-hold $tap-time $hold-time ret (layer-while-held typing))
                (layer-while-held num)
              ))



            ;; Modifiers
            spc  (tap-hold $tap-time $hold-time spc (layer-while-held nav))
            esc  (tap-hold $tap-time $hold-time esc (layer-while-held menu))
            ret  (tap-hold $tap-time $hold-time ret (layer-while-held num))
            tab  (tap-hold $tap-time $hold-time tab lalt)
            gesc (tap-hold $tap-time $hold-time esc (layer-while-held gamenum))
            bspc (tap-hold $tap-time $hold-time bspc (layer-while-held menu))

            ;; Text macros
            email (macro o r i - r i a r u S-2 p r o t o n . m e)

            ;; Common shortcuts
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

            ;; Navigation shortcuts
            back     A-left
            forward  A-rght

            ;; Window management
            pallet   C-p
            launch   M-g
            overview M-o
            quit     M-q
            size     M-r
            full     M-f
            max      M-S-f
            float    M-w

            ;; Focus movement
            focus-left  (tap-hold $tap-time $hold-time M-left  lmet)
            focus-up    (tap-hold $tap-time $hold-time M-up    lalt)
            focus-down  (tap-hold $tap-time $hold-time M-down  lshft)
            focus-right (tap-hold $tap-time $hold-time M-right lctrl)
            move-left   M-C-lft
            move-up     M-C-up
            move-down   M-C-down
            move-right  M-C-rght

            ;; Special functions
            .tp (switch
                  ()  (multi
                        (layer-switch typing)
                        (on-idle $idle-time tap-vkey to-base)
                      ) break
                )
            .spc-typing (multi (layer-switch default) spc)
          )

          ;; =====================
          ;; Chord Definitions
          ;; =====================

          (defchordsv2
            ;; Global chords
            (w e) tab              100 first-release (game gamenum qwerty nav)
            (x c) (caps-word 500) 100 first-release (game blender gamenum qwerty typing)
            (e r) /                100 first-release (game blender gamenum qwerty typing)
            (q w) S-`              100 first-release (game blender gamenum qwerty typing)

            ;; Navigation chords
            (p spc)   C-v    200        first-release (        game blender qwerty gamenum num )
            (j k)     home   200        first-release (default game blender qwerty gamenum num typing)
            (j k spc) home   200        first-release (        game blender qwerty gamenum num typing)
            (k l)     end    200        first-release (default game blender qwerty gamenum num typing)
            (k l spc) end    200        first-release (        game blender qwerty gamenum num typing)
            (d j k)   S-home $hold-time first-release (default game blender qwerty gamenum num typing)
            (d k l)   S-end  $hold-time first-release (default game blender qwerty gamenum num typing)

            ;; Number/Symbol chords
            (a z) S-, $hold-time first-release (default blender game qwerty gamenum nav typing)
            (d c) S-} $hold-time first-release (default blender game qwerty gamenum nav typing)
            (s x) }   $hold-time first-release (default blender game qwerty gamenum nav typing)
            (f v) S-0 $hold-time first-release (default blender game qwerty gamenum nav typing)
          )

          ;; =====================
          ;; Key Overrides
          ;; =====================

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
            `   S-3 S-\ S-7 S-5 /   1 2 3 =
            <   [   S-[ S-9 S-, S-= 4 5 6 0
            S-2 S-4 S-/ S-1 \ S-8 7 8 9 .
            @esc spc @ret @bspc @bspc
          )

          (deflayer nav
            @quit       @full     _           @pallet      @overview @save          @undo @copy @cut    @paste
            @focus-left @focus-up @focus-down @focus-right @launch   @find       lft   up    down     rght
            @back       _         _           @forward     @float    _           @sall @sexpand _ _
                                              _            _         @nav-shift del   del
          )

          (deflayer nav-shift
            _          @max     _          _           _ _        _ _ _ @cliphist
            @move-left @move-up @move-down @move-right _ @replace _ _ _ _
            _          _        _          _           _ _        _ _ _ _
                                           _           _ _        _ _
          )

          (deflayer menu
            _    _ _    _ @email _     @base @game @qwerty @blender
            _ _ _ _  _      _     left up down right
            _    prev pp   next   _      _     _     volu   voldwn _
                           _      _      _     _     _
          )

          (deflayer qwerty
            q w e r    t   y    u    i o p
            a s d f    g   h    j    k l ;
            z x c v    b   n    m    , . /
                  lalt spc ralt @menu @menu
          )

          (deflayer game
            @tab q w e     r   t   y     up   i     @menu
            shft a s d     f   g   left  down right ret
            ctl  z x c     v   b   h     _    _     m
                     @gesc spc @typing   @bspc @bspc
          )

          ;;Application layers
          ;; inset i
          ;; extrude e
          ;; select all a
          ;; quick favorites q
          ;; select linked l
          ;; hide h
          ;; knife k

          ;; loop r
          ;; copy circle select c
          ;; past parent p

          ;; proportional edit o
          ;; wirefram undo z

          ;; unwrap u
          ;; bevel b


          (deflayer blender
            q    x y z i a y u i o
            shft g r s e g h j k l
            ctl  a c v k b n m . p
                     alt @gesc ret @menu bspc
          )

          (deflayer gamenum
            _   1 2 3 _ _ _ _ _ _
            tab 4 5 6 0 _ _ _ _ _
            _   7 8 9 . _ _ _ _ _
                  _ _ _ _ _
          )
        '';
      };
    };
  };
}
