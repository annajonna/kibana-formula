# Setup Elastic Repo
{% from "kibana/map.jinja" import kibana with context %}

kibana_repo:
  pkgrepo.managed:
    - humanname: Kibana 
{%- if grains.get('os_family') == 'Debian' %}
    - name: deb {{ repo_url }}/apt stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/elasticsearch.list
    - keyid: D88E42B4
    - keyserver: keyserver.ubuntu.com
    - clean_file: true
{%- elif grains['os_family'] == 'RedHat' %}
    - name: elasticsearch
    - baseurl: {{ repo_url }}/yum
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: http://artifacts.elastic.co/GPG-KEY-elasticsearch
{%- endif %}
