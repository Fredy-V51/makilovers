# 🍣 Makilovers - Plataforma de Gestión Gastronómica Digital

**Makilovers** no es solo una carta digital; es un ecosistema de interacción entre el restaurante y el cliente, diseñado bajo los más altos estándares de rendimiento y escalabilidad. 

Este proyecto materializa la visión de **Via51**, transformando la experiencia de pedido en un proceso fluido, intuitivo y dinámico.

---

## 💎 Filosofía de Desarrollo: Antigravity & Skills

Nuestra arquitectura se basa en dos pilares fundamentales que garantizan calidad mundial:

1.  **Antigravity (Levedad y Fluidez):** El Front-end está optimizado para una carga instantánea. Eliminamos la "gravedad" del código innecesario para que el usuario navegue sin fricciones, especialmente en dispositivos móviles.
2.  **Skills (Lógica Inteligente):** El sistema posee capacidades modulares para gestionar reservas, notas de pedido, consultas directas y geolocalización de locales, adaptándose a las necesidades operativas del negocio en tiempo real.

---

## 🚀 Arquitectura Técnica (Serverless 2026)

Hemos implementado una infraestructura de "Cero Mantenimiento" utilizando la potencia de Google Cloud y Firebase:

* **Front-end:** HTML5, CSS3 Moderno y JavaScript Vanilla (sin frameworks pesados para mantener el concepto *Antigravity*).
* **Hosting:** **Firebase Hosting**. Proporciona despliegue global, CDN y certificados SSL automáticos bajo el dominio `via51-makilovers.web.app`.
* **Back-end (Base de Datos):** **Cloud Firestore**. Base de datos NoSQL en tiempo real que permite un control **CRUD** total sobre platos, precios y sedes sin necesidad de rediseñar el sitio.
* **Canal de Conversión:** Integración con **WhatsApp Business API** para el cierre de ventas y atención al cliente.



---

## 🛠️ Guía de Operaciones

### Requisitos del Entorno
- **IDE:** GitHub Codespaces.
- **Herramientas:** Firebase CLI (v15.x o superior).

### Comandos de Despliegue
Para sincronizar cambios locales con el servidor de producción:
```bash
firebase deploy --only hosting