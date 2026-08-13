class CricketVenue {
  final String name;
  final String city;
  final String country;

  const CricketVenue({
    required this.name,
    required this.city,
    required this.country,
  });
}

class VenueCatalog {
  static const List<CricketVenue> venues = [
    CricketVenue(
      name: 'Wankhede Stadium',
      city: 'Mumbai',
      country: 'India',
    ),
    CricketVenue(
      name: 'M. Chinnaswamy Stadium',
      city: 'Bengaluru',
      country: 'India',
    ),
    CricketVenue(
      name: 'Eden Gardens',
      city: 'Kolkata',
      country: 'India',
    ),
    CricketVenue(
      name: 'Narendra Modi Stadium',
      city: 'Ahmedabad',
      country: 'India',
    ),
    CricketVenue(
      name: 'Sydney Cricket Ground',
      city: 'Sydney',
      country: 'Australia',
    ),
    CricketVenue(
      name: 'Melbourne Cricket Ground',
      city: 'Melbourne',
      country: 'Australia',
    ),
    CricketVenue(
      name: 'Lord\'s Cricket Ground',
      city: 'London',
      country: 'England',
    ),
    CricketVenue(
      name: 'Newlands Cricket Ground',
      city: 'Cape Town',
      country: 'South Africa',
    ),
  ];

  static CricketVenue get defaultVenue => venues.first;

  static CricketVenue? findByName(String name) {
    for (final venue in venues) {
      if (venue.name.toLowerCase() == name.toLowerCase()) {
        return venue;
      }
    }

    return null;
  }
}