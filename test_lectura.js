const fs = require('fs');
const path = require('path');

// Ruta absoluta al archivo sopas.json
const sopasPath = path.resolve(__dirname, 'sopas.json');

try {
    const data = fs.readFileSync(sopasPath, 'utf8');
    const sopas = JSON.parse(data);
    console.log('Menú de sopas:');
    sopas.forEach(sopa => {
        console.log(`- ${sopa.nombre}: ${sopa.descripcion}`);
    });
} catch (error) {
    console.error('Error al leer el archivo:', error.message);
}
