using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Virtual_Art_Gallery.Repository;
using Virtual_Art_Gallery.Service;

namespace Virtual_Art_Gallery.Service
{
    internal class ArtworkGalleryService : IArtworkGalleryService
    {
        private readonly IArtworkGalleryRepository _artworkGalleryRepository;

        public ArtworkGalleryService(IArtworkGalleryRepository artworkGalleryRepository)
        {
            _artworkGalleryRepository = artworkGalleryRepository;
        }

        public bool AddArtworkToGallery(int artworkID, int galleryID)
        {
            return _artworkGalleryRepository.AddArtworkToGallery(artworkID, galleryID);
        }

        public bool RemoveArtworkFromGallery(int artworkID, int galleryID)
        {
            return _artworkGalleryRepository.RemoveArtworkFromGallery(artworkID, galleryID);
        }

        public void GetArtworksByGalleryID(int galleryID)
        {
            _artworkGalleryRepository.GetArtworksByGalleryID(galleryID);
        }

        public void GetGalleriesByArtworkID(int artworkID)
        {
            _artworkGalleryRepository.GetGalleriesByArtworkID(artworkID);
        }


    }
}