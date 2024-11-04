class House {
  String id;
  int price;
  String location;
  String description;
  int landSize;
  int bedroom;
  int bathroom;
  List<String> imageUrls;

  House({
    required this.id,
    required this.price,
    required this.location,
    required this.description,
    required this.landSize,
    required this.bedroom,
    required this.bathroom,
    required this.imageUrls,
  });
}

var housesList = [
  House(
    id: "1",
    price: 400000,
    location: 'Diponegoro Street, Tegalsari, Surabaya, East Java',
    description:
        'Welcome to this stunning modern home, featuring an impressive 4-bedroom layout situated in a serene and family-friendly neighborhood. The expansive 250 sqm living area is designed with an open-concept layout that seamlessly connects the living room and fully-equipped kitchen, complete with exquisite granite countertops. Each spacious bedroom is adorned with abundant natural light, while the luxurious master suite boasts its own private bathroom and a generous walk-in closet. Step outside to discover a beautifully landscaped garden and a large patio that’s perfect for hosting gatherings with family and friends. This remarkable home includes a two-car garage and is conveniently located within close proximity to reputable schools, vibrant shopping centers, and accessible public transportation options. A perfect sanctuary for families seeking a harmonious blend of comfort and convenience.',
    landSize: 2691,
    bedroom: 4,
    bathroom: 5,
    imageUrls: [
      'https://images.pexels.com/photos/8143677/pexels-photo-8143677.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8143675/pexels-photo-8143675.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8143671/pexels-photo-8143671.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8143669/pexels-photo-8143669.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    ],
  ),
  House(
    id: "2",
    price: 732000,
    location: 'Diponegoro Street, Tegalsari, Surabaya, East Java',
    description:
        'Introducing an exquisite modern 5-bedroom residence nestled in a peaceful and family-oriented neighborhood. This remarkable property spans 250 sqm and features a spacious open-concept design that effortlessly combines the living room and a gourmet kitchen equipped with high-end appliances and elegant granite countertops. Each bedroom is generously sized and bathed in natural light, while the luxurious master suite offers a private bathroom and an expansive walk-in closet. Outside, you will find a beautifully manicured garden along with a large patio that’s ideal for outdoor entertaining. This stunning home also comes with a convenient two-car garage and is situated near reputable schools, shopping destinations, and public transport. A perfect haven for families seeking elegance and practicality.',
    landSize: 2691,
    bedroom: 5,
    bathroom: 7,
    imageUrls: [
      'https://images.pexels.com/photos/8134816/pexels-photo-8134816.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8134814/pexels-photo-8134814.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8134817/pexels-photo-8134817.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8134821/pexels-photo-8134821.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8134847/pexels-photo-8134847.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8134849/pexels-photo-8134849.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    ],
  ),
  House(
    id: "3",
    price: 400000,
    location: 'Diponegoro Street, Tegalsari, Surabaya, East Java',
    description:
        'Step into this charming modern home, featuring a delightful 4-bedroom layout nestled in a tranquil and family-friendly area. The 250 sqm living space is beautifully designed with an open-concept layout, where the cozy living room merges with a fully-equipped kitchen, highlighted by elegant granite countertops. Each bedroom is spacious and filled with natural light, while the master suite includes a luxurious private bathroom and a spacious walk-in closet. Enjoy the serene outdoors with a beautifully landscaped garden and a large patio that’s perfect for gatherings. This splendid home also features a two-car garage and is ideally located near schools, shopping centers, and public transportation. A wonderful retreat for families looking for comfort and ease of living.',
    landSize: 2691,
    bedroom: 3,
    bathroom: 2,
    imageUrls: [
      'https://images.pexels.com/photos/8092387/pexels-photo-8092387.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8092389/pexels-photo-8092389.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8092383/pexels-photo-8092383.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8092380/pexels-photo-8092380.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
      'https://images.pexels.com/photos/8092378/pexels-photo-8092378.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    ],
  ),
];
