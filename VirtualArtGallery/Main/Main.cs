using System;
using System.Collections.Generic;
using VirtualArtGallery.Model;
using VirtualArtGallery.Repository;
using VirtualArtGallery.Service;

class Program
{
    static void Main()
    {
        IArtworkRepository artworkRepository = new ArtworkRepository();
        IArtworkService artworkService = new ArtworkService(artworkRepository);

        bool continueRunning = true;

        while (continueRunning)
        {
            Console.WriteLine("Virtual Art Gallery");
            Console.WriteLine("1. Add New Artwork");
            Console.WriteLine("2. Update Artwork");
            Console.WriteLine("3. Remove Artwork");
            Console.WriteLine("4. View Artwork By ID");
            Console.WriteLine("5. Search Artworks");
            Console.WriteLine("6. Exit");
            Console.Write("Choose an option: ");

            string choice = Console.ReadLine();
            switch (choice)
            {
                case "1":
                    Console.WriteLine("Enter Artwork Details:");
                    Artwork newArtwork = new Artwork();

                    Console.Write("Title: ");
                    newArtwork.Title = Console.ReadLine();

                    Console.Write("Description: ");
                    newArtwork.Description = Console.ReadLine();

                    Console.Write("Creation Date (YYYY-MM-DD): ");
                    newArtwork.CreationDate = DateTime.Parse(Console.ReadLine());

                    Console.Write("Medium: ");
                    newArtwork.Medium = Console.ReadLine();

                    Console.Write("Image URL: ");
                    newArtwork.ImageURL = Console.ReadLine();

                    Console.Write("Artist ID: ");
                    newArtwork.ArtistID = int.Parse(Console.ReadLine());
                    if (artworkService.AddArtwork(newArtwork))
                    {
                        Console.WriteLine("Artwork added successfully.");
                    }
                    else
                    {
                        Console.WriteLine("Failed to add artwork.");
                    }
                    break;

                case "2":
                    Console.Write("Enter Artwork ID to update: ");
                    int updateArtworkID = int.Parse(Console.ReadLine());

                    Artwork existingArtwork = artworkService.GetArtworkById(updateArtworkID);
                    if (existingArtwork != null)
                    {
                        
                        Console.Write("New Title (leave blank to keep current): ");
                        string newTitle = Console.ReadLine();
                        if (!string.IsNullOrWhiteSpace(newTitle)) existingArtwork.Title = newTitle;

                        Console.Write("New Description (leave blank to keep current): ");
                        string newDescription = Console.ReadLine();
                        if (!string.IsNullOrWhiteSpace(newDescription)) existingArtwork.Description = newDescription;

                        Console.Write("New Medium (leave blank to keep current): ");
                        string newMedium = Console.ReadLine();
                        if (!string.IsNullOrWhiteSpace(newMedium)) existingArtwork.Medium = newMedium;

                        if (artworkService.UpdateArtwork(existingArtwork))
                        {
                            Console.WriteLine("Artwork updated successfully.");
                        }
                        else
                        {
                            Console.WriteLine("Failed to update artwork.");
                        }
                    }
                    else
                    {
                        Console.WriteLine("Artwork not found.");
                    }
                    break;

                case "3":
                    Console.Write("Enter Artwork ID to remove: ");
                    int removeArtworkID = int.Parse(Console.ReadLine());

                    if (artworkService.RemoveArtwork(removeArtworkID))
                    {
                        Console.WriteLine("Artwork removed successfully.");
                    }
                    else
                    {
                        Console.WriteLine("Failed to remove artwork or Artwork not found.");
                    }
                    break;

                case "4":
                    
                    Console.Write("Enter Artwork ID: ");
                    int viewArtworkID = int.Parse(Console.ReadLine());

                    Artwork artwork = artworkService.GetArtworkById(viewArtworkID);
                    if (artwork != null)
                    {
                        Console.WriteLine($"Title: {artwork.Title}");
                        Console.WriteLine($"Description: {artwork.Description}");
                        Console.WriteLine($"Medium: {artwork.Medium}");
                        Console.WriteLine($"Creation Date: {artwork.CreationDate}");
                        Console.WriteLine($"Artist ID: {artwork.ArtistID}");
                    }
                    else
                    {
                        Console.WriteLine("Artwork not found.");
                    }
                    break;

                case "5":
                    Console.Write("Enter keyword to search: ");
                    string keyword = Console.ReadLine();

                    var artworks = artworkService.SearchArtworks(keyword);
                    if (artworks.Count > 0)
                    {
                        Console.WriteLine("Search Results:");
                        foreach (var art in artworks)
                        {
                            Console.WriteLine($"ID: {art.ArtworkID}, Title: {art.Title}");
                        }
                    }
                    else
                    {
                        Console.WriteLine("No artworks found.");
                    }
                    break;

                case "6":
                    continueRunning = false;
                    Console.WriteLine("Exiting the system.");
                    break;

                default:
                    Console.WriteLine("Invalid choice.");
                    break;
            }

            Console.WriteLine();
        }
    }
}
