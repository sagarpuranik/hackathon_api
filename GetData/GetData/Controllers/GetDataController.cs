using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.UI.WebControls;
using DBContextLibrary;
//using a=ContextProject;

namespace GetData.Controllers
{
    public class GetDataController : ApiController
    {

        [HttpPost]
        // [Route("api/controller/insert")]
        public List<SP_InsertAssociateBilling_Result> insertRecords([FromBody] insertBilling data)
        {
            Class1 c1 = new Class1();
            var result = c1.insertBilling(data.userid, data.month);
            return result;
        }

        [HttpPost]
        //[Route("api/controller/update")]
        public List<SP_UpdateBilling_Result> updateRecords([FromBody] updateBilling data)
        {
            Class1 c1 = new Class1();
            var result = c1.updateBilling(data.userid, data.month, data.week1, data.week2, data.week3, data.week4, data.week5, data.manager, data.cost, data.rate, data.pono, data.invoice, data.status);
            return result;
        }
    }
    public class insertBilling
    {
        public string userid { get; set; }
        public string month { get; set; }
    }

    public class updateBilling
    {
        public int userid { get; set; }
        public int month { get; set; }
        public int week1 { get; set; }
        public int week2 { get; set; }
        public int week3 { get; set; }
        public int week4 { get; set; }
        public int week5 { get; set; }
        public string manager { get; set; }
        public string cost { get; set; }
        public decimal rate { get; set; }
        public string pono { get; set; }
        public string invoice { get; set; }
        public bool status { get; set; }
    }

}
