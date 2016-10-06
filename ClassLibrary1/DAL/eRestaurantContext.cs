﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces

using System.Data.Entity;
using eRestaurantSystem.Data.Entities;

#endregion

namespace eRestaurantSystem.DAL
{
    internal class eRestaurantContext:DbContext
    {

        public eRestaurantContext():base("eRestaurant")
        {

        }

        public DbSet<Item> Items { get; set; }
        public DbSet<MenuCategory> MenuCategories { get; set; }
        public DbSet<BillItem> BillItems { get; set; }
        public DbSet<Bill> Bills { get; set; }

    }
}
