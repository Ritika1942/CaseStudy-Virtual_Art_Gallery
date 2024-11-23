using VirtualArtGallery.Repository;
using System;
using System.Collections.Generic;

namespace VirtualArtGallery.Service
{
    internal class UserFavoritesService : IUserFavoritesService
    {
        private readonly IUserFavoritesRepository _userFavoritesRepository;

        public UserFavoritesService(IUserFavoritesRepository userFavoritesRepository)
        {
            _userFavoritesRepository = userFavoritesRepository;
        }

        public void AddFavoriteArtwork(int userID, int artworkID)
        {
            bool isAdded = _userFavoritesRepository.AddFavoriteArtwork(userID, artworkID);
            if (isAdded)
            {
                Console.WriteLine($"Artwork ID {artworkID} added to User {userID}'s favorites.");
            }
            else
            {
                Console.WriteLine("Error adding favorite artwork.");
            }
        }

        public void RemoveFavoriteArtwork(int userID, int artworkID)
        {
            bool isRemoved = _userFavoritesRepository.RemoveFavoriteArtwork(userID, artworkID);
            if (isRemoved)
            {
                Console.WriteLine($"Artwork ID {artworkID} removed from User {userID}'s favorites.");
            }
            else
            {
                Console.WriteLine("Error removing favorite artwork.");
            }
        }

        public void GetUserFavoriteArtworks(int userID)
        {
            List<int> favoriteArtworks = _userFavoritesRepository.GetUserFavoriteArtworks(userID);
            if (favoriteArtworks.Count == 0)
            {
                Console.WriteLine($"No favorite artworks found for User {userID}.");
            }
            else
            {
                Console.WriteLine($"User {userID}'s Favorite Artworks:");
                foreach (var artworkID in favoriteArtworks)
                {
                    Console.WriteLine($"Artwork ID: {artworkID}");
                }
            }
        }
    }
}
