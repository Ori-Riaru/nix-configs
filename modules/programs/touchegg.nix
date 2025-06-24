{pkgs, ...}: {
  home.packages = [
    pkgs.touchegg
  ];

  services.touchegg.enable = true;

  home.file."./.config/touchegg/touchegg.conf".text = ''
    <touchégg>

      <settings>
        <property name="animation_delay">0</property>

        <property namey="action_execute_threshold">1</property>

        <property name="color">auto</property>
        <property name="borderColor">auto</property>
      </settings>

      <!--
        Configuration for every application.```
      -->
      <application name="All">

        <gesture type="SWIPE" fingers="3" direction="LEFT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <times>5</times>
            <modifiers>Super_L</modifiers>
            <keys>Control_L+Tab</keys>
            <decreaseKeys>Tab</decreaseKeys>
          </action>
        </gesture>

        <gesture type="SWIPE" fingers="3" direction="RIGHT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <times>5</times>
            <modifiers>Super_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Control_L+Tab</decreaseKeys>
          </action>
        </gesture>

        <gesture type="SWIPE" fingers="4" direction="LEFT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <times>5</times>
            <modifiers>Super_L+Shift_L</modifiers>
            <keys>Control_L+Tab</keys>
            <decreaseKeys>Tab</decreaseKeys>
          </action>
        </gesture>

        <gesture type="SWIPE" fingers="4" direction="RIGHT">
          <action type="SEND_KEYS">
            <repeat>true</repeat>
            <times>5</times>
            <modifiers>Super_L+Shift_L</modifiers>
            <keys>Tab</keys>
            <decreaseKeys>Control_L+Tab</decreaseKeys>
          </action>
        </gesture>

        <gesture type="PINCH" fingers="3" direction="OUT">
          <action type="SEND_KEYS">
            <modifiers>Super_L</modifiers>
            <keys>M</keys>
          </action>
        </gesture>

        <gesture type="PINCH" fingers="3" direction="IN">
          <action type="SEND_KEYS">
            <modifiers>Super_L</modifiers>
            <keys>W</keys>
          </action>
        </gesture>

        <gesture type="PINCH" fingers="4" direction="IN">
          <action type="SEND_KEYS">
            <modifiers>Super_L</modifiers>
            <keys>Z</keys>
          </action>
        </gesture>

      </application>

    </touchégg>
  '';
}
