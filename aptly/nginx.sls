nginx:
  pkg.installed:
    - name: nginx
  service.running:
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/conf.d/aptly.conf

aptly_site:
  file.managed:
    - name: /etc/nginx/conf.d/aptly.conf
    - source: salt://aptly/files/aptly.conf
    - template: jinja
    - mode: 644
    - user: root
    - group: root
    - watch_in:
      - service: nginx
