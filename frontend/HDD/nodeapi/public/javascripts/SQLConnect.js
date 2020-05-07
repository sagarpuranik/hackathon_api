var Connection = require('tedious').Connection;
var Request = require('tedious').Request;
var connection;
var str_data = "";

var config = {
  server: "DESKTOP-QJODBG8",
  options: {
    database: "HDDServer",
  },
  authentication: {
    type: "default",
    options: {
      userName: "Usr1",
      password: "123456789"
}},
    options: {
     encrypt:false,
    //trustedConnection:true,
    //port:1433
}};

// var config = {
//   server: 'lt079861azuresql.database.windows.net',
//   options: {
//     database: "testdb",
//     encrypt: true
//   },
//   authentication: {
//     type: "default",
//     options: {
//       userName: "azureuser1",
//       password: "123qweasdZXC",  
//     }
//   }
// };

// var config = {
//   server: "CPCINPUDV003505",
//   options: {
//     database: "testdb",
//   },
//   authentication: {
//     type: "default",
//     options: {
//       userName: "Usr1",
//       password: "1234567890",
//     }
//   }
// };

module.exports = {
  connect: function connect() {
    connection = new Connection(config);

    connection.on('connect', function (err, res) {
      if (err) {
        console.log('Error: ', err)
      }
      else
        // If no error, then good to go...
        console.log("Connected");
    });
  },

    executeStatement: function executeStatement(res) {
      let data = [];
      return new Promise((resolve,rej)=>{
      request = new Request("select [ServerName],[IP],[Size] from [dbo].[Server_Log]", function (err, rowCount) {
        if (err) {
          console.log(err);
        } else {
          console.log(rowCount + ' rows');
        }
      });  

    request.on('row', (column) => {
      data.push({ ServerName: column[0].value, IP: column[1].value, Size: column[2].value })
    })

    request.on('requestCompleted',function(columns){
      return resolve(data)
      // res.json(data);
      console.log("Table Data Fetched");
    });
    
    connection.execSql(request);

  })
  },

  executeStatement1: function executeStatement1(res, sname, arr) {
    let data = [];
    
   return new Promise((resolve,rej)=>{
      request = new Request("use HDDServer;EXEC [dbo].[Compare_Tables] @Table1='Server_Table_"+sname+"',@Table2='Server_Table_"+arr+"'", function (err, rowCount) {
        if (err) {
          console.log(err);
        } else {
          console.log(rowCount + ' rows');
          return resolve(data);
          //console.log(data);
        }
      });
      request.on('row', (column) => {
        data.push({ Name: column[0].value, FilePath: column[1].value, SizeInBytes_A: column[2].value, SizeInBytes_B: column[3].value, ScanStamp_A: column[4].value.toGMTString(), ScanStamp_B: column[5].value.toGMTString() })
        // console.log(data);
      })

    connection.execSql(request);
  })
  },

  executeStatement2: function executeStatement2(res, sname, comp_dt) {
    let data = [];

    return new Promise((resolve,rej)=>{
      request = new Request("use HDDServer;EXEC [dbo].[Graph_Compare] @MachineName='"+sname+"',@Date='"+comp_dt+"'", function (err, rowCount) {
        if (err) {
          console.log(err);
        } else {
          console.log(rowCount + ' rows');
          
        }
       });
    request.on('row', (column) => {
      data.push({ Name: column[0].value, FilePath: column[1].value, SizeInBytes_A: column[2].value, SizeInBytes_B: column[3].value, ScanStamp_A: column[4].value.toString(),ScanStamp_B: column[5].value.toString(),CreationDate: column[5].value.toLocaleDateString()})
    })

     request.on('requestCompleted',function(columns){
      console.log("Graph Compare Data");
      return resolve(data)
      // res.json(data);
    });

    connection.execSql(request);
      });

    } 
}
