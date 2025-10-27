const http = require('http');
const PORT = 3000;


const server = http.createServer((req, res) => {
res.end(`Hello Jenkins !!!!! Build time: ${new Date().toISOString()}\n`);
});


server.listen(PORT, () => console.log(`Listening on ${PORT}`));