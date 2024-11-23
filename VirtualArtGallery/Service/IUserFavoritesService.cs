namespace VirtualArtGallery.Service
{
    internal interface IUserFavoritesService
    {
        void AddFavoriteArtwork(int userID, int artworkID);
        void RemoveFavoriteArtwork(int userID, int artworkID);
        void GetUserFavoriteArtworks(int userID);
    }
}
