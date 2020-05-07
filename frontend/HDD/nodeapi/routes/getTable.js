var express = require('express');
var router = express.Router();
var Request = require('tedious').Request;
var sql= require('../public/javascripts/SQLConnect');

router.post('/', (req,res) =>{
    
    class List{
        constructor(Name,FilePath,SizeInBytes,ScanStamp)
        {
            this.Name= Name;
            this.FilePath=FilePath;
            this.SizeInBytes=SizeInBytes;
            this.ScanStamp=ScanStamp;
        }
    }

    
    var sample = new Array();
    for(var i=0;i<req.body.list.length;i++)
    {
        sample.push(new List());
    }
    // console.log(sample);

    var result = getvalues(req,res);
    console.log(req.body.list.length)

    async function getvalues(req,res){

    for(var i=0;i<req.body.list.length;i++)    
        sample[i] = await sql.executeStatement1(res,req.body.serverName,req.body.list[i]);       
        res.send(sample);

    }
})
    

module.exports = router;