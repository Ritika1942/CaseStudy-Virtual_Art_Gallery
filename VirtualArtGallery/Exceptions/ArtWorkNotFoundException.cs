using System;

namespace VirtualArtGallery.Exceptions
{
    internal class ArtWorkNotFoundException : ApplicationException
    {
        public ArtWorkNotFoundException() { }

        public ArtWorkNotFoundException(string msg) : base(msg) { }
    }
}
