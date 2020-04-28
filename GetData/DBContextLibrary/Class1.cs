using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DBContextLibrary
{
    public class Class1
    {
        public List<SP_PMOUserOrNot_Result> getUserRole(string userid, string month)
        {
            JDCTSDBEntities entity = new JDCTSDBEntities();
            var res = entity.SP_PMOUserOrNot(userid, month).ToList();
            return res;
        }
        public List<SP_InsertAssociateBilling_Result> insertBilling(string userid, string month)
        {
            JDCTSDBEntities entity = new JDCTSDBEntities();
            var res = entity.SP_InsertAssociateBilling(userid, month).ToList();
            return res;
        }

        public List<SP_UpdateBilling_Result> updateBilling(int userid, int month, int week1, int week2, int week3, int week4, int week5, string manager, string cost, decimal rate, string pono, string invoice, bool status)
        {
            JDCTSDBEntities entity = new JDCTSDBEntities();
            var res = entity.SP_UpdateBilling(userid, month, week1, week2, week3, week4, week5, manager, cost, rate, pono, invoice, status).ToList();
            return res;
        }

    }
}
