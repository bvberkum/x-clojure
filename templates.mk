define FIG1_DIGRAPH
digraph {
  rankdir="LR" ;
  node [ shape=Mrecord ] ;

  GIT [ label="GIT", URL="$$package_urls_source_code__0" ] ;
  Docker_Hub [ label="Hub", URL="$$package_urls_images__0" ] ;

  GIT -> Docker_Hub ;
  // vim:ft=dot:
}
endef

define ReadMe_md
# [![](http://img.shields.io/travis/bvberkum/$$package_main.svg)](https://travis-ci.org/bvberkum/$$package_main) ![repo license](https://img.shields.io/github/license/bvberkum/$$package_main.svg) ![commits per year](https://img.shields.io/github/commit-activity/y/bvberkum/$$package_main.svg) ![](https://img.shields.io/github/languages/code-size/bvberkum/$$package_main.svg) ![](https://img.shields.io/github/repo-size/bvberkum/$$package_main.svg)
###### master: ![latest/master](https://img.shields.io/github/last-commit/bvberkum/$$package_main/master.svg) latest: ![image size](https://img.shields.io/imagelayers/image-size/bvberkum/$$package_main/latest.svg) ![image layers](https://img.shields.io/imagelayers/layers/bvberkum/$$package_main/latest.svg) release: ![](https://img.shields.io/github/tag/bvberkum/$$package_main.svg) dev: ![dev](https://img.shields.io/github/last-commit/bvberkum/$$package_main/dev.svg) ![image size](https://img.shields.io/imagelayers/image-size/bvberkum/$$package_main/dev.svg) ![image layers](https://img.shields.io/imagelayers/layers/bvberkum/$$package_main/dev.svg)

$$(cat ReadMe.txt)

##### Version: $$package_version

<img src="asset/ReadMe-fig1.svg" alt="Fig 1. illustration of main project flow. " width="60%" >

#### Test:
\`\`\`
$$package_scripts_test__0
\`\`\`
endef

#define ReadMe_rst
#endef

export FIG1_DIGRAPH ReadMe_md ReadMe_rst
