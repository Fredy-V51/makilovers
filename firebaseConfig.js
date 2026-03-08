/**
 * Configuración centralizada de Firebase
 * Carga credenciales desde variables de entorno (.env)
 * Nunca hardcódea secretos - SOLO para desarrollo local
 */

const admin = require('firebase-admin');

let db = null;
let initialized = false;

/**
 * Inicializa Firebase Admin SDK
 * Lee credenciales desde GOOGLE_APPLICATION_CREDENTIALS (variable de entorno)
 */
function initializeFirebase() {
    if (initialized && db) {
        return db;
    }

    try {
        // Verificar que la variable de entorno esté configurada
        if (!process.env.GOOGLE_APPLICATION_CREDENTIALS) {
            console.warn(
                '⚠️  GOOGLE_APPLICATION_CREDENTIALS no está configurado.\n' +
                '   Firestore no estará disponible.\n' +
                '   Usar: export GOOGLE_APPLICATION_CREDENTIALS="/ruta/a/serviceAccountKey.json"'
            );
            return null;
        }

        // Inicializar Admin SDK con credenciales del archivo especificado
        if (!admin.apps.length) {
            admin.initializeApp({
                credential: admin.credential.applicationDefault()
            });
            console.log('✅ Firebase Admin SDK inicializado correctamente');
        }

        db = admin.firestore();
        initialized = true;
        return db;

    } catch (error) {
        console.error('❌ Error al inicializar Firebase:', error.message);
        return null;
    }
}

/**
 * Obtiene la instancia de Firestore (singleton)
 */
function getFirestore() {
    if (!db) {
        return initializeFirebase();
    }
    return db;
}

/**
 * Verifica si Firebase está disponible
 */
function isFirebaseAvailable() {
    return process.env.USE_FIRESTORE === 'true' && getFirestore() !== null;
}

module.exports = {
    initializeFirebase,
    getFirestore,
    isFirebaseAvailable
};
