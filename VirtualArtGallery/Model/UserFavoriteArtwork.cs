namespace VirtualArtGallery.Model
{
    internal class UserFavoriteArtwork
    {
        private int _userID;
        private int _artworkID;

        public int UserID
        {
            get { return _userID; }
            set { _userID = value; }
        }

        public int ArtworkID
        {
            get { return _artworkID; }
            set { _artworkID = value; }
        }

        public UserFavoriteArtwork(int userID, int artworkID)
        {
            _userID = userID;
            _artworkID = artworkID;
        }
        public override string ToString()
        {
            return $"User ID: {UserID}\t" +
                   $"Artwork ID: {ArtworkID}";
        }
    }
}
