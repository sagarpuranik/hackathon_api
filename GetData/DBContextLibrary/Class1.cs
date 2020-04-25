using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBContextLibrary
{
    public class Class1
    {
    //public List<MasterDataTable> getMasterDataTabe()
    //{
    //    JDCTSDBEntities c = new JDCTSDBEntities();
    //    var r = c.MasterDataTables.ToList();
    //    return r;
    //}
    //public List<SP_FetchData_Result> getDetails()
    //{
    //  JDCTSDBEntities entity = new JDCTSDBEntities();
    //  var res = entity.SP_FetchData().ToList();
    //  return res;
    //}

    public List<SP_PMOUserOrNot_Result> getDetails2(string userid, string month)
    {
      JDCTSDBEntities entity = new JDCTSDBEntities();
      var res = entity.SP_PMOUserOrNot(userid, month).ToList();
      return res;
    }
    public List<SP_InsertAssociateBilling_Result> getDetails3(string userid, string month)
    {
      JDCTSDBEntities entity = new JDCTSDBEntities();
      var res = entity.SP_InsertAssociateBilling(userid, month).ToList();
      return res;
    }

    public List<SP_UpdateBilling_Result> getDetails4(int userid, int month,int week1, int week2,int week3, int week4,int week5)
    {
      JDCTSDBEntities entity = new JDCTSDBEntities();
      var res = entity.SP_UpdateBilling(userid, month, week1, week2, week3, week4, week5).ToList();
      return res;
    }

  }
}
