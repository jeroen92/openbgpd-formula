{% from 'openbgpd/map.jinja' import openbgpd, sls_block with context %}
{% set service_function = {True:'running', False:'dead'}.get(openbgpd.service.enable) %}

include:
  - openbgpd.pkg

openbgpd_service:
  service.{{ service_function }}:
    {{ sls_block(openbgpd.service.opts) }}
    - name: {{ openbgpd.lookup.service }}
    - enable: {{ openbgpd.service.enable }}
    - require:
      - sls: openbgpd.pkg
    - listen:
      - pkg: openbgpd_install
