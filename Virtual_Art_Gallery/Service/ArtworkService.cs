using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Virtual_Art_Gallery.Model;
using Virtual_Art_Gallery.Repository;
using Virtual_Art_Gallery.Service;

namespace Virtual_Art_Gallery.Service
{
    internal class ArtworkService : IArtworkService
    {
        private readonly IArtworkRepository _artworkRepository;

        public ArtworkService(IArtworkRepository artworkRepository)
        {
            _artworkRepository = artworkRepository;
        }

        public bool AddArtwork(Artwork artwork)
        {
            return _artworkRepository.AddArtwork(artwork);
        }

        public bool UpdateArtwork(Artwork artwork)
        {
            return _artworkRepository.UpdateArtwork(artwork);
        }

        public bool RemoveArtwork(int artworkID)
        {
            return _artworkRepository.RemoveArtwork(artworkID);
        }

        public Artwork GetArtworkById(int artworkID)
        {
            return _artworkRepository.GetArtworkById(artworkID);
        }

        public List<Artwork> SearchArtworks(string keyword)
        {
            return _artworkRepository.SearchArtworks(keyword);
        }
    }
}