include:
  - elasticsearch.repo

{% from "elasticsearch/map.jinja" import elasticsearch with context %}

elasticsearch_pkg:
  pkg.installed:
    - pkgs:
      - {{ elasticsearch.lookup.elasticsearch_pkg }}
      - {{ elasticsearch.lookup.java_pkg }}
    - require:
      - sls: elasticsearch.repo
