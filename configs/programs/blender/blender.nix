{
  pkgs,
  lib,
  ...
}: let
  blenderVersion = lib.versions.majorMinor pkgs.blender.version;

  extensions = {
    "mio3_uv" = {
      url = "https://extensions.blender.org/download/sha256:597e349839c347c7894381b4fcbcea7777ec034f604ad753bcb1038323478219/add-on-mio3-uv-v2.2.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=5.0.0";
      hash = "sha256-5meKqWkxRfGLSQT/xCVuFP3FPx7Lj3XULWNAdjUWSK0=";
    };
    "per_camera_resolution" = {
      url = "https://extensions.blender.org/download/sha256:48cecdfc004417c6d0dee452657d0822dd96ea3897e159d5544d9819f3e54b8f/add-on-per-camera-resolution-v2.3.2.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-2F6cgALKRBrZIVbhvhHx/SpWxslE+9M/niQlMyzzBMU=";
    };
    "texture_wrangler" = {
      url = "https://extensions.blender.org/download/sha256:45c6809b530b0d8699134d935372b545bf8671e52377a05cb00dce38d1debad3/add-on-texture-wrangler-v1.1.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-ojToxGxc1w/kFkRdabkwe33fwqBYx3+cEhD1ZqvWp7E=";
    };
    "bone_widget" = {
      url = "https://extensions.blender.org/download/sha256:7b220e05fca1fd3fcef5b190848b846edad98c2c698489fdf7111e7261ce0344/add-on-bone-widget-v2.4.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-oVBloBMavjgi9cMR9LiYuG6Bsi+WRdyPO6dSnnz9cJk=";
    };
    "keyboard_layout_emulator" = {
      url = "https://extensions.blender.org/download/sha256:6a476fcb992f89ceb556fbade7f4b1a8d6a7ed3b1f2556f0452613a66a8a556c/add-on-keyboard-layout-emulation-v1.0.4.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-eVLRmC0r1MPUmMty1cuct7gpC8bA2tPvoDGeEyj7NH0=";
    };
    "arkit_blendshape_tools" = {
      url = "https://extensions.blender.org/download/sha256:22564818659cfcbf43e77aaf7628d57c51c090ffcef98b9d44bd18b9e601ee1e/add-on-arkit-blendshape-tools-v0.7.5.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-0ucKb4v9SfQRYIkN3YX5BWFk4JOdugoNbL+jshT5kS0=";
    };
    "font_selector" = {
      url = "https://extensions.blender.org/download/sha256:6f2006ea677059102fc7265f5dd0d9149ba80b93cbcef7d09d06aade32fda3c6/add-on-font-selector-v3.2.2.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=5.0.0";
      hash = "sha256-5ivc5CL9cqKn4AlEa64cf5EFhhhUt4XVe89MO/niefw=";
    };
    "apply_modifiers_with_shape_keys" = {
      url = "https://extensions.blender.org/download/sha256:063ae9bfae007c27e2ba34b3d0a990a6bb68d923af828b1d06510c95972881ab/add-on-apply-modifiers-with-shape-keys-v1.0.4.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.3.2";
      hash = "sha256-cbzxQ+Hqp2adwDgCSLvGJlXo1zGx34bKOS14DlsBBWE=";
    };
    "placehelper" = {
      url = "https://extensions.blender.org/download/sha256:b716a8028e846db794aff472e96b475f2593082b898355a46502d3cc03013544/add-on-placehelper-v2.0.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-5Y4ym3aXf1zKQe/+ImZ5xvbU5yfIxh4TSzdY0k8mI8c=";
    };
    "node_arranger" = {
      url = "https://extensions.blender.org/download/sha256:ccce3db24525e89ab7c019a550bba1adbbe6bb5ccfc78a1957c484b8bd8d6c06/add-on-node-arrange-v1.12.1.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-D7ju7/8bdC8JtJ9g7S6Ia/YYfg6iwvDpkqYmHh/CD8s=";
    };
    "edgeflow" = {
      url = "https://extensions.blender.org/download/sha256:4fa53590a837813c72dc9ed0a416f8e3de61352abb262b461974cd9f7092b1c1/add-on-edgeflow-v1.1.2.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-/Wk807IZgjzXm9zd8unX4FkHLUEHE4u7J592rcu+J+8=";
    };
    "ucupaint" = {
      url = "https://extensions.blender.org/download/sha256:880f3961ea7682897580f9060ff5530f5922bd4c74bedf72bafa906096afba0f/add-on-ucupaint-v3.0.1.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-wcaC/8IVjIKVsEmqw12rbAvFzq4kQOSST0z2vG5tQ04=";
      stripRoot = true;
    };
    "modern_primitive" = {
      url = "https://extensions.blender.org/download/sha256:6fa57566b2fa8dbc0055ff98e75873a75102a7ba82a11ca6a069b9971532da6a/add-on-modern-primitive-v0.0.58.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.3.0";
      hash = "sha256-P6fzttDNs31I37JKuE8mkej07EtEQFFNQ7xAwkOkFIE=";
    };
    "you_are_autosave" = {
      url = "https://extensions.blender.org/download/sha256:7655433433ca018ea03604dc0b8759ce2de9d5c239024017abb8a95b153ee63b/add-on-you-are-autosave-v1.5.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-baJ6Tx/z6psPXqzSP3zrV+2qHnIF5k2RKtkw14//ufw=";
    };
    "copy_object_name_to_data" = {
      url = "https://extensions.blender.org/download/sha256:686fd6616844730398773fa942ffc42bcc478622a1441b51c70ba28853274c03/add-on-copy-object-name-to-data-v1.1.1.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-fZJCOaiIeflBeZSexa5HfvPNyIwoSKzZtegLhday6CI=";
    };
    "node_quick_maths" = {
      url = "https://extensions.blender.org/download/sha256:948a7468118a39669b9de8929f503189de43ac74726343ce1cadd3f811838467/add-on-node-quick-maths-v1.2.4.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-puQGRUN7DSdzVyJY9y56kyVUYtPsOh70/6SSGeIr7sU=";
    };
    "time_tracker" = {
      url = "https://extensions.blender.org/download/sha256:69178cd1c0f07232a68f85724b0f76e005d221c18a0e466619f49ac957bd87b9/add-on-time-tracker-v0.2.4.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-2uvUA9jVJNwLbT03PaAz2p+WjWTo8RYqK2sSOd/NDwA=";
    };
    "easyweight" = {
      url = "https://extensions.blender.org/download/sha256:6a608ee3bf5f8ca5fa9ed6596d19416b40944be33cfaecd26080259eadd507d5/add-on-easyweight-v1.1.3.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0&blender_version_max=6.0.0";
      hash = "sha256-HkHg+CNZf7OZbf5qaPPzbyqAXrrqdCxI7JbTx8fRCzU=";
    };
    "fakebones" = {
      url = "https://extensions.blender.org/download/sha256:8fb6423b4a87ee2f5be2e4fe36257d90cd06e7bd46cc8b22d74455ae3e14cc3c/add-on-fakebones-v1.0.8.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-slyVZGGRsjviVKWtZERth1l6dLGPOgKKyaOKhiJlmOY=";
    };
    "profiling_buddy" = {
      url = "https://extensions.blender.org/download/sha256:025a1466757a8937bbea1cf5f377272eeb2f259b8be6b1f558d5c642629c78d0/add-on-profiling-buddy-v1.0.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-0mWvBIJfsDn/haE5X0H65s6+FoHrmXK033OBCOQ40eM=";
    };
    "uv_flatten_tool" = {
      url = "https://extensions.blender.org/download/sha256:129c84cce943e52f2f2bfbe98936cf35bca2750e39c00c7ce105711ad70fb29a/add-on-uv-flatten-tool-v1.1.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.4.0";
      hash = "sha256-ZPPTjnnSAzY/joystJFornZkokBAk+KuVrg97xLsvLw=";
    };
    "wiggle_2" = {
      url = "https://extensions.blender.org/download/sha256:a9f904decb1ef8a7c65e1e1f7c3a982c26541931d18f87cd59776cd40643ebd9/add-on-wiggle-2-v2.4.0.zip?repository=%2Fapi%2Fv1%2Fextensions%2F&blender_version_min=4.2.0";
      hash = "sha256-2ojO7joOPSb9LhIGHd+j6+5NWQdzFTnHAO/pXiW9xzk=";
    };
  };

  fetchExtension = {
    url,
    hash,
    stripRoot ? false,
  }:
    pkgs.fetchzip {
      inherit url hash stripRoot;
      extension = "zip";
    };
in {
  home.packages = with pkgs; [
    (blender.override {cudaSupport = true;})
  ];

  home.file =
    lib.mapAttrs' (
      id: value:
        lib.nameValuePair
        ".config/blender/${blenderVersion}/extensions/user_default/${id}"
        {
          source = fetchExtension value;
        }
    )
    extensions;
}
