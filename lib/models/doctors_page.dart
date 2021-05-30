class DoctorsDetails {
  final String name;
  final String role;
  final String iconPath;
  final String experience;
  final int rating;
  final String location;
  final String timing;
  final int patientsCount;
  final bool isVerified;

  DoctorsDetails({
    this.name,
    this.role,
    this.iconPath,
    this.experience,
    this.rating,
    this.location,
    this.timing,
    this.patientsCount,
    this.isVerified,
  });
}

List<DoctorsDetails> doctorsList = [
  DoctorsDetails(
      name: "Dr. Vivek Kumar",
      role: "Psychiatrist",
      iconPath: "assets/doctor_icon.png",
      experience: "10 years experience",
      rating: 90,
      location: "Bihar",
      timing: "9am to 8pm",
      patientsCount: 151,
      isVerified: true),
  DoctorsDetails(
      name: "Dr. Shubh Bansal",
      role: "Psychiatrist",
      iconPath: "assets/doctor1.png",
      experience: "12 years experience",
      rating: 87,
      location: "Bihar",
      timing: "9am to 8pm",
      patientsCount: 200,
      isVerified: false),
  DoctorsDetails(
      name: "Dr. Sunidhi",
      role: "Psychiatrist",
      iconPath: "assets/doctor2.png",
      experience: "7 years experience",
      rating: 85,
      location: "Delhi",
      timing: "9am to 8pm",
      patientsCount: 101,
      isVerified: true),
  DoctorsDetails(
      name: "Dr. Aatifa",
      role: "Psychiatrist",
      iconPath: "assets/doctor3.png",
      experience: "9 years experience",
      rating: 89,
      location: "Delhi",
      timing: "9am to 8pm",
      patientsCount: 151,
      isVerified: false)
];
