const { io } = require('../index');
// Sockets messages
io.on('connection', client => {
    console.log('Client connected');
    client.on('disconnect', () => {
        console.log('Cliente desconnnected');
    });

    client.on('message', (payload) => {
        console.log('Acaba de llegar un mensaje', payload);
    });
});