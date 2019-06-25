using EFDataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC.ViewModels
{
    public class HomeViewModel
    {
        public List<vw_ItemsBaseData> LatestVideos { get; set; }
        public List<vw_ItemsBaseData> LatestBooks { get; set; }
        public List<vw_ItemsBaseData> LatestSoundTracks { get; set; }
        public List<vw_ItemsBaseData> LatestAlbums { get; set; }
        public List<vw_ItemsBaseData> LatestKabsolat { get; set; }
        public List<vw_ItemsBaseData> LatestArticles { get; set; }
        public List<vw_ItemFiles>     LatestAlbumsFiles { get; set; }
        public List<vw_ItemsBaseData>     LatestOccasions { get; set; }
    }
}