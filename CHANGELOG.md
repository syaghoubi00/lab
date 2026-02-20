# Changelog

## 1.0.0 (2026-02-20)


### ⚠ BREAKING CHANGES

* **containers.adt:** remove ansible-dev-tools
* **ansible.deploy:** deployment playbook was still getting syntax error
* **ansible:** remove seed node play
* **deploy:** use dir as collection dest instead of ./tmp/
* **tf.docker:** add vps to inventory file instead of running playbook
* **tf:** use terraform instead of tofu
* **tf.digitalocean:** use root user for provisioning
* **terraform:** migrate to hashicorp cloud vault secrets
* **tf:** move all old terraform files to old dir
* **bootc:** move bootc files to containers dir
* **ansible:** migrate to remote roles

### Features

* add base bind9 configs ([76bddae](https://github.com/syaghoubi00/lab/commit/76bddae785981c5a3a83b930abb05af58d27f4b8))
* add basic deploy script ([bdf860a](https://github.com/syaghoubi00/lab/commit/bdf860a200996c50b0db4ca4705d41dba3f97e7d))
* add fedora container toolbox ([438e317](https://github.com/syaghoubi00/lab/commit/438e317a8185fb108db4044a44f8c24484555c65))
* add main ansible playbook ([6e555b8](https://github.com/syaghoubi00/lab/commit/6e555b890e252be006bdea95fd5ed0cffa34f69d))
* add ncdu to fedora box packages ([a0b802d](https://github.com/syaghoubi00/lab/commit/a0b802d0ae332ebc2a850e411ccdf626494b5475))
* add script to update pinned dnf packages in a containerfile ([#3](https://github.com/syaghoubi00/lab/issues/3)) ([48af288](https://github.com/syaghoubi00/lab/commit/48af288789a90853579690884fb9b62a68ae5ccb))
* add some new packages to fedora box ([64799a6](https://github.com/syaghoubi00/lab/commit/64799a628fdad1371f6379cffd84f0b5437047b7))
* add workflow to build containers ([ae5fc32](https://github.com/syaghoubi00/lab/commit/ae5fc3238e14d66fe0a30c5091dfc8db90188bcb))
* add workflow to scan iac configs ([de2847f](https://github.com/syaghoubi00/lab/commit/de2847fd579bf22f6a866cdca52ed3514505de44))
* **ansible-docker:** add rootful install for Ubuntu ([829201b](https://github.com/syaghoubi00/lab/commit/829201b505df1a2fd038d0c2f9dfa59c4015263e))
* **ansible:** add ansible.cfg ([ea865ba](https://github.com/syaghoubi00/lab/commit/ea865ba32078ca6eb12730a1544fc48a03e6e208))
* **ansible:** add play for hardening hosts ([e57bc32](https://github.com/syaghoubi00/lab/commit/e57bc328ec603ba17b0fdaa01aba0736b94f197d))
* **ansible:** add primary inventory file ([ae5c819](https://github.com/syaghoubi00/lab/commit/ae5c819a2fa09780e93634a3392fa2ec29e20a0e))
* **ansible:** add role to install coredns ([64a0bf3](https://github.com/syaghoubi00/lab/commit/64a0bf3f392861902cbe9123b9d74403895ed3b6))
* **ansible:** add timestamp file for last update ([7f89a48](https://github.com/syaghoubi00/lab/commit/7f89a48486574bd95d76a7b74928b756067f8426))
* **ansible:** create directories for storing ansible state ([8a8e254](https://github.com/syaghoubi00/lab/commit/8a8e254063594c11f234c346fee8fc84618bae63))
* **ansible:** create separate internal playbook ([75447d6](https://github.com/syaghoubi00/lab/commit/75447d6dd2d7dcf0e5289ecc0a2d2c6ad4da625d))
* **ansible:** deploy tf project with ansible ([c5a7242](https://github.com/syaghoubi00/lab/commit/c5a7242f3bdfa8525779c45e82c3d7e597f63dd8))
* **ansible:** do conditional updating of packages with boolean var ([0cceeab](https://github.com/syaghoubi00/lab/commit/0cceeabf46969a0e55a3977cc68e47986e45a753))
* **ansible:** handle reboots if required after updates ([d3d1259](https://github.com/syaghoubi00/lab/commit/d3d12590f1362ec6940961ce7870f48555a3ec0e))
* **ansible:** install zfs to zfs group ([696b353](https://github.com/syaghoubi00/lab/commit/696b353e5d2ed91959dcae297b4043ae286f9846))
* **ansible:** migrate to remote roles ([223bd6b](https://github.com/syaghoubi00/lab/commit/223bd6bf0bfec3ef670785f54a2457ffe30a737d))
* **ansible:** move old docker play from tf to main playbook ([d18aea4](https://github.com/syaghoubi00/lab/commit/d18aea40d6e25080f4d8ea6d2a24103e47d5f49b))
* **bootc:** add desktop build definition and config ([9a7ec3d](https://github.com/syaghoubi00/lab/commit/9a7ec3d516af320d335a2b1ac1d3175ab3493d30))
* **boxes.fedora:** add golang package ([00d5d56](https://github.com/syaghoubi00/lab/commit/00d5d5607ea38191f927894e2d32b39415597ea8))
* **cloud-init:** add auto-install template ([67a66ab](https://github.com/syaghoubi00/lab/commit/67a66ab1beee28bcf075f968448944c8d68108b9))
* **cloud-init:** add user-data for ansible user config ([5b1f991](https://github.com/syaghoubi00/lab/commit/5b1f991bcbc00a8fca79095ef0cf9c297003e497))
* **configs:** add coredns corefile ([2094986](https://github.com/syaghoubi00/lab/commit/2094986bf66c501a479045ad042fac2a3fe9dfa5))
* **containers.adt:** remove ansible-dev-tools ([6769490](https://github.com/syaghoubi00/lab/commit/676949053612bce9df8d7bcb8a3e6968c55fc189))
* **containers.bootc:** add bootc linting to build definition ([afdf118](https://github.com/syaghoubi00/lab/commit/afdf1184336063bb29005f3a1f26f63daabec391))
* **containers.boxes.fedora:** add azure cli to packages ([ae5d0e1](https://github.com/syaghoubi00/lab/commit/ae5d0e17e8e8817da05b264617090e1b05bad24e))
* **containers.boxes.fedora:** add cpp package ([13ba3e5](https://github.com/syaghoubi00/lab/commit/13ba3e508a5270d45ce5efb0dbc987cbaa19ba28))
* **containers.boxes.fedora:** add hcp cli package ([9f74036](https://github.com/syaghoubi00/lab/commit/9f740366108524a9eee5273f8418d757b6f184ac))
* **containers.boxes.fedora:** add kubectl to packages ([0f123a1](https://github.com/syaghoubi00/lab/commit/0f123a1d47ee2b83b7f9db1bcb15a80cb83efa3b))
* **containers.boxes.fedora:** add pip package ([c3f2e7b](https://github.com/syaghoubi00/lab/commit/c3f2e7bf6fbbb7bb431ec5858e814d038d6f1a82))
* **containers.boxes.fedora:** add terraform package ([bbb8a60](https://github.com/syaghoubi00/lab/commit/bbb8a60732d6f509f504e255e97cfbb65ea7119f))
* **containers.boxes.fedora:** add uv package ([9730ca1](https://github.com/syaghoubi00/lab/commit/9730ca13ba8a180a2fd15b71bb0b4579dc46168b))
* **containers.boxes.fedora:** unpin packages ([e104396](https://github.com/syaghoubi00/lab/commit/e104396248384794ddccc536938d638ad55cf4a0))
* **containers:** add ansible to box package-list ([de6b5c0](https://github.com/syaghoubi00/lab/commit/de6b5c078d7949f4e780cbb29ab3ddaa370589bd))
* **containers:** add containerfile for adt ([38a3950](https://github.com/syaghoubi00/lab/commit/38a3950a051430220560543245857eb7fcea5e1f))
* **containers:** add gh cli to toolbox ([0c4ce6d](https://github.com/syaghoubi00/lab/commit/0c4ce6d36e708d08505e96b8e8a45db973f161b5))
* **containers:** use explicit versioning for packages for dependabot ([175fa25](https://github.com/syaghoubi00/lab/commit/175fa25b0eed5b77296283b8f9a5d6817fe22552))
* **dependabot:** assign a reviewer for pull requests ([ff407ee](https://github.com/syaghoubi00/lab/commit/ff407eeba0c4f82934d067b70c471ac3e2f6e3f9))
* **deploy:** add ssh port var to proto check ([009f4da](https://github.com/syaghoubi00/lab/commit/009f4dadd14b361c1f9032a73fc56033d4152861))
* **deploy:** check if ssh is ready on host before running ansible ([48c3baa](https://github.com/syaghoubi00/lab/commit/48c3baaadb4f29c2ffb470a1c59eaaccb34e59a8))
* **deploy:** install collection to local repo to prevent conflicts ([d6570c7](https://github.com/syaghoubi00/lab/commit/d6570c7a5bb499e08f7d71cad9cbe09205a79b25))
* explicitly set sbom and max provenance in container workflow ([2b61a1f](https://github.com/syaghoubi00/lab/commit/2b61a1fbc50f5f36340e8e862a90ecca4c063cef))
* **repo:** add hadolint config to ignore unpinned packages ([4220f8a](https://github.com/syaghoubi00/lab/commit/4220f8a152a5a60fc9d392215088f72a86580373))
* **scripts.ctr-pkgs:** expand regex to match fedora bootc containers ([9bb66e4](https://github.com/syaghoubi00/lab/commit/9bb66e480eadd27365e7671507ddc71f08761bbd))
* **scripts:** show diff then prompt after diff ([726f05a](https://github.com/syaghoubi00/lab/commit/726f05aab5fd85b3b533b5000213ce71e262be38))
* **terraform:** migrate to hashicorp cloud vault secrets ([8778e52](https://github.com/syaghoubi00/lab/commit/8778e526e2ac65478ea5605be1965939f99f4140)), closes [#13](https://github.com/syaghoubi00/lab/issues/13)
* **tf-lxd:** add terraform lxd profiles ([a0c727d](https://github.com/syaghoubi00/lab/commit/a0c727d7b19c53c8506728f84144ba229c0bf848))
* **tf-lxd:** add terraform lxd projects ([d2b9c6c](https://github.com/syaghoubi00/lab/commit/d2b9c6c2057585842a8bfe285a1359fbfc2b97c2))
* **tf-lxd:** add terraform lxd provider ([6004f4e](https://github.com/syaghoubi00/lab/commit/6004f4e06e37f69b349e9c13463996aa5c9e6680))
* **tf-lxd:** add terraform lxd zfs pool ([57374ac](https://github.com/syaghoubi00/lab/commit/57374accbade75e31d1f9d5c49efdec764ed5321))
* **tf-lxd:** add tf cloud-init variables ([36c2ba3](https://github.com/syaghoubi00/lab/commit/36c2ba3e9a9cfb9e7e234dade8ce5dad0a4d6eb0))
* **tf.ansible:** add dynamic inventory plugin for ansible ([b197b38](https://github.com/syaghoubi00/lab/commit/b197b3854f6beda14688debba34e6b023e208480))
* **tf.azure-k8s:** module to deploy azure k8s cluster ([fa580bc](https://github.com/syaghoubi00/lab/commit/fa580bcdccd492fcb7f4c3386926ed0ceaafd0c6))
* **tf.azure.provider:** add variables for provider configuration ([e7d5d9f](https://github.com/syaghoubi00/lab/commit/e7d5d9f1da932fd1e408dabe08a4eaa1d9b50883))
* **tf.azure:** add k8s cluster deployment ([28ed4b3](https://github.com/syaghoubi00/lab/commit/28ed4b39816c70e1dc162401c6e609c478632551))
* **tf.azure:** add k8s kubeconfig output ([005be87](https://github.com/syaghoubi00/lab/commit/005be87bc8e68a2fb7e151ec959de284b5291756))
* **tf.azurerm:** add azure resource manager provider ([ca11345](https://github.com/syaghoubi00/lab/commit/ca11345c7a24ea68cdb24c5b8f882b7a62913734))
* **tf.cloudflare.zags_dev:** add zone and dns record ([823736a](https://github.com/syaghoubi00/lab/commit/823736aa775e3e3f18572cc980179de3789d6846))
* **tf.digitalocean:** add docker droplet ([83b9a3f](https://github.com/syaghoubi00/lab/commit/83b9a3f3f3298959ac2025ee994453b0fd07c727))
* **tf.digitalocean:** add docker droplet to dev project ([0e73f41](https://github.com/syaghoubi00/lab/commit/0e73f418da4a70a4928c1b117ed6023df5ba2bd2))
* **tf.digitalocean:** add monitoring alerts ([1cbf0b8](https://github.com/syaghoubi00/lab/commit/1cbf0b831ef3f5cf3293639eb01f0d428a71e6bc)), closes [#29](https://github.com/syaghoubi00/lab/issues/29)
* **tf.digitalocean:** add provider config ([2a950a8](https://github.com/syaghoubi00/lab/commit/2a950a8544fd269f2775003df2f28855a07f90dc))
* **tf.digitalocean:** add reserved ip to docker droplet ([8c895be](https://github.com/syaghoubi00/lab/commit/8c895bed3016b7c91c42f4b97d9d020ef8180627)), closes [#43](https://github.com/syaghoubi00/lab/issues/43)
* **tf.digitalocean:** add some project resources ([66e0c75](https://github.com/syaghoubi00/lab/commit/66e0c7514f91fb8c736d94b2062679e5c58c52da))
* **tf.digitalocean:** add volume to docker droplet ([005c9a2](https://github.com/syaghoubi00/lab/commit/005c9a219dc03f3369a2209abb9f30b14a2d57f6)), closes [#30](https://github.com/syaghoubi00/lab/issues/30)
* **tf.digitalocean:** create ssh priv key file from vault ([fd95c95](https://github.com/syaghoubi00/lab/commit/fd95c95464eeaaa940ea7afe85eac72fe50cb6a2))
* **tf.digitalocean:** disable backups for docker droplet ([d3e7cdc](https://github.com/syaghoubi00/lab/commit/d3e7cdc1afb9baa4ea91ed8e30d71ef95e164db4))
* **tf.digitalocean:** switch docker droplet to premium amd cpu ([6b99d9b](https://github.com/syaghoubi00/lab/commit/6b99d9b163097562fdd6d50ff71c585f5b550e1c))
* **tf.digitalocean:** use reusable tag resource ([796494a](https://github.com/syaghoubi00/lab/commit/796494ae0230da4ecf0c3580596bd446cc9c3a6d))
* **tf.digitalocean:** use root user for provisioning ([495a683](https://github.com/syaghoubi00/lab/commit/495a683e03e6e10a9dfb254cfb14262f5273e6af))
* **tf.docker:** add output for ipv4 address of vps ([7bd0da5](https://github.com/syaghoubi00/lab/commit/7bd0da57a89282e586b4e8ed62dc711da2051535))
* **tf.docker:** add vps to inventory file instead of running playbook ([8f33e9e](https://github.com/syaghoubi00/lab/commit/8f33e9ecbdd8e9a6ab1d3f602fc80aed368f863d))
* **tf.libvirt:** add old libvirt tf files pre lxd migration for ref ([ab3e2b2](https://github.com/syaghoubi00/lab/commit/ab3e2b2f1594b57f51a7cf364c8152165912abd5))
* **tf.lxd:** add example template for creating an instance ([5f96c13](https://github.com/syaghoubi00/lab/commit/5f96c13dbaa32b13899220cc7279f80595b74727))
* **tf:** add ansible provider ([c194a97](https://github.com/syaghoubi00/lab/commit/c194a974cf269c0c838069b3940333d70a42b1aa))
* **tf:** add cloud-init templatefile ([31a2a8d](https://github.com/syaghoubi00/lab/commit/31a2a8de4a49ef254e2502d8ebed8c7168194774))
* **tf:** add cloudflare provider ([0724dce](https://github.com/syaghoubi00/lab/commit/0724dce4484b823fc421189ba24d05f44569cda0))
* **tf:** add digitalocean provider ([08a2c4c](https://github.com/syaghoubi00/lab/commit/08a2c4c42baffba45fbb96bde3b7b160deeee753))
* **tf:** add new tf block with required providers ([c89bded](https://github.com/syaghoubi00/lab/commit/c89bdedd85dc02df8fdecf78fa75952b0edc4974))
* **tf:** add tf required providers ([7d4aac1](https://github.com/syaghoubi00/lab/commit/7d4aac18ba64b144de8ccb5ba8a89d493cc97a88))
* **tf:** add tofu lock file ([4c97b38](https://github.com/syaghoubi00/lab/commit/4c97b38d94effefea6e2d1f0ba6947847c4c8d34))
* **tf:** add variables for ssh keys ([932c70d](https://github.com/syaghoubi00/lab/commit/932c70df2a18ef114c37e8fef74d885a3c64456c))
* update dependabot config to run daily ([e69a672](https://github.com/syaghoubi00/lab/commit/e69a672ed4d22c496496914f7a4b0078618b3200))


### Bug Fixes

* add permissions to config scanner ([2eddce4](https://github.com/syaghoubi00/lab/commit/2eddce4bc8d5cf5cc94da76d895b93cf0bde53d3))
* always upload trivy config scans to security tab ([5d09f15](https://github.com/syaghoubi00/lab/commit/5d09f15c25fe6e9681c271193d5438c0a8c9711b))
* **ansible-docker:** set docker repo filename explicitly ([7cc8f25](https://github.com/syaghoubi00/lab/commit/7cc8f25576dc04acf5b66353835e5bd70e78d7c2))
* **ansible.deploy:** deployment playbook was still getting syntax error ([743d4a0](https://github.com/syaghoubi00/lab/commit/743d4a0ea7a40378bf1cfc9518cd8a018f6394b4))
* **ansible:** change output formating to result_format ([6425520](https://github.com/syaghoubi00/lab/commit/6425520748ee69a692076f20d9b6851ca8d71fe2))
* **ansible:** name role and use version ([47218b9](https://github.com/syaghoubi00/lab/commit/47218b99462b0e4ec747eb6ad177d580afd0ee93))
* **ansible:** prepend author to role names in requirements ([5608922](https://github.com/syaghoubi00/lab/commit/560892227318ae24ed3493136048607311b3854a))
* **ansible:** revert to using terraform instead of tofu ([5a457a2](https://github.com/syaghoubi00/lab/commit/5a457a217f3ac629cbb7bac0c4533703768fcac2))
* **ansible:** use correct ini variable name for yaml formatting ([a7407ad](https://github.com/syaghoubi00/lab/commit/a7407ad0910be32b5c4030ab5e3d91fa39293aea))
* **ansible:** use correct jinja syntax ([e61debd](https://github.com/syaghoubi00/lab/commit/e61debd6c50a1af7f627e6e45edc3b48816e4549))
* **ansible:** use correct role to install docker ([52f9558](https://github.com/syaghoubi00/lab/commit/52f95587b4ab9014d866000360751e924cccd11e))
* **bootc:** use correct order of dnf flags during install ([aee4ad8](https://github.com/syaghoubi00/lab/commit/aee4ad8efac89998a4e177da327023b56cebea69))
* **bootc:** use nobody user to satisfy trivy even though it is ignored ([c8daff0](https://github.com/syaghoubi00/lab/commit/c8daff018d0c34fdc1c5c342df07fdb37ef9193c))
* **containers.bootc.desktop:** package exclusion breaks default config ([06c015a](https://github.com/syaghoubi00/lab/commit/06c015ac79be8cba9b890a63e78bb401e5d1f4a9))
* **containers.bootc:** remove default user ([e0da466](https://github.com/syaghoubi00/lab/commit/e0da466f6ee38887478e57f244316f56c690d9fc))
* **containers.boxes.fedora:** add en locale package for environment ([026dd57](https://github.com/syaghoubi00/lab/commit/026dd575f6b6eb81114c15d34f01bde8bdf98663))
* **containers.boxes.fedora:** use updated hashi repos for f42 ([ba22b4b](https://github.com/syaghoubi00/lab/commit/ba22b4b6ab3e7b74271b6b00ca9f77521bb7cc31))
* **containers.boxes.fedora:** use workdir instead of cd ([ab810ee](https://github.com/syaghoubi00/lab/commit/ab810ee34b2be40aeec94840a429b6a0cb90e42d))
* **containers:** define healthcheck none for sec scan ([8ef8f65](https://github.com/syaghoubi00/lab/commit/8ef8f65610d9f6dd77809339f8801a3f31823cea))
* **containers:** set correct permissions on file ([f644755](https://github.com/syaghoubi00/lab/commit/f6447550404fccb36dc8c995c2020f1241a38f75))
* **containers:** use correct KeyValueFormat ([67b6d04](https://github.com/syaghoubi00/lab/commit/67b6d0454790f09f2ac75ae90b77d7e859a955da))
* deconflict namespace and print diff as str ([c802b9c](https://github.com/syaghoubi00/lab/commit/c802b9c978c6235779a3f6a02d8157e2db3c9f37))
* **deploy:** unset ssh-agent to fix max auth attempt failure ([a123a79](https://github.com/syaghoubi00/lab/commit/a123a79f88b359a3faef111f42a3a10f1b4459e4))
* handle four layer container directories ([af05ab2](https://github.com/syaghoubi00/lab/commit/af05ab2d9b22e94b7e65ef63bf890365e0285930))
* **scripts:** improve repo closure error handling ([7b9ac39](https://github.com/syaghoubi00/lab/commit/7b9ac39a21605ccb493096559ae89e800d80c256))
* **scripts:** sys.exit if import fails, since package is required ([8e3c996](https://github.com/syaghoubi00/lab/commit/8e3c9963e812cf3eb09884ffea29979c5c5cd9aa))
* **tf.azure-k8s:** add logs workspace to cluster ([af59fb1](https://github.com/syaghoubi00/lab/commit/af59fb13545a9d120e340f78bef7fd47ae6e8619))
* **tf.cloudflare:** redirect fqdn to pages domain ([e534670](https://github.com/syaghoubi00/lab/commit/e534670c698d803f971ddacd90609a316a9df21a))
* **tf.digitalocean:** remove projects ([9f18631](https://github.com/syaghoubi00/lab/commit/9f18631e87f31386099c529d59078bc012d44d64))
* try to import dnf otherwise raise exception ([c3d0e05](https://github.com/syaghoubi00/lab/commit/c3d0e0547ea2ca83f555b3cd21de7e9da361a2f8))
* use underscope for package name to follow python conventions ([3a5a11f](https://github.com/syaghoubi00/lab/commit/3a5a11f4279e36a0872693178aff77cb27b8339e))


### Performance Improvements

* **ansible:** dont collect facts for tf deployment ([be00cb9](https://github.com/syaghoubi00/lab/commit/be00cb97d2adb0fa6533dc226d39a9743a83cfc2))


### Code Refactoring

* **ansible:** remove seed node play ([6b3378c](https://github.com/syaghoubi00/lab/commit/6b3378c843754484cd278de2164e64ece209b4f3))
* **bootc:** move bootc files to containers dir ([0f3345c](https://github.com/syaghoubi00/lab/commit/0f3345c8805103eef9bbc20a9c36a0b7ccc7b5b3))
* **deploy:** use dir as collection dest instead of ./tmp/ ([0d628d6](https://github.com/syaghoubi00/lab/commit/0d628d6628e3b5c9ae4191114a6ae1c607a84d86))
* **tf:** move all old terraform files to old dir ([867fff7](https://github.com/syaghoubi00/lab/commit/867fff7677262fc593c9224b17dcb3071a0194b3))
* **tf:** use terraform instead of tofu ([2093160](https://github.com/syaghoubi00/lab/commit/2093160dcf8f1cf4032ee12898b80a61c969cd7a))
