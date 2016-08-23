include:
  - elasticsearch.repo

elasticsearch_pkg:
  pkg.installed:
    pkgs:
      - elasticsearch
      - openjdk-8-jre
    - require:
      - sls: elasticsearch.repo
