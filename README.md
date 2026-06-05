# Flutter Layout Demo - Sitios Turísticos

## Descripción

Esta aplicación móvil desarrollada en Flutter presenta una galería de sitios turísticos mediante una interfaz basada en widgets. Cada lugar muestra una imagen, información descriptiva, botones de interacción y un sistema de favoritos.

Además, se integró la funcionalidad de redirección a Google Maps para que el usuario pueda visualizar la ubicación exacta de cada destino turístico.

## Dependencias para el funcionamiento del Geolocalizacion

```yaml
dependencies:
  flutter:
    sdk: flutter
  url_launcher: ^6.3.2
```

## Instalación

1. Instalar dependencias.

```bash
flutter pub get
```

2. Ejecutar la aplicación.

```bash
flutter run
```

## Funcionalidades Implementadas

### Integración con Google Maps

Mediante el paquete `url_launcher`, el botón ROUTE permite abrir Google Maps y mostrar la ubicación correspondiente del sitio turístico seleccionado.

Ejemplo:

```dart
Dentro de la columna Childen, se agrega una seccion llamada:
ButtonSection(mapsUrl: 'https://maps.app.goo.gl/UbE45SZKUac1VJVY7'),

```

## Lugares Incluidos

* Oeschinen Lake Campground
* Paisaje de Niebla
* Volcán Cotopaxi
* Centro Histórico de Quito
* El Panecillo
* Mitad del Mundo
* Otavalo
* Quilotoa
* Mindo
* Papallacta

## Autor

Desarrollado con navegación externa en Flutter.

## Capturas de pantalla

### Vista principal de la aplicación

![Vista principal](https://github.com/user-attachments/assets/cdf21907-baed-4534-87db-b2ddd033f19e)

![Listado de sitios turísticos](https://github.com/user-attachments/assets/5552e744-46e8-4b82-9e12-e250900dc648)

![Favoritos](https://github.com/user-attachments/assets/3ec6bfb6-b7ae-48f0-8c63-a2ed83a9db31)

### Integración con Google Maps

![Google Maps](https://github.com/user-attachments/assets/5c028bbf-7fdc-4ccf-8dc2-0855b8ea8ed3)

