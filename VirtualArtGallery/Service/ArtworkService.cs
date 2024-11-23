using VirtualArtGallery.Model;
using VirtualArtGallery.Repository;
using VirtualArtGallery.Exceptions; 
using System;
using System.Collections.Generic;

namespace VirtualArtGallery.Service
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
            bool isAdded = _artworkRepository.AddArtwork(artwork);
            return isAdded;
        }

        public bool UpdateArtwork(Artwork artwork)
        {
            
            Artwork existingArtwork = _artworkRepository.GetArtworkById(artwork.ArtworkID);
            if (existingArtwork == null)
            {
                throw new ArtWorkNotFoundException($"Cannot update. Artwork with ID {artwork.ArtworkID} not found.");
            }

            bool isUpdated = _artworkRepository.UpdateArtwork(artwork);
            return isUpdated;
        }

        public bool RemoveArtwork(int artworkID)
        {
            Artwork artwork = _artworkRepository.GetArtworkById(artworkID);
            if (artwork == null)
            {
                throw new ArtWorkNotFoundException($"Cannot remove. Artwork with ID {artworkID} not found.");
            }

            bool isRemoved = _artworkRepository.RemoveArtwork(artworkID);
            return isRemoved;
        }

        public Artwork GetArtworkById(int artworkID)
        {
            Artwork artwork = _artworkRepository.GetArtworkById(artworkID);
            if (artwork == null)
            {
                throw new ArtWorkNotFoundException($"Artwork with ID {artworkID} not found.");
            }
            return artwork;
        }

        public List<Artwork> SearchArtworks(string keyword)
        {
            List<Artwork> artworks = _artworkRepository.SearchArtworks(keyword);
            if (artworks == null || artworks.Count == 0)
            {
                throw new ArtWorkNotFoundException($"No artworks found matching keyword '{keyword}'.");
            }
            return artworks;
        }
    }
}
