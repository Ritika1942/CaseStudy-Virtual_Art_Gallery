using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Virtual_Art_Gallery.Repository
{
    internal interface IArtworkGalleryRepository
    {
        bool AddArtworkToGallery(int artworkID, int galleryID);
        bool RemoveArtworkFromGallery(int artworkID, int galleryID);
        void GetArtworksByGalleryID(int galleryID);
        void GetGalleriesByArtworkID(int artworkID);
    }
}