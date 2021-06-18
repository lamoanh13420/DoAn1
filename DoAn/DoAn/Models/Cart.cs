using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DoAn.Models
{
    public class CartItem
    {
        public Tour _tour { get; set; }
        public int _quantity { get; set; }
    }
    public class Cart
    {
        List<CartItem> items = new List<CartItem>();
        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }

        /*public void Add(DiaDanh dd, int _quantity = 1)
        {
            var item = items.FirstOrDefault(s => s._shopping_tour.id)
        }*/

        public void Add(Tour tour, int _quantity = 1)
        {
            var item = Items.FirstOrDefault(s => s._tour.ID_Tour == tour.ID_Tour);
            if (item == null)
            {
                items.Add(new CartItem
                {
                    _tour = tour,
                    _quantity = _quantity
                });
            }
            else
            {
                item._quantity += _quantity;
            }
        }

        public void Update_Quantity_Shopping(int id, int _quantity)
        {
            var item = items.Find(s => s._tour.ID_Tour == id);
            if (item != null)
            {
                item._quantity = _quantity;
            }
        }

        public double Total_Money()
        {
            var total = items.Sum(s => s._tour.Gia * s._quantity);
            return (double)total;
        }

        public void Remove_CartItem(int id)
        {
            items.RemoveAll(s => s._tour.ID_Tour == id);
        }

        public int Total_Quantity()
        {
            return items.Sum(s => s._quantity);
        }

        public void CleanCart()
        {
            items.Clear();
        }
    }
}