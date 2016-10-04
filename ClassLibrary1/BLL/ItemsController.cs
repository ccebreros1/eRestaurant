using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region AdditionalNamespaces
using System.ComponentModel;
using eRestaurantSystem.DAL;
using eRestaurantSystem.Data.Entities;
using eRestaurantSystem.Data.POCOs;
using eRestaurantSystem.Data.DTOs;
#endregion

namespace eRestaurantSystem.BLL
{
    [DataObject]
    public class ItemsController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Item> Item_ListAll()
        {
            //Setup transaction area
            using (var context = new eRestaurantContext()) //Goes to the appropiate context class
            {
                //Gets the entire table comming back
                return context.Items.ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsPOCO> MenuCategoryFoodItemsPOCO_Get()
        {
            //Setup transaction area
            using (var context = new eRestaurantContext()) //Goes to the appropiate context class
            {
                //Gets the data using the Linq query
                //When you bring your query from Linqpad to your program you must change your reference(s) to the data source
                //You may also need to change your navigation referencing use in Linqpad
                //to the navigation properties you stated in the Entity class definitions
                var results = from food in context.Items
                              orderby food.MenuCategory.Description
                              select new MenuCategoryFoodItemsPOCO
                              {
                                  MenuCategoryDescription = food.MenuCategory.Description,
                                  ItemID = food.ItemID,
                                  FoodDescription = food.Description,
                                  CurrentPrice = food.CurrentPrice,
                                  TimesServed = 10 //food.BillItems.Count()
                              };
                return results.ToList();
            }

        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<MenuCategoryFoodItemsDTO> MenuCategoryFoodItemsDTO_Get()
        {
            //Setup transaction area
            using (var context = new eRestaurantContext()) //Goes to the appropiate context class
            {
                //Gets the data using the Linq query
                //When you bring your query from Linqpad to your program you must change your reference(s) to the data source
                //You may also need to change your navigation referencing use in Linqpad
                //to the navigation properties you stated in the Entity class definitions
                var results = from food in context.Items
                              group food by new { food.MenuCategory.Description } into tempdataset
                              select new MenuCategoryFoodItemsDTO
                              {
                                  MenuCategoryDescription = tempdataset.Key.Description,

                                  FoodItems = (from x in tempdataset
                                               select new FoodItemCount
                                               {
                                                   ItemID = x.ItemID,
                                                   FoodDescription = x.Description,
                                                   CurrentPrice = x.CurrentPrice,
                                                   TimesServed = 10//x.BillItems.Count()
                                               }).ToList()
                              };


                //The following requires the query data in memory
                //.ToList()
                //At this point the query will actually execute
                return results.ToList();
            }

        }
    }
}
