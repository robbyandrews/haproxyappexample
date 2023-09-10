const express = require('express');
const cookieParser = require("cookie-parser");
const sessions = require('express-session');
const app = express();
const PORT = 3000;
const { networkInterfaces } = require('os');

const nets = networkInterfaces();
const oneDay = 1000 * 60 * 60 * 24;
app.disable('x-powered-by');
//session middleware
app.use(sessions({
    secret: "thisismysecrctekeyfhrgfgrfrty84fwir767",
    saveUninitialized:true,
    cookie: { maxAge: oneDay },
    resave: false
}));
// parsing the incoming data
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//serving public file
app.use(express.static(__dirname));
// cookie parser middleware
app.use(cookieParser());
//username and password
const myusername = 'robby'
const mypassword = 'robby'

// a variable to save a session
var session;



app.get('/',(req,res) => {
    session=req.session;
    if(session.userid){
        res.send(`Welcome User <a href=\'/logout'>click to logout</a> ${nets.net1[0].cidr}`);
    }else
    res.sendFile('views/index.html',{root:__dirname})
});

app.post('/user',(req,res) => {
    if(req.body.username == myusername && req.body.password == mypassword){
        session=req.session;
        session.userid=req.body.username;
        console.log(req.session)
        res.send(`Hey there, welcome <a href=\'/logout'>click to logout</a> ${nets.net1[0].cidr}`);
    }
    else{
        res.send(`Invalid username or password ${nets.net1[0].cidr}`);
    }
})

app.get('/test',(req,res) => {
session=JSON.stringify(req.session);
res.send(`${session} ip addr ${nets.net1[0].cidr}`);


});


app.post('/post',(req,res) =>{
var username = req.body.username;
var password = req.body.password;
res.send(`${username} ${password} ${nets.net1[0].cidr}`)

});



app.get('/logout',(req,res) => {
    req.session.destroy();
    res.redirect('/');
});

app.get('/health',(req,res) =>{
res.send(`success ${nets.net1[0].cidr}`);

});


app.listen(PORT,`${nets.net1[0].address}`, () => console.log(`Server Running at port ${PORT}`));
