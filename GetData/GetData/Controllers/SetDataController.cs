using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Web.Mvc;
using System.Web.Http;
using System.Web.UI.WebControls;
using DBContextLibrary;

namespace GetData.Controllers
{
    public class SetDataController : ApiController
    {
        // GET: SetData
        [HttpPost]
        public Boolean Update([FromBody] Timesheet data)
        {
        return true;
        }
    }
    public class Timesheet
    {
        public string AssociateID { get; set; }
        public string AssociateName { get; set; }
        public string RacfID { get; set; }
        public string ProjectManager { get; set; }
        public string CostCentre { get; set; }
        public int Week1 { get; set; }
        public int Week2 { get; set; }
        public int Week3 { get; set; }
        public int Week4 { get; set; }
        public int Week5 { get; set; }
        public string Rate { get; set; }
        public string PoNo { get; set; }
        public string InvoiceNo { get; set; }
        public string AssociateStatus { get; set; }
        public string UserRole { get; set; }

  }
}
