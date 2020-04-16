using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RealStarIceCream.App_Code.Operation
{
    public class Checks
    {
        //Check Emtry string
        public static bool Empty(string value)
        {
            return value.Equals("");
        }

        // check the given input is number only for numbers only fields
        public static bool checkNumber(string num)
        {
            try
            {
                long.Parse(num);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}