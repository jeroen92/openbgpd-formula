{% from 'openbgpd/map.jinja' import openbgpd, sls_block with context %}

openbgpd_config:
  file.managed:
    {{ sls_block(openbgpd.server.opts) }}
    - name: {{ openbgpd.lookup.conf_file }}
    - source: salt://openbgpd/files/openbgpd.conf
    - mode: 600
    - template: jinja
    - context:
        config: {{ openbgpd.server.config|json() }}
