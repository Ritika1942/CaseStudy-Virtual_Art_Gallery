using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Virtual_Art_Gallery.Model;

namespace Virtual_Art_Gallery.Repository
{
    internal interface IArtworkRepository
    {
        bool AddArtwork(Artwork artwork);
        bool UpdateArtwork(Artwork artwork);
        bool RemoveArtwork(int artworkID);
        Artwork GetArtworkById(int artworkID);
        List<Artwork> SearchArtworks(string keyword);
    }
}

