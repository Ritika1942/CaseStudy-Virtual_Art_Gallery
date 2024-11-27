using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Virtual_Art_Gallery.Exceptions
{
    public class ArtWorkNotFoundException : Exception
    {
        public ArtWorkNotFoundException(string message) : base(message)
        {
        }
    }
    public class UserNotFoundException : Exception
    {
        public UserNotFoundException(string message) : base(message)
        {
        }
    }
}
