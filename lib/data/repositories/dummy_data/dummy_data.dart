class DummyData {
  // Function to get a list of tasks with task name and progress in percent
  List<Map<String, dynamic>> getTasksList() {
    return [
      {'taskName': 'Tax File Number (TFN)', 'taskProgress': 0.8},
      {'taskName': 'Bank Setup', 'taskProgress': 0.7},
    ];
  }


  List<Map<String, String>> getLocalJobs() {
    return [
      {'jobRole': 'Bartender', 'jobLocation': 'Ashfield, NSW', 'companyName': 'Club Ashfield', 'datePosted': '2 days ago'},
      {'jobRole': 'Waiter', 'jobLocation': 'Sydney CBD, NSW', 'companyName': 'Sydney Restaurant', 'datePosted': '5 days ago'},
      {'jobRole': 'Construction Laborer', 'jobLocation': 'Penrith, NSW', 'companyName': 'BuildIt Co.', 'datePosted': '1 day ago'},
      {'jobRole': 'Warehouse Worker', 'jobLocation': 'Blacktown, NSW', 'companyName': 'Global Warehousing', 'datePosted': '4 days ago'},
      {'jobRole': 'Electrician', 'jobLocation': 'Liverpool, NSW', 'companyName': 'PowerLine Services', 'datePosted': '6 days ago'},
    ];
  }

  List<Map<String, String>> getLocalAccommodation() {
    return [
      {'roomName': 'Single bed room', 'roomLocation': 'Ashfield, NSW', 'rentPrice': '\$200 per week', 'datePosted': '2 days ago'},
      {'roomName': 'Studio apartment', 'roomLocation': 'Sydney CBD, NSW', 'rentPrice': '\$350 per week', 'datePosted': '5 days ago'},
      {'roomName': 'Shared room', 'roomLocation': 'Parramatta, NSW', 'rentPrice': '\$150 per week', 'datePosted': '1 day ago'},
      {'roomName': '1 bed apartment', 'roomLocation': 'Bondi, NSW', 'rentPrice': '\$450 per week', 'datePosted': '3 days ago'},
      {'roomName': 'Granny flat', 'roomLocation': 'Liverpool, NSW', 'rentPrice': '\$300 per week', 'datePosted': '4 days ago'},
    ];
  }

}