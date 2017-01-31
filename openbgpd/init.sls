{% from 'openbgpd/map.jinja' import openbgpd, sls_block with context %}

include:
  - openbgpd.config
  - openbgpd.service

extend:
  openbgpd_service:
    service:
      - listen:
        - file: openbgpd_config
      - require:
        - file: openbgpd_config
  openbgpd_config:
    file:
      - require:
        - pkg: openbgpd_install
