using System;

namespace VirtualArtGallery.Exceptions
{
    internal class UserNotFoundException : ApplicationException
    {
        public UserNotFoundException() { }

        public UserNotFoundException(string msg) : base(msg) { }
    }
}
