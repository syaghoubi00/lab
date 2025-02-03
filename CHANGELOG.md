# Changelog

## 1.0.0 (2025-02-03)


### ⚠ BREAKING CHANGES

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
* **configs:** add coredns corefile ([2094986](https://github.com/syaghoubi00/lab/commit/2094986bf66c501a479045ad042fac2a3fe9dfa5))
* **containers:** add ansible to box package-list ([de6b5c0](https://github.com/syaghoubi00/lab/commit/de6b5c078d7949f4e780cbb29ab3ddaa370589bd))
* **containers:** add containerfile for adt ([38a3950](https://github.com/syaghoubi00/lab/commit/38a3950a051430220560543245857eb7fcea5e1f))
* **containers:** add gh cli to toolbox ([0c4ce6d](https://github.com/syaghoubi00/lab/commit/0c4ce6d36e708d08505e96b8e8a45db973f161b5))
* **containers:** use explicit versioning for packages for dependabot ([175fa25](https://github.com/syaghoubi00/lab/commit/175fa25b0eed5b77296283b8f9a5d6817fe22552))
* **dependabot:** assign a reviewer for pull requests ([ff407ee](https://github.com/syaghoubi00/lab/commit/ff407eeba0c4f82934d067b70c471ac3e2f6e3f9))
* explicitly set sbom and max provenance in container workflow ([2b61a1f](https://github.com/syaghoubi00/lab/commit/2b61a1fbc50f5f36340e8e862a90ecca4c063cef))
* **tf-lxd:** add terraform lxd profiles ([a0c727d](https://github.com/syaghoubi00/lab/commit/a0c727d7b19c53c8506728f84144ba229c0bf848))
* **tf-lxd:** add terraform lxd projects ([d2b9c6c](https://github.com/syaghoubi00/lab/commit/d2b9c6c2057585842a8bfe285a1359fbfc2b97c2))
* **tf-lxd:** add terraform lxd provider ([6004f4e](https://github.com/syaghoubi00/lab/commit/6004f4e06e37f69b349e9c13463996aa5c9e6680))
* **tf-lxd:** add terraform lxd zfs pool ([57374ac](https://github.com/syaghoubi00/lab/commit/57374accbade75e31d1f9d5c49efdec764ed5321))
* **tf-lxd:** add tf cloud-init variables ([36c2ba3](https://github.com/syaghoubi00/lab/commit/36c2ba3e9a9cfb9e7e234dade8ce5dad0a4d6eb0))
* **tf:** add cloud-init templatefile ([31a2a8d](https://github.com/syaghoubi00/lab/commit/31a2a8de4a49ef254e2502d8ebed8c7168194774))
* **tf:** add tf required providers ([7d4aac1](https://github.com/syaghoubi00/lab/commit/7d4aac18ba64b144de8ccb5ba8a89d493cc97a88))
* update dependabot config to run daily ([e69a672](https://github.com/syaghoubi00/lab/commit/e69a672ed4d22c496496914f7a4b0078618b3200))


### Bug Fixes

* add permissions to config scanner ([2eddce4](https://github.com/syaghoubi00/lab/commit/2eddce4bc8d5cf5cc94da76d895b93cf0bde53d3))
* always upload trivy config scans to security tab ([5d09f15](https://github.com/syaghoubi00/lab/commit/5d09f15c25fe6e9681c271193d5438c0a8c9711b))
* **ansible-docker:** set docker repo filename explicitly ([7cc8f25](https://github.com/syaghoubi00/lab/commit/7cc8f25576dc04acf5b66353835e5bd70e78d7c2))
* **ansible:** name role and use version ([47218b9](https://github.com/syaghoubi00/lab/commit/47218b99462b0e4ec747eb6ad177d580afd0ee93))
* **containers:** set correct permissions on file ([f644755](https://github.com/syaghoubi00/lab/commit/f6447550404fccb36dc8c995c2020f1241a38f75))
* **containers:** use correct KeyValueFormat ([67b6d04](https://github.com/syaghoubi00/lab/commit/67b6d0454790f09f2ac75ae90b77d7e859a955da))
* handle four layer container directories ([af05ab2](https://github.com/syaghoubi00/lab/commit/af05ab2d9b22e94b7e65ef63bf890365e0285930))
