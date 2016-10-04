using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using eRestaurantSystem.Data.POCOs;
#endregion

//No annotations since this is not an entity

namespace eRestaurantSystem.Data.DTOs
{
    public class MenuCategoryFoodItemsDTO
    {
        public string MenuCategoryDescription { get; set; }
        public List<FoodItemCount> FoodItems { get; set; }
    }
        
}
