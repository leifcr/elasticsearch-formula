include:
  - elasticsearch.pkg

elasticsearch_cfg:
  file.managed:
    - name: /etc/elasticsearch/elasticsearch.yml
    - source: salt://elasticsearch/files/elasticsearch.yml
    - template: jinja
    - mode: 750
    - user: root
    - group: elasticsearch
    - require:
      - sls: elasticsearch.pkg

{% set data_dir = salt['pillar.get']('elasticsearch:config:path.data') %}
{% set log_dir = salt['pillar.get']('elasticsearch:config:path.logs') %}

{% for dir in (data_dir, log_dir) %}
{% if dir %}
{{ dir }}:
  file.directory:
    - user: elasticsearch
    - group: elasticsearch
    - mode: 0700
    - makedirs: True
{% endif %}
{% endfor %}
