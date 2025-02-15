# Changelog

## 1.0.0 (2025-02-15)


### ⚠ BREAKING CHANGES

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
* **ansible:** migrate to remote roles ([223bd6b](https://github.com/syaghoubi00/lab/commit/223bd6bf0bfec3ef670785f54a2457ffe30a737d))
* **bootc:** add desktop build definition and config ([9a7ec3d](https://github.com/syaghoubi00/lab/commit/9a7ec3d516af320d335a2b1ac1d3175ab3493d30))
* **configs:** add coredns corefile ([2094986](https://github.com/syaghoubi00/lab/commit/2094986bf66c501a479045ad042fac2a3fe9dfa5))
* **containers.bootc:** add bootc linting to build definition ([afdf118](https://github.com/syaghoubi00/lab/commit/afdf1184336063bb29005f3a1f26f63daabec391))
* **containers:** add ansible to box package-list ([de6b5c0](https://github.com/syaghoubi00/lab/commit/de6b5c078d7949f4e780cbb29ab3ddaa370589bd))
* **containers:** add containerfile for adt ([38a3950](https://github.com/syaghoubi00/lab/commit/38a3950a051430220560543245857eb7fcea5e1f))
* **containers:** add gh cli to toolbox ([0c4ce6d](https://github.com/syaghoubi00/lab/commit/0c4ce6d36e708d08505e96b8e8a45db973f161b5))
* **containers:** use explicit versioning for packages for dependabot ([175fa25](https://github.com/syaghoubi00/lab/commit/175fa25b0eed5b77296283b8f9a5d6817fe22552))
* **dependabot:** assign a reviewer for pull requests ([ff407ee](https://github.com/syaghoubi00/lab/commit/ff407eeba0c4f82934d067b70c471ac3e2f6e3f9))
* explicitly set sbom and max provenance in container workflow ([2b61a1f](https://github.com/syaghoubi00/lab/commit/2b61a1fbc50f5f36340e8e862a90ecca4c063cef))
* **scripts.ctr-pkgs:** expand regex to match fedora bootc containers ([9bb66e4](https://github.com/syaghoubi00/lab/commit/9bb66e480eadd27365e7671507ddc71f08761bbd))
* **scripts:** show diff then prompt after diff ([726f05a](https://github.com/syaghoubi00/lab/commit/726f05aab5fd85b3b533b5000213ce71e262be38))
* **tf-lxd:** add terraform lxd profiles ([a0c727d](https://github.com/syaghoubi00/lab/commit/a0c727d7b19c53c8506728f84144ba229c0bf848))
* **tf-lxd:** add terraform lxd projects ([d2b9c6c](https://github.com/syaghoubi00/lab/commit/d2b9c6c2057585842a8bfe285a1359fbfc2b97c2))
* **tf-lxd:** add terraform lxd provider ([6004f4e](https://github.com/syaghoubi00/lab/commit/6004f4e06e37f69b349e9c13463996aa5c9e6680))
* **tf-lxd:** add terraform lxd zfs pool ([57374ac](https://github.com/syaghoubi00/lab/commit/57374accbade75e31d1f9d5c49efdec764ed5321))
* **tf-lxd:** add tf cloud-init variables ([36c2ba3](https://github.com/syaghoubi00/lab/commit/36c2ba3e9a9cfb9e7e234dade8ce5dad0a4d6eb0))
* **tf.libvirt:** add old libvirt tf files pre lxd migration for ref ([ab3e2b2](https://github.com/syaghoubi00/lab/commit/ab3e2b2f1594b57f51a7cf364c8152165912abd5))
* **tf.lxd:** add example template for creating an instance ([5f96c13](https://github.com/syaghoubi00/lab/commit/5f96c13dbaa32b13899220cc7279f80595b74727))
* **tf:** add cloud-init templatefile ([31a2a8d](https://github.com/syaghoubi00/lab/commit/31a2a8de4a49ef254e2502d8ebed8c7168194774))
* **tf:** add tf required providers ([7d4aac1](https://github.com/syaghoubi00/lab/commit/7d4aac18ba64b144de8ccb5ba8a89d493cc97a88))
* update dependabot config to run daily ([e69a672](https://github.com/syaghoubi00/lab/commit/e69a672ed4d22c496496914f7a4b0078618b3200))


### Bug Fixes

* add permissions to config scanner ([2eddce4](https://github.com/syaghoubi00/lab/commit/2eddce4bc8d5cf5cc94da76d895b93cf0bde53d3))
* always upload trivy config scans to security tab ([5d09f15](https://github.com/syaghoubi00/lab/commit/5d09f15c25fe6e9681c271193d5438c0a8c9711b))
* **ansible-docker:** set docker repo filename explicitly ([7cc8f25](https://github.com/syaghoubi00/lab/commit/7cc8f25576dc04acf5b66353835e5bd70e78d7c2))
* **ansible:** name role and use version ([47218b9](https://github.com/syaghoubi00/lab/commit/47218b99462b0e4ec747eb6ad177d580afd0ee93))
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
