# fail2ban-checker

fail2ban-checker es una herramienta diseñada para comparar las direcciones IP bloqueadas por Fail2ban con las reglas de bloqueo configuradas en Shorewall o iptables. Esta utilidad proporciona una manera eficiente de detectar discrepancias entre las IP bloqueadas por Fail2ban y las configuraciones del firewall, permitiendo identificar y corregir posibles problemas de sincronización entre los sistemas de prevención de intrusiones y el firewall.

## Características

- **Verificación Automatizada:** fail2ban-checker automatiza el proceso de comparación entre las direcciones IP bloqueadas por Fail2ban y las reglas de Shorewall o iptables.
- **Detección de Discrepancias:** Identifica cualquier discrepancia entre las IP bloqueadas por Fail2ban y las configuraciones del firewall.
- **Facilidad de Uso:** Interfaz sencilla y fácil de entender para usuarios de todos los niveles de experiencia.
- **Integración con GitHub:** Proyecto de código abierto alojado en GitHub para colaboración y contribuciones de la comunidad.

## Uso

Para utilizar fail2ban-checker, simplemente clona el repositorio y ejecuta el script:

```bash
# Clonar el repositorio
git clone https://github.com/tuxsoul/fail2ban-checker.git

# Entrar al directorio
cd fail2ban-checker

# Ejecutar el script
./fail2ban-checker.sh
```

## Contribuciones
Las contribuciones son bienvenidas. Si deseas contribuir al desarrollo de fail2ban-checker, por favor crea un issue o envía una pull request.

## Donaciones
Si encuentras útil fail2ban-checker y deseas apoyar su desarrollo, las donaciones son bienvenidas. Puedes hacer una donación a través de [enlace a tu plataforma de donaciones preferida].

## Licencia
Este proyecto está licenciado bajo la Licencia GNU General Public License v3.0.
