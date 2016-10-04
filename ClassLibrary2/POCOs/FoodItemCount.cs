using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eRestaurantSystem.Data.POCOs
{
    public class FoodItemCount
    {
        public int ItemID { get; set; }
        public string FoodDescription { get; set; }
        public double CurrentPrice { get; set; }
        public int TimesServed { get; set; }
    }
}
