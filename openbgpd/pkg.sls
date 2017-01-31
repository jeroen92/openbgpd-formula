{% from 'openbgpd/map.jinja' import openbgpd, sls_block with context %}

openbgpd_install:
  pkg.installed:
    {{ sls_block(openbgpd.package.opts) }}
    - name: {{ openbgpd.lookup.package }}
