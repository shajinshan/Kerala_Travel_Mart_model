import 'package:flutter/cupertino.dart';

import 'venue.dart';

class VenueDataModel extends ChangeNotifier {
  List<Venue> venues = [
    Venue(
      id: "01",
      name: "Samudrika and Sagara Convention Centre, Willingdon Island, Kochi",
      description:
          "Located on the picturesque backwaters at the North End of Willingdon Island, our venue offers a perfect blend of scenic beauty and modern amenities, ensuring a memorable experience for you and your guests.",
      dateTime:[DateTime(2025, 12, 1),],
      category: "mart",
      image:
          "https://www.ktdc.com/photo-gallery/large/kochi_international_marina/gallery-2.jpg",
          locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "02",
      name: "Kochi Marina, Kochi",
      description:
          "A modern waterfront convention center offering breathtaking views of the Arabian Sea. Perfect for grand events and celebrations.",
      dateTime:[DateTime(2025, 12, 1),DateTime(2025, 3, 3)],
      category: "luxury",
      image:
          "https://www.ktdc.com/photo-gallery/large/kochi_international_marina/gallery-2.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "03",
      name: "Le Meridien Convention Center, Kochi",
      description:
          "Le Meridien in Kochi offers an exceptional venue for conferences, exhibitions, and social events, with state-of-the-art facilities and a stunning waterfront view.",
      dateTime:[DateTime(2025, 12, 1),],
      category: "luxury",
      image:
          "https://media-cdn.tripadvisor.com/media/photo-s/0e/eb/99/26/le-meridien-kochi.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "04",
      name: "Bolgatty Palace and Island Resort, Kochi",
      description:
          "Set in a beautiful island resort, this venue combines historical charm with modern amenities. A perfect place for weddings and conferences.",
      dateTime: [DateTime(2025, 12, 1),],
      category: "heritage",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/7/75/Bolgatty_Palace.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "05",
      name: "Nandavanam Convention Center, Trivandrum",
      description:
          "Located in the heart of the city, Nandavanam Convention Center is known for its excellent facilities and versatility in hosting corporate events and social gatherings.",
      dateTime: [DateTime(2025, 12, 1),],
      category: "corporate",
      image:
          "https://www.keralatourism.org/images/kerala-destination/nandavanam-park.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "06",
      name: "The Raviz Resort and Convention Center, Kollam",
      description:
          "A luxury convention center located on the banks of Ashtamudi Lake, offering world-class facilities for conferences and grand social events.",
      dateTime: [DateTime(2025, 12, 1),],
      category: "luxury",
      image: "https://www.theraviz.com/uploads/2021/11/ra-1024x683.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "07",
      name: "Sree Sankaracharya University Auditorium, Kalady",
      description:
          "An ideal venue for academic and cultural events, the auditorium offers modern amenities and is located in the picturesque surroundings of Kalady.",
      dateTime:[DateTime(2025, 12, 1),],
      category: "academic",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/SSU_Kalady.JPG/800px-SSU_Kalady.JPG",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "08",
      name: "Vypin Island Convention Hall, Kochi",
      description:
          "A spacious and modern convention center located on Vypin Island, offering a unique blend of urban convenience and serene surroundings.",
      dateTime:[DateTime(2025, 12, 1),],
      category: "mart",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/0/06/Indian_Ocean_Coast_Kochi.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "09",
      name: "Athirappilly Convention Centre, Thrissur",
      description:
          "Known as the 'Niagara of India,' Athirappilly offers a stunning backdrop for events and weddings with its scenic waterfall views.",
      dateTime: [DateTime(2025, 12, 1),],
      category: "nature",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/2/2f/Athirappilly_Falls.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
    Venue(
      id: "10",
      name: "Kumarakom Lake Resort, Kottayam",
      description:
          "Set on the serene shores of Vembanad Lake, this resort and convention center offers a tranquil venue for corporate and personal events.",
      dateTime: [DateTime(2025, 12, 1),],
      category: "resort",
      image:
          "https://upload.wikimedia.org/wikipedia/commons/4/43/Kumarakom_Lake_Resort.jpg",locationUrl: "https://maps.app.goo.gl/8zTdgSUuxaU2Y2oU6"
    ),
  ];
}
