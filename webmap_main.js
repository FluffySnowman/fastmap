const express = require('express');

const app = express();

app.set('views', './views');
app.set('view engine', 'ejs');
app.use(express.static('./public'));

app.get('/*', (req, res) => res.send('whats up'));

app.listen(42069, () => console.log('running on port 42069'));


app.get('/*', async (req, res) => {
    const global = await api.all();
    res.render('index', { global });
});