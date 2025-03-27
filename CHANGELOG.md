# Changelog

## 1.0.0 (2025-03-27)


### ⚠ BREAKING CHANGES

* **tf:** use terraform instead of tofu
* **tf.digitalocean:** use root user for provisioning
* **terraform:** migrate to hashicorp cloud vault secrets
* **tf:** move all old terraform files to old dir
* **bootc:** move bootc files to containers dir
* **ansible:** migrate to remote roles

### Features

* add base bind9 configs ([76bddae](https://github.com/syaghoubi00/lab/commit/76bddae785981c5a3a83b930abb05af58d27f4b8))
* add fedora container toolbox ([438e317](https://github.com/syaghoubi00/lab/commit/438e317a8185fb108db4044a44f8c24484555c65))
* add main ansible playbook ([6e555b8](https://github.com/syaghoubi00/lab/commit/6e555b890e252be006bdea95fd5ed0cffa34f69d))
* add ncdu to fedora box packages ([a0b802d](https://github.com/syaghoubi00/lab/commit/a0b802d0ae332ebc2a850e411ccdf626494b5475))
* add script to update pinned dnf packages in a containerfile ([#3](https://github.com/syaghoubi00/lab/issues/3)) ([48af288](https://github.com/syaghoubi00/lab/commit/48af288789a90853579690884fb9b62a68ae5ccb))
* add some new packages to fedora box ([64799a6](https://github.com/syaghoubi00/lab/commit/64799a628fdad1371f6379cffd84f0b5437047b7))
* add workflow to build containers ([ae5fc32](https://github.com/syaghoubi00/lab/commit/ae5fc3238e14d66fe0a30c5091dfc8db90188bcb))
* add workflow to scan iac configs ([de2847f](https://github.com/syaghoubi00/lab/commit/de2847fd579bf22f6a866cdca52ed3514505de44))
* **ansible-docker:** add rootful install for Ubuntu ([829201b](https://github.com/syaghoubi00/lab/commit/829201b505df1a2fd038d0c2f9dfa59c4015263e))
* **ansible:** add role to install coredns ([64a0bf3](https://github.com/syaghoubi00/lab/commit/64a0bf3f392861902cbe9123b9d74403895ed3b6))
* **ansible:** deploy tf project with ansible ([c5a7242](https://github.com/syaghoubi00/lab/commit/c5a7242f3bdfa8525779c45e82c3d7e597f63dd8))
* **ansible:** migrate to remote roles ([223bd6b](https://github.com/syaghoubi00/lab/commit/223bd6bf0bfec3ef670785f54a2457ffe30a737d))
* **bootc:** add desktop build definition and config ([9a7ec3d](https://github.com/syaghoubi00/lab/commit/9a7ec3d516af320d335a2b1ac1d3175ab3493d30))
* **boxes.fedora:** add golang package ([00d5d56](https://github.com/syaghoubi00/lab/commit/00d5d5607ea38191f927894e2d32b39415597ea8))
* **cloud-init:** add user-data for ansible user config ([5b1f991](https://github.com/syaghoubi00/lab/commit/5b1f991bcbc00a8fca79095ef0cf9c297003e497))
* **configs:** add coredns corefile ([2094986](https://github.com/syaghoubi00/lab/commit/2094986bf66c501a479045ad042fac2a3fe9dfa5))
* **containers.bootc:** add bootc linting to build definition ([afdf118](https://github.com/syaghoubi00/lab/commit/afdf1184336063bb29005f3a1f26f63daabec391))
* **containers.boxes.fedora:** add azure cli to packages ([ae5d0e1](https://github.com/syaghoubi00/lab/commit/ae5d0e17e8e8817da05b264617090e1b05bad24e))
* **containers.boxes.fedora:** add hcp cli package ([9f74036](https://github.com/syaghoubi00/lab/commit/9f740366108524a9eee5273f8418d757b6f184ac))
* **containers.boxes.fedora:** add kubectl to packages ([0f123a1](https://github.com/syaghoubi00/lab/commit/0f123a1d47ee2b83b7f9db1bcb15a80cb83efa3b))
* **containers.boxes.fedora:** add pip package ([c3f2e7b](https://github.com/syaghoubi00/lab/commit/c3f2e7bf6fbbb7bb431ec5858e814d038d6f1a82))
* **containers.boxes.fedora:** add terraform package ([bbb8a60](https://github.com/syaghoubi00/lab/commit/bbb8a60732d6f509f504e255e97cfbb65ea7119f))
* **containers:** add ansible to box package-list ([de6b5c0](https://github.com/syaghoubi00/lab/commit/de6b5c078d7949f4e780cbb29ab3ddaa370589bd))
* **containers:** add containerfile for adt ([38a3950](https://github.com/syaghoubi00/lab/commit/38a3950a051430220560543245857eb7fcea5e1f))
* **containers:** add gh cli to toolbox ([0c4ce6d](https://github.com/syaghoubi00/lab/commit/0c4ce6d36e708d08505e96b8e8a45db973f161b5))
* **containers:** use explicit versioning for packages for dependabot ([175fa25](https://github.com/syaghoubi00/lab/commit/175fa25b0eed5b77296283b8f9a5d6817fe22552))
* **dependabot:** assign a reviewer for pull requests ([ff407ee](https://github.com/syaghoubi00/lab/commit/ff407eeba0c4f82934d067b70c471ac3e2f6e3f9))
* explicitly set sbom and max provenance in container workflow ([2b61a1f](https://github.com/syaghoubi00/lab/commit/2b61a1fbc50f5f36340e8e862a90ecca4c063cef))
* **scripts.ctr-pkgs:** expand regex to match fedora bootc containers ([9bb66e4](https://github.com/syaghoubi00/lab/commit/9bb66e480eadd27365e7671507ddc71f08761bbd))
* **scripts:** show diff then prompt after diff ([726f05a](https://github.com/syaghoubi00/lab/commit/726f05aab5fd85b3b533b5000213ce71e262be38))
* **terraform:** migrate to hashicorp cloud vault secrets ([8778e52](https://github.com/syaghoubi00/lab/commit/8778e526e2ac65478ea5605be1965939f99f4140)), closes [#13](https://github.com/syaghoubi00/lab/issues/13)
* **tf-lxd:** add terraform lxd profiles ([a0c727d](https://github.com/syaghoubi00/lab/commit/a0c727d7b19c53c8506728f84144ba229c0bf848))
* **tf-lxd:** add terraform lxd projects ([d2b9c6c](https://github.com/syaghoubi00/lab/commit/d2b9c6c2057585842a8bfe285a1359fbfc2b97c2))
* **tf-lxd:** add terraform lxd provider ([6004f4e](https://github.com/syaghoubi00/lab/commit/6004f4e06e37f69b349e9c13463996aa5c9e6680))
* **tf-lxd:** add terraform lxd zfs pool ([57374ac](https://github.com/syaghoubi00/lab/commit/57374accbade75e31d1f9d5c49efdec764ed5321))
* **tf-lxd:** add tf cloud-init variables ([36c2ba3](https://github.com/syaghoubi00/lab/commit/36c2ba3e9a9cfb9e7e234dade8ce5dad0a4d6eb0))
* **tf.ansible:** add dynamic inventory plugin for ansible ([b197b38](https://github.com/syaghoubi00/lab/commit/b197b3854f6beda14688debba34e6b023e208480))
* **tf.azure.provider:** add variables for provider configuration ([e7d5d9f](https://github.com/syaghoubi00/lab/commit/e7d5d9f1da932fd1e408dabe08a4eaa1d9b50883))
* **tf.azure:** add k8s cluster deployment ([28ed4b3](https://github.com/syaghoubi00/lab/commit/28ed4b39816c70e1dc162401c6e609c478632551))
* **tf.azure:** add k8s kubeconfig output ([005be87](https://github.com/syaghoubi00/lab/commit/005be87bc8e68a2fb7e151ec959de284b5291756))
* **tf.azurerm:** add azure resource manager provider ([ca11345](https://github.com/syaghoubi00/lab/commit/ca11345c7a24ea68cdb24c5b8f882b7a62913734))
* **tf.cloudflare.zags_dev:** add zone and dns record ([823736a](https://github.com/syaghoubi00/lab/commit/823736aa775e3e3f18572cc980179de3789d6846))
* **tf.digitalocean:** add docker droplet ([83b9a3f](https://github.com/syaghoubi00/lab/commit/83b9a3f3f3298959ac2025ee994453b0fd07c727))
* **tf.digitalocean:** add provider config ([2a950a8](https://github.com/syaghoubi00/lab/commit/2a950a8544fd269f2775003df2f28855a07f90dc))
* **tf.digitalocean:** add some project resources ([66e0c75](https://github.com/syaghoubi00/lab/commit/66e0c7514f91fb8c736d94b2062679e5c58c52da))
* **tf.digitalocean:** create ssh priv key file from vault ([fd95c95](https://github.com/syaghoubi00/lab/commit/fd95c95464eeaaa940ea7afe85eac72fe50cb6a2))
* **tf.digitalocean:** use root user for provisioning ([495a683](https://github.com/syaghoubi00/lab/commit/495a683e03e6e10a9dfb254cfb14262f5273e6af))
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
* **ansible:** name role and use version ([47218b9](https://github.com/syaghoubi00/lab/commit/47218b99462b0e4ec747eb6ad177d580afd0ee93))
* **ansible:** prepend author to role names in requirements ([5608922](https://github.com/syaghoubi00/lab/commit/560892227318ae24ed3493136048607311b3854a))
* **bootc:** use correct order of dnf flags during install ([aee4ad8](https://github.com/syaghoubi00/lab/commit/aee4ad8efac89998a4e177da327023b56cebea69))
* **bootc:** use nobody user to satisfy trivy even though it is ignored ([c8daff0](https://github.com/syaghoubi00/lab/commit/c8daff018d0c34fdc1c5c342df07fdb37ef9193c))
* **containers.bootc.desktop:** package exclusion breaks default config ([06c015a](https://github.com/syaghoubi00/lab/commit/06c015ac79be8cba9b890a63e78bb401e5d1f4a9))
* **containers.bootc:** remove default user ([e0da466](https://github.com/syaghoubi00/lab/commit/e0da466f6ee38887478e57f244316f56c690d9fc))
* **containers.boxes.fedora:** add en locale package for environment ([026dd57](https://github.com/syaghoubi00/lab/commit/026dd575f6b6eb81114c15d34f01bde8bdf98663))
* **containers:** set correct permissions on file ([f644755](https://github.com/syaghoubi00/lab/commit/f6447550404fccb36dc8c995c2020f1241a38f75))
* **containers:** use correct KeyValueFormat ([67b6d04](https://github.com/syaghoubi00/lab/commit/67b6d0454790f09f2ac75ae90b77d7e859a955da))
* deconflict namespace and print diff as str ([c802b9c](https://github.com/syaghoubi00/lab/commit/c802b9c978c6235779a3f6a02d8157e2db3c9f37))
* handle four layer container directories ([af05ab2](https://github.com/syaghoubi00/lab/commit/af05ab2d9b22e94b7e65ef63bf890365e0285930))
* **scripts:** improve repo closure error handling ([7b9ac39](https://github.com/syaghoubi00/lab/commit/7b9ac39a21605ccb493096559ae89e800d80c256))
* **scripts:** sys.exit if import fails, since package is required ([8e3c996](https://github.com/syaghoubi00/lab/commit/8e3c9963e812cf3eb09884ffea29979c5c5cd9aa))
* try to import dnf otherwise raise exception ([c3d0e05](https://github.com/syaghoubi00/lab/commit/c3d0e0547ea2ca83f555b3cd21de7e9da361a2f8))
* use underscope for package name to follow python conventions ([3a5a11f](https://github.com/syaghoubi00/lab/commit/3a5a11f4279e36a0872693178aff77cb27b8339e))


### Code Refactoring

* **bootc:** move bootc files to containers dir ([0f3345c](https://github.com/syaghoubi00/lab/commit/0f3345c8805103eef9bbc20a9c36a0b7ccc7b5b3))
* **tf:** move all old terraform files to old dir ([867fff7](https://github.com/syaghoubi00/lab/commit/867fff7677262fc593c9224b17dcb3071a0194b3))
* **tf:** use terraform instead of tofu ([2093160](https://github.com/syaghoubi00/lab/commit/2093160dcf8f1cf4032ee12898b80a61c969cd7a))
