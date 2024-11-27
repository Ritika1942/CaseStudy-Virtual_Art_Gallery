using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Virtual_Art_Gallery.Model
{
    internal class Artworkgallery
    {
            private int _artworkID;
            private int _galleryID;
            private DateTime _displayStartDate;
            private DateTime _displayEndDate;
            private string _position;

            public int ArtworkID
            {
                get { return _artworkID; }
                set { _artworkID = value; }
            }

            public int GalleryID
            {
                get { return _galleryID; }
                set { _galleryID = value; }
            }

            public DateTime DisplayStartDate
            {
                get { return _displayStartDate; }
                set { _displayStartDate = value; }
            }

            public DateTime DisplayEndDate
            {
                get { return _displayEndDate; }
                set { _displayEndDate = value; }
            }

            public string Position
            {
                get { return _position; }
                set { _position = value; }
            }

            public override string ToString()
            {
                return $"Artwork ID: {ArtworkID}\t" +
                       $"Gallery ID: {GalleryID}\t" +
                       $"Display Start Date: {DisplayStartDate}\t" +
                       $"Display End Date: {DisplayEndDate}\t" +
                       $"Position of Artwork: {Position}\n";

            }
        }
    }