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
    internal class UserFavoritesService : IUserFavoritesService
    {
        private readonly IUserFavoritesRepository _userFavoritesRepository;

        public UserFavoritesService(IUserFavoritesRepository userFavoritesRepository)
        {
            _userFavoritesRepository = userFavoritesRepository;
        }

        public bool AddFavoriteArtwork(int userID, int artworkID)
        {
            return _userFavoritesRepository.AddFavoriteArtwork(userID, artworkID);
        }

        public bool RemoveFavoriteArtwork(int userID, int artworkID)
        {
            return _userFavoritesRepository.RemoveFavoriteArtwork(userID, artworkID);
        }

        public List<Artwork> GetUserFavoriteArtworks(int userID)
        {
            return _userFavoritesRepository.GetUserFavoriteArtworks(userID);
        }

    }
}