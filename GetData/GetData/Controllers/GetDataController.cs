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

    //public List<MasterDataTable> getMasterRecords()
    // {
    //     Class1 c = new Class1();
    //     var res = c.getMasterDataTabe();
    //     return res;
    // }

    //public List<SP_FetchData_Result> getRecords()
    //{
    //  Class1 c1 = new Class1();
    //  var result = c1.getDetails();
    //  return result;
    //}

   [HttpPost]
   // [Route("api/controller/insert")]
    public List<SP_InsertAssociateBilling_Result> getRecords3(getRecords2 data)
    {
      Class1 c1 = new Class1();
      var result = c1.getDetails3(data.userid, data.month);
      return result;
    }

    [HttpPost]
   //[Route("api/controller/update")]
    public List<SP_UpdateBilling_Result> getRecords4([FromBody] getRecords3 data)
    {
      Class1 c1 = new Class1();
      var result = c1.getDetails4(data.userid, data.month, data.week1, data.week2, data.week3, data.week4, data.week5);
      return result;
    }

    //[HttpPost]
    //[Route("api/controller/login")]
    //public Boolean login([FromBody] login data)
    //{
    //  if (data.user == "a" & data.pass == "a")
    //    return true;
    //  else return false;
    //}
  }

  public class login
  {
    public string user { get; set; }
    public string pass { get; set; }

  }
  public class getRecords2
  {
    public string userid { get; set; }
    public string month { get; set; }

  }
  public class getRecords3
  {
    public int userid { get; set; }
    public int month { get; set; }
    public int week1 { get; set; }
    public int week2 { get; set; }
    public int week3 { get; set; }
    public int week4 { get; set; }
    public int week5 { get; set; }
  }
}
