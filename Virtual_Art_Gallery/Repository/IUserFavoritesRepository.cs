using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Virtual_Art_Gallery.Model;

namespace Virtual_Art_Gallery.Repository
{
    internal interface IUserFavoritesRepository
    {
        bool AddFavoriteArtwork(int userID, int artworkID);
        bool RemoveFavoriteArtwork(int userID, int artworkID);
        List<Artwork> GetUserFavoriteArtworks(int userID);
    }
}
