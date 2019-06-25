using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.Services
{
    public class GirasServise
    {

        public static string GetBaseCategoryIcon(int categoryId)
        {
            switch (categoryId)
            {
                case 1014:
                    return "fa fa-female";
                case 1015:
                    return "fa fa-bed";
                case 1016:
                    return "icon-accessibility";
                case 1017:
                    return "fa fa-book";
                case 1018:
                    return "icon-key";
                case 1019:
                    return "icon-users";
                case 1020:
                    return "fa fa-venus";
                default:
                    return "";
            }

        }
    }
}