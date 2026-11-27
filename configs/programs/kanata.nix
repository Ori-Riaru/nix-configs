{
  config,
  settings,
  ...
}: {
  hardware.uinput.enable = true;
  users.groups.uinput.members = [settings.username];
  users.groups.input.members = [settings.username];

  services.kanata = let
    defsrc =
      if config.networking.hostName == "lain"
      then ''
        (defsrc
                q    w    e    r    t    y    u    i    o    p
          lshft a    s    d    f    g    h    j    k    l    ;    '
                z    x    c    v    b    n    m    ,    .    /
                              spc  esc  ret  ralt
        )
      ''
      else ''
        (defsrc
                q     w     e     r     t     y     u     i     o     p
          caps  a     s     d     f     g     h     j     k     l     ;     '
                z     x     c     v     b     n     m     ,     .     /
                                  lalt  spc   ralt  rctrl
        )
      '';

    allLayers = [
      "default"
      "qwerty"
      "game"
      "game-type"
      "gamenum"
      "nav"
      "nav-shift"
      "menu"
      "sym"
      "num"
      "gallium"
    ];
    only = on:
      builtins.concatStringsSep " "
      (builtins.filter (l: !(builtins.elem l on)) allLayers);
  in {
    enable = true;
    
    keyboards."default" = {
      port = 8008;
      extraDefCfg = ''
        process-unmapped-keys yes
        concurrent-tap-hold yes
        override-release-on-activation yes
        dynamic-macro-max-presses 1000
        tap-hold-require-prior-idle 130
        chords-v2-min-idle 100
      '';

      config = ''
        ${defsrc}

        ;; === Varibles ===

        (defvar
          t-index  170
          t-middle 191
          t-ring   210
          t-pinky  230
          t-thumb  200
          nav-hold 200
          repress  150
        )

        (defhands
          (left  caps q w e r t a s d f g z x c v b)
          (right y u i o p h j k l ; ' n m , . /)
        )

        (defalias

          ;; --- Text macros ---
           
          email  (macro o r i S-2 r i a r u . x y z)
          google (macro o r i . r i a r u S-2 g m a i l . c o m)
          proton (macro o r i - r i a r u S-2 p r o t o n . m e)

          ;; --- shortcuts ---
          
          undo       C-z
          redo       C-S-z
          cut        C-x
          paste      C-v
          copy       C-c
          find       C-f
          replace    C-h
          save       C-s
          sall       C-a
          sexpand    C-e
          sline      C-l
          back       A-left
          forward    A-rght
          close      C-w
          cliphist   M-v
          websearch  M-s
          screenshot M-p
          pick-color M-c
          cw         (caps-word 2000)

          ;; Window managment
          
          open         C-o
          pallet       C-p
          launch       M-g
          overview     M-o
          quit         M-q
          size         M-r
          size-back    M-C-r
          h-up         M-h
          h-down       M-C-h
          full         M-f
          max          M-S-f
          float        M-w
          monitor      M-d
          move-monitor M-C-d
          move-left    M-C-left
          move-up      M-C-up
          move-down    M-C-down
          move-right   M-C-rght

          ;; Applications

          ghostty  M-C-g
          browser  M-C-f
          nautilus M-C-n
          zed      M-C-c
          vesktop  M-C-v
          lights   M-l

          ;; Dynamic macros

          m-rec-1  (dynamic-macro-record 1)
          m-rec-2  (dynamic-macro-record 2)
          m-play-1 (dynamic-macro-play 1)
          m-play-2 (dynamic-macro-play 2)
          m-stop   (dynamic-macro-record-stop-truncate 1)

          ;; Home row and thumb key

          t-esc   (tap-hold-release 0 $t-thumb esc (layer-while-held num) (require-prior-idle 0))
          t-spc   (tap-hold 0 $nav-hold spc (layer-while-held nav))
          t-sym   (tap-hold-release 0 $t-thumb ret (layer-while-held sym) (require-prior-idle 0))
          t-bspc  (tap-hold-release 160 $t-thumb bspc (layer-while-held menu) (require-prior-idle 0))
          gamenum (tap-hold-release 0 $t-thumb esc (layer-while-held gamenum) (require-prior-idle 0))

          focus-left  (tap-hold-release 0 $t-thumb M-left  lmet (require-prior-idle 0))
          focus-up    (tap-hold-release 0 $t-thumb M-up    lalt (require-prior-idle 0))
          focus-down  (tap-hold-release 0 $t-thumb M-down  lsft (require-prior-idle 0))
          focus-right (tap-hold-release 0 $t-thumb M-right lctl (require-prior-idle 0))

          hm-a (tap-hold-opposite-hand-release $t-pinky  a lmet
                  (timeout hold) (unknown-hand hold) (neutral-keys s)
                  (require-prior-idle 55) (tap-repress-timeout $repress))
          hm-o (tap-hold-opposite-hand-release $t-ring   o lalt
                  (timeout hold) (unknown-hand hold) (neutral-keys a)
                  (tap-repress-timeout $repress))
          hm-e (tap-hold-opposite-hand-release $t-middle e lsft
                  (timeout hold) (unknown-hand hold) (neutral-keys f)
                  (require-prior-idle 55) (tap-repress-timeout $repress))
          hm-u (tap-hold-opposite-hand-release $t-index  u lctl
                  (timeout hold) (unknown-hand hold) (neutral-keys d)
                  (tap-repress-timeout $repress))

          hm-h (tap-hold-opposite-hand-release $t-index  h rctl
                  (timeout hold) (unknown-hand hold) (neutral-keys k)
                  (tap-repress-timeout $repress))
          hm-t (tap-hold-opposite-hand-release $t-middle t rsft
                  (timeout hold) (unknown-hand hold) (neutral-keys j)
                  (require-prior-idle 55) (tap-repress-timeout $repress))
          hm-n (tap-hold-opposite-hand-release $t-ring   n ralt
                  (timeout hold) (unknown-hand hold) (neutral-keys ;)
                  (tap-repress-timeout $repress))
          hm-s (tap-hold-opposite-hand-release $t-pinky  s rmet
                  (timeout hold) (unknown-hand hold) (neutral-keys l)
                  (require-prior-idle 55) (tap-repress-timeout $repress))


          hq-a    (tap-hold-opposite-hand-release $t-pinky  a lmet
                     (timeout hold) (unknown-hand hold) (neutral-keys s)
                     (require-prior-idle 55) (tap-repress-timeout $repress))
          hq-s    (tap-hold-opposite-hand-release $t-ring   s lalt
                     (timeout hold) (unknown-hand hold) (neutral-keys a)
                     (tap-repress-timeout $repress))
          hq-d    (tap-hold-opposite-hand-release $t-middle d lsft
                     (timeout hold) (unknown-hand hold) (neutral-keys f)
                     (require-prior-idle 55) (tap-repress-timeout $repress))
          hq-f    (tap-hold-opposite-hand-release $t-index  f lctl
                     (timeout hold) (unknown-hand hold) (neutral-keys d)
                     (tap-repress-timeout $repress))

          hq-j    (tap-hold-opposite-hand-release $t-index  j rctl
                     (timeout hold) (unknown-hand hold) (neutral-keys k)
                     (tap-repress-timeout $repress))
          hq-k    (tap-hold-opposite-hand-release $t-middle k rsft
                     (timeout hold) (unknown-hand hold) (neutral-keys j)
                     (require-prior-idle 55) (tap-repress-timeout $repress))
          hq-l    (tap-hold-opposite-hand-release $t-ring   l ralt
                     (timeout hold) (unknown-hand hold) (neutral-keys ;)
                     (tap-repress-timeout $repress))
          hq-scln (tap-hold-opposite-hand-release $t-pinky  ; rmet
                     (timeout hold) (unknown-hand hold) (neutral-keys l)
                     (require-prior-idle 55) (tap-repress-timeout $repress))


          hg-n (tap-hold-opposite-hand-release $t-pinky  n lmet
                  (timeout hold) (unknown-hand hold) (neutral-keys s)
                  (require-prior-idle 55) (tap-repress-timeout $repress))
          hg-r (tap-hold-opposite-hand-release $t-ring   r lalt
                  (timeout hold) (unknown-hand hold) (neutral-keys a)
                  (tap-repress-timeout $repress))
          hg-t (tap-hold-opposite-hand-release $t-middle t lsft
                  (timeout hold) (unknown-hand hold) (neutral-keys f)
                  (require-prior-idle 55) (tap-repress-timeout $repress))
          hg-s (tap-hold-opposite-hand-release $t-index  s lctl
                  (timeout hold) (unknown-hand hold) (neutral-keys d)
                  (tap-repress-timeout $repress))

          hg-h (tap-hold-opposite-hand-release $t-index  h rctl
                  (timeout hold) (unknown-hand hold) (neutral-keys k)
                  (tap-repress-timeout $repress))
          hg-a (tap-hold-opposite-hand-release $t-middle a rsft
                  (timeout hold) (unknown-hand hold) (neutral-keys j)
                  (require-prior-idle 55) (tap-repress-timeout $repress))
          hg-e (tap-hold-opposite-hand-release $t-ring   e ralt
                  (timeout hold) (unknown-hand hold) (neutral-keys ;)
                  (tap-repress-timeout $repress))
          hg-i (tap-hold-opposite-hand-release $t-pinky  i rmet
                  (timeout hold) (unknown-hand hold) (neutral-keys l)
                  (require-prior-idle 55) (tap-repress-timeout $repress))

          ;; --- Utils ---
         
          ;; Shifted symbols

          !    S-1
          @    S-2
          #    S-3
          $    S-4
          %    S-5
          ^    S-6
          &    S-7
          *    S-8
          lpar S-9
          rpar S-0
          _    S-min
          +    S-eql
          {    S-lbrc
          }    S-rbrc
          |    S-bksl
          :    S-scln
          dq   S-apo
          ?    S-/
          <    S-comm
          >    S-.
          ~    S-grv
          
          ;; Layer switching

          game      (layer-switch game)
          gametype  (layer-switch game-type)
          base      (layer-switch default)
          qwerty    (layer-switch qwerty)
          gallium   (layer-switch gallium)
          nav-shift (layer-while-held nav-shift)
        )

        ;; === Overrides ===
        ;; Swaps the shift behaviour of keys
        
        (defoverrides
          (lsft bspc) (del)
          (rsft bspc) (del)
          (lsft .) (lsft /)
          (rsft .) (lsft /)
          (lsft /) (\)
          (rsft /) (\)
        )

        (defchordsv2
          (x c) @cw 50 first-release (${only ["default" "gallium"]})
          (s d) tab 50 first-release (${only ["default" "gallium"]})
        )

        ;; === Layers ===

        ;; --- Primary Typing ---

        (deflayer default
                  '       -       .       p       y       f       g       c       r       l
          @_      @hm-a   @hm-o   @hm-e   @hm-u   i       d       @hm-h   @hm-t   @hm-n   @hm-s   ,
                  ;       q       j       k       x       b       m       w       v       z
                                          @t-esc  @t-spc  @t-sym  @t-bspc
        )
              
        (deflayer qwerty
                   q        w        e        r        t        y        u        i        o        p
          caps     @hq-a    @hq-s    @hq-d    @hq-f    g        h        @hq-j    @hq-k    @hq-l    @hq-scln '
                   z        x        c        v        b        n        m        ,        .        /
                                              @t-esc   @t-spc   @t-sym   @t-bspc
        )

        (deflayer gallium
                  b       l       d       c       v       j       f       o       u       ,
          -       @hg-n   @hg-r   @hg-t   @hg-s   g       y       @hg-h   @hg-a   @hg-e   @hg-i   /
                  x       q       m       w       z       k       p       '       ;       .
                                          @t-esc  @t-spc  @t-sym  @t-bspc
        )

        ;; --- Symbols ---

        (deflayer num
                  =       1       2       3       /       @%     @{      }      @?      @>
         bspc     0       4       5       6       @*      @!     @lpar   @rpar  @_      @<      XX
                  @^      7       8       9       @+     bksl    [       ]      @$      @@
                                          XX      XX     XX      XX
        )

        (deflayer sym
                @%    grv   @dq   '     @~    @+    =     /     @_    @*
          XX    @^    [     @{    @lpar @<    @>    @rpar @}    ]     @@    XX
                bksl  @$    @#    @&    @|    @!    @?    ;     @:    -
                                  XX    XX    XX    XX
        )

        ;; --- Shortcuts ---

        (deflayer nav
                       @quit        @full        @launch      @open        @pallet      @save        @undo        @copy        @cut         @paste
          XX           @focus-left  @focus-up    @focus-down  @focus-right @monitor     @find        left         up           down         rght         '
                       @back        @size-back   @size        @forward     @float       @sall        @sexpand     home         end          @sline
                                                              XX           XX           @nav-shift   del
        )

        (deflayer nav-shift
                        @close        @max          @websearch    @cw           @redo         @cliphist     F1            F2            F3            F4
          XX            @move-left    @move-up      @move-down    @move-right   @move-monitor @replace      F5            F6            F7            F8           '
                        _             @h-up         @h-down       _             _             _             F9            F10           F11           F12
                                                                  XX            XX            XX            XX
        )

        (deflayer menu
                      @email      @google     @proton     @screenshot @pick-color @lights     @base       @game       @gametype   @qwerty
          XX          @zed        @nautilus   @browser    @ghostty    @vesktop    @gallium    left        up          down        rght        '
                      @m-rec-1    @m-rec-2    @m-stop     @m-play-1   @m-play-2   prev        pp          volu        voldwn      next
                                                          _           _           XX          XX
        )

        ;; --- Gaming ---

        (deflayer game
                    tab      q        w        e        r        t        y        up       i        _
          @gametype lsft     a        s        d        f        g        left     down     rght     _        p
                    ctl      z        x        c        v        b        _        _        _        m
                                              @gamenum spc      XX       @t-bspc
        )
 
        (deflayer game-type
                    tab      '        ,        .        p        y        f        g        c        r
          @gametype shft     a        o        e        u        i        d        h        t        n        s
                    ctl      ;        q        j        k        x        b        m        w        v
                                               @gamenum spc      XX       @t-bspc
        )

        (deflayer gamenum
               shft  1    2    3    -    @+   F1   F2   F3   F4
          ,    alt   4    5    6    0    @*   F5   F6   F7   F8   _
               ctl   7    8    9    .    =    F9   F10  F11  F12
                              XX   XX   XX   XX
        )
      '';
    };
  };
}
