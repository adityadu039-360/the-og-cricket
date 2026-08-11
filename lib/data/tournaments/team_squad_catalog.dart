import '../../models/cricket_player.dart';

class TeamSquadCatalog {
  static final Map<String, List<CricketPlayer>> squads = {
    // =========================
    // INDIA
    // =========================
    'India': [
      CricketPlayer(name: 'Rohit Sharma', role: 'Batter'),
      CricketPlayer(name: 'Shubman Gill', role: 'Batter'),
      CricketPlayer(name: 'Virat Kohli', role: 'Batter'),
      CricketPlayer(name: 'Suryakumar Yadav', role: 'Batter'),
      CricketPlayer(name: 'Yashasvi Jaiswal', role: 'Batter'),
      CricketPlayer(name: 'Rishabh Pant', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Sanju Samson', role: 'Wicket Keeper'),
      CricketPlayer(name: 'KL Rahul', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Hardik Pandya', role: 'All Rounder'),
      CricketPlayer(name: 'Ravindra Jadeja', role: 'All Rounder'),
      CricketPlayer(name: 'Axar Patel', role: 'All Rounder'),
      CricketPlayer(name: 'Shivam Dube', role: 'All Rounder'),
      CricketPlayer(name: 'Washington Sundar', role: 'All Rounder'),
      CricketPlayer(name: 'Kuldeep Yadav', role: 'Bowler'),
      CricketPlayer(name: 'Jasprit Bumrah', role: 'Bowler'),
      CricketPlayer(name: 'Mohammed Siraj', role: 'Bowler'),
      CricketPlayer(name: 'Arshdeep Singh', role: 'Bowler'),
      CricketPlayer(name: 'Mohammed Shami', role: 'Bowler'),
    ],

    // =========================
    // AUSTRALIA
    // =========================
    'Australia': [
      CricketPlayer(name: 'Travis Head', role: 'Batter'),
      CricketPlayer(name: 'David Warner', role: 'Batter'),
      CricketPlayer(name: 'Steve Smith', role: 'Batter'),
      CricketPlayer(name: 'Marnus Labuschagne', role: 'Batter'),
      CricketPlayer(name: 'Glenn Maxwell', role: 'All Rounder'),
      CricketPlayer(name: 'Mitchell Marsh', role: 'All Rounder'),
      CricketPlayer(name: 'Cameron Green', role: 'All Rounder'),
      CricketPlayer(name: 'Josh Inglis', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Alex Carey', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Pat Cummins', role: 'Bowler'),
      CricketPlayer(name: 'Mitchell Starc', role: 'Bowler'),
      CricketPlayer(name: 'Josh Hazlewood', role: 'Bowler'),
      CricketPlayer(name: 'Adam Zampa', role: 'Bowler'),
      CricketPlayer(name: 'Nathan Ellis', role: 'Bowler'),
      CricketPlayer(name: 'Sean Abbott', role: 'All Rounder'),
    ],

    // =========================
    // ENGLAND
    // =========================
    'England': [
      CricketPlayer(name: 'Jos Buttler', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Phil Salt', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Harry Brook', role: 'Batter'),
      CricketPlayer(name: 'Joe Root', role: 'Batter'),
      CricketPlayer(name: 'Ben Duckett', role: 'Batter'),
      CricketPlayer(name: 'Liam Livingstone', role: 'All Rounder'),
      CricketPlayer(name: 'Moeen Ali', role: 'All Rounder'),
      CricketPlayer(name: 'Sam Curran', role: 'All Rounder'),
      CricketPlayer(name: 'Jofra Archer', role: 'Bowler'),
      CricketPlayer(name: 'Mark Wood', role: 'Bowler'),
      CricketPlayer(name: 'Adil Rashid', role: 'Bowler'),
      CricketPlayer(name: 'Reece Topley', role: 'Bowler'),
      CricketPlayer(name: 'Chris Jordan', role: 'All Rounder'),
      CricketPlayer(name: 'Gus Atkinson', role: 'Bowler'),
    ],

    // =========================
    // SOUTH AFRICA
    // =========================
    'South Africa': [
      CricketPlayer(name: 'Quinton de Kock', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Aiden Markram', role: 'All Rounder'),
      CricketPlayer(name: 'Temba Bavuma', role: 'Batter'),
      CricketPlayer(name: 'David Miller', role: 'Batter'),
      CricketPlayer(name: 'Heinrich Klaasen', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Rassie van der Dussen', role: 'Batter'),
      CricketPlayer(name: 'Marco Jansen', role: 'All Rounder'),
      CricketPlayer(name: 'Keshav Maharaj', role: 'Bowler'),
      CricketPlayer(name: 'Kagiso Rabada', role: 'Bowler'),
      CricketPlayer(name: 'Anrich Nortje', role: 'Bowler'),
      CricketPlayer(name: 'Lungi Ngidi', role: 'Bowler'),
      CricketPlayer(name: 'Gerald Coetzee', role: 'Bowler'),
      CricketPlayer(name: 'Tabraiz Shamsi', role: 'Bowler'),
    ],

    // =========================
    // NEW ZEALAND
    // =========================
    'New Zealand': [
      CricketPlayer(name: 'Kane Williamson', role: 'Batter'),
      CricketPlayer(name: 'Devon Conway', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Finn Allen', role: 'Batter'),
      CricketPlayer(name: 'Rachin Ravindra', role: 'All Rounder'),
      CricketPlayer(name: 'Daryl Mitchell', role: 'All Rounder'),
      CricketPlayer(name: 'Glenn Phillips', role: 'All Rounder'),
      CricketPlayer(name: 'Tom Latham', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Mitchell Santner', role: 'All Rounder'),
      CricketPlayer(name: 'Matt Henry', role: 'Bowler'),
      CricketPlayer(name: 'Trent Boult', role: 'Bowler'),
      CricketPlayer(name: 'Lockie Ferguson', role: 'Bowler'),
      CricketPlayer(name: 'Tim Southee', role: 'Bowler'),
      CricketPlayer(name: 'Ish Sodhi', role: 'Bowler'),
    ],

    // =========================
    // PAKISTAN
    // =========================
    'Pakistan': [
      CricketPlayer(name: 'Babar Azam', role: 'Batter'),
      CricketPlayer(name: 'Mohammad Rizwan', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Fakhar Zaman', role: 'Batter'),
      CricketPlayer(name: 'Saim Ayub', role: 'Batter'),
      CricketPlayer(name: 'Mohammad Nawaz', role: 'All Rounder'),
      CricketPlayer(name: 'Shadab Khan', role: 'All Rounder'),
      CricketPlayer(name: 'Iftikhar Ahmed', role: 'All Rounder'),
      CricketPlayer(name: 'Shaheen Afridi', role: 'Bowler'),
      CricketPlayer(name: 'Haris Rauf', role: 'Bowler'),
      CricketPlayer(name: 'Naseem Shah', role: 'Bowler'),
      CricketPlayer(name: 'Mohammad Amir', role: 'Bowler'),
      CricketPlayer(name: 'Abrar Ahmed', role: 'Bowler'),
      CricketPlayer(name: 'Hasan Ali', role: 'Bowler'),
    ],

    // =========================
    // SRI LANKA
    // =========================
    'Sri Lanka': [
      CricketPlayer(name: 'Pathum Nissanka', role: 'Batter'),
      CricketPlayer(name: 'Kusal Mendis', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Charith Asalanka', role: 'Batter'),
      CricketPlayer(name: 'Kusal Perera', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Kamindu Mendis', role: 'All Rounder'),
      CricketPlayer(name: 'Wanindu Hasaranga', role: 'All Rounder'),
      CricketPlayer(name: 'Dhananjaya de Silva', role: 'All Rounder'),
      CricketPlayer(name: 'Maheesh Theekshana', role: 'Bowler'),
      CricketPlayer(name: 'Matheesha Pathirana', role: 'Bowler'),
      CricketPlayer(name: 'Dilshan Madushanka', role: 'Bowler'),
      CricketPlayer(name: 'Dushmantha Chameera', role: 'Bowler'),
      CricketPlayer(name: 'Jeffrey Vandersay', role: 'Bowler'),
    ],

    // =========================
    // BANGLADESH
    // =========================
    'Bangladesh': [
      CricketPlayer(name: 'Litton Das', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Najmul Hossain Shanto', role: 'Batter'),
      CricketPlayer(name: 'Tanzid Hasan', role: 'Batter'),
      CricketPlayer(name: 'Towhid Hridoy', role: 'Batter'),
      CricketPlayer(name: 'Shakib Al Hasan', role: 'All Rounder'),
      CricketPlayer(name: 'Mehidy Hasan Miraz', role: 'All Rounder'),
      CricketPlayer(name: 'Mahmudullah', role: 'All Rounder'),
      CricketPlayer(name: 'Mustafizur Rahman', role: 'Bowler'),
      CricketPlayer(name: 'Taskin Ahmed', role: 'Bowler'),
      CricketPlayer(name: 'Tanzim Hasan Sakib', role: 'Bowler'),
      CricketPlayer(name: 'Nasum Ahmed', role: 'Bowler'),
    ],

    // =========================
    // INDIAN OG LEAGUE
    // =========================
    'Chennai Thunderhawks': [
      CricketPlayer(name: 'Ruturaj Gaikwad', role: 'Batter'),
      CricketPlayer(name: 'Devon Conway', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Rahul Tripathi', role: 'Batter'),
      CricketPlayer(name: 'Shivam Dube', role: 'All Rounder'),
      CricketPlayer(name: 'Ravindra Jadeja', role: 'All Rounder'),
      CricketPlayer(name: 'Moeen Ali', role: 'All Rounder'),
      CricketPlayer(name: 'MS Dhoni', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Deepak Chahar', role: 'Bowler'),
      CricketPlayer(name: 'Matheesha Pathirana', role: 'Bowler'),
      CricketPlayer(name: 'Maheesh Theekshana', role: 'Bowler'),
      CricketPlayer(name: 'Tushar Deshpande', role: 'Bowler'),
      CricketPlayer(name: 'Mukesh Choudhary', role: 'Bowler'),
      CricketPlayer(name: 'Sameer Rizvi', role: 'Batter'),
      CricketPlayer(name: 'Dwayne Bravo', role: 'All Rounder'),
    ],

    'Mumbai Stormriders': [
      CricketPlayer(name: 'Rohit Sharma', role: 'Batter'),
      CricketPlayer(name: 'Suryakumar Yadav', role: 'Batter'),
      CricketPlayer(name: 'Ishan Kishan', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Tilak Varma', role: 'Batter'),
      CricketPlayer(name: 'Hardik Pandya', role: 'All Rounder'),
      CricketPlayer(name: 'Tim David', role: 'Batter'),
      CricketPlayer(name: 'Naman Dhir', role: 'All Rounder'),
      CricketPlayer(name: 'Jasprit Bumrah', role: 'Bowler'),
      CricketPlayer(name: 'Trent Boult', role: 'Bowler'),
      CricketPlayer(name: 'Gerald Coetzee', role: 'Bowler'),
      CricketPlayer(name: 'Piyush Chawla', role: 'Bowler'),
      CricketPlayer(name: 'Akash Madhwal', role: 'Bowler'),
      CricketPlayer(name: 'Dewald Brevis', role: 'Batter'),
    ],

    'Bengaluru Blazeforce': [
      CricketPlayer(name: 'Virat Kohli', role: 'Batter'),
      CricketPlayer(name: 'Faf du Plessis', role: 'Batter'),
      CricketPlayer(name: 'Rajat Patidar', role: 'Batter'),
      CricketPlayer(name: 'Phil Salt', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Glenn Maxwell', role: 'All Rounder'),
      CricketPlayer(name: 'Cameron Green', role: 'All Rounder'),
      CricketPlayer(name: 'Liam Livingstone', role: 'All Rounder'),
      CricketPlayer(name: 'Krunal Pandya', role: 'All Rounder'),
      CricketPlayer(name: 'Bhuvneshwar Kumar', role: 'Bowler'),
      CricketPlayer(name: 'Mohammed Siraj', role: 'Bowler'),
      CricketPlayer(name: 'Yash Dayal', role: 'Bowler'),
      CricketPlayer(name: 'Josh Hazlewood', role: 'Bowler'),
      CricketPlayer(name: 'Mayank Dagar', role: 'Bowler'),
    ],

    'Kolkata Nightblazers': [
      CricketPlayer(name: 'Shreyas Iyer', role: 'Batter'),
      CricketPlayer(name: 'Venkatesh Iyer', role: 'All Rounder'),
      CricketPlayer(name: 'Rinku Singh', role: 'Batter'),
      CricketPlayer(name: 'Phil Salt', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Andre Russell', role: 'All Rounder'),
      CricketPlayer(name: 'Sunil Narine', role: 'All Rounder'),
      CricketPlayer(name: 'Ramandeep Singh', role: 'All Rounder'),
      CricketPlayer(name: 'Varun Chakravarthy', role: 'Bowler'),
      CricketPlayer(name: 'Harshit Rana', role: 'Bowler'),
      CricketPlayer(name: 'Mitchell Starc', role: 'Bowler'),
      CricketPlayer(name: 'Vaibhav Arora', role: 'Bowler'),
      CricketPlayer(name: 'Anrich Nortje', role: 'Bowler'),
    ],

    'Hyderabad Skyhawks': [
      CricketPlayer(name: 'Travis Head', role: 'Batter'),
      CricketPlayer(name: 'Abhishek Sharma', role: 'All Rounder'),
      CricketPlayer(name: 'Heinrich Klaasen', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Rahul Tripathi', role: 'Batter'),
      CricketPlayer(name: 'Aiden Markram', role: 'All Rounder'),
      CricketPlayer(name: 'Nitish Kumar Reddy', role: 'All Rounder'),
      CricketPlayer(name: 'Pat Cummins', role: 'Bowler'),
      CricketPlayer(name: 'Bhuvneshwar Kumar', role: 'Bowler'),
      CricketPlayer(name: 'T Natarajan', role: 'Bowler'),
      CricketPlayer(name: 'Mayank Markande', role: 'Bowler'),
      CricketPlayer(name: 'Umran Malik', role: 'Bowler'),
      CricketPlayer(name: 'Marco Jansen', role: 'All Rounder'),
    ],

    'Rajasthan Royalsword': [
      CricketPlayer(name: 'Yashasvi Jaiswal', role: 'Batter'),
      CricketPlayer(name: 'Sanju Samson', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Jos Buttler', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Riyan Parag', role: 'All Rounder'),
      CricketPlayer(name: 'Shimron Hetmyer', role: 'Batter'),
      CricketPlayer(name: 'Dhruv Jurel', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Ravichandran Ashwin', role: 'All Rounder'),
      CricketPlayer(name: 'Yuzvendra Chahal', role: 'Bowler'),
      CricketPlayer(name: 'Trent Boult', role: 'Bowler'),
      CricketPlayer(name: 'Sandeep Sharma', role: 'Bowler'),
      CricketPlayer(name: 'Avesh Khan', role: 'Bowler'),
      CricketPlayer(name: 'Nandre Burger', role: 'Bowler'),
    ],

    'Delhi Firehawks': [
      CricketPlayer(name: 'Rishabh Pant', role: 'Wicket Keeper'),
      CricketPlayer(name: 'KL Rahul', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Jake Fraser-McGurk', role: 'Batter'),
      CricketPlayer(name: 'David Warner', role: 'Batter'),
      CricketPlayer(name: 'Axar Patel', role: 'All Rounder'),
      CricketPlayer(name: 'Mitchell Marsh', role: 'All Rounder'),
      CricketPlayer(name: 'Kuldeep Yadav', role: 'Bowler'),
      CricketPlayer(name: 'Anrich Nortje', role: 'Bowler'),
      CricketPlayer(name: 'Mukesh Kumar', role: 'Bowler'),
      CricketPlayer(name: 'Khaleel Ahmed', role: 'Bowler'),
      CricketPlayer(name: 'Ishant Sharma', role: 'Bowler'),
      CricketPlayer(name: 'Rasikh Salam', role: 'Bowler'),
    ],

    'Punjab Lionhearts': [
      CricketPlayer(name: 'Shikhar Dhawan', role: 'Batter'),
      CricketPlayer(name: 'Prabhsimran Singh', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Jonny Bairstow', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Liam Livingstone', role: 'All Rounder'),
      CricketPlayer(name: 'Sam Curran', role: 'All Rounder'),
      CricketPlayer(name: 'Jitesh Sharma', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Shashank Singh', role: 'All Rounder'),
      CricketPlayer(name: 'Arshdeep Singh', role: 'Bowler'),
      CricketPlayer(name: 'Kagiso Rabada', role: 'Bowler'),
      CricketPlayer(name: 'Harshal Patel', role: 'Bowler'),
      CricketPlayer(name: 'Rahul Chahar', role: 'Bowler'),
      CricketPlayer(name: 'Harpreet Brar', role: 'All Rounder'),
    ],

    'Lucknow Wolfpack': [
      CricketPlayer(name: 'KL Rahul', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Quinton de Kock', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Nicholas Pooran', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Ayush Badoni', role: 'Batter'),
      CricketPlayer(name: 'Marcus Stoinis', role: 'All Rounder'),
      CricketPlayer(name: 'Krunal Pandya', role: 'All Rounder'),
      CricketPlayer(name: 'Deepak Hooda', role: 'All Rounder'),
      CricketPlayer(name: 'Ravi Bishnoi', role: 'Bowler'),
      CricketPlayer(name: 'Mohsin Khan', role: 'Bowler'),
      CricketPlayer(name: 'Mayank Yadav', role: 'Bowler'),
      CricketPlayer(name: 'Naveen-ul-Haq', role: 'Bowler'),
      CricketPlayer(name: 'Yash Thakur', role: 'Bowler'),
    ],

    'Gujarat Titanshield': [
      CricketPlayer(name: 'Shubman Gill', role: 'Batter'),
      CricketPlayer(name: 'Sai Sudharsan', role: 'Batter'),
      CricketPlayer(name: 'David Miller', role: 'Batter'),
      CricketPlayer(name: 'Wriddhiman Saha', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Matthew Wade', role: 'Wicket Keeper'),
      CricketPlayer(name: 'Rahul Tewatia', role: 'All Rounder'),
      CricketPlayer(name: 'Rashid Khan', role: 'All Rounder'),
      CricketPlayer(name: 'Vijay Shankar', role: 'All Rounder'),
      CricketPlayer(name: 'Mohammed Shami', role: 'Bowler'),
      CricketPlayer(name: 'Mohit Sharma', role: 'Bowler'),
      CricketPlayer(name: 'Noor Ahmad', role: 'Bowler'),
      CricketPlayer(name: 'Spencer Johnson', role: 'Bowler'),
    ],
  };

  static List<CricketPlayer> getSquad(String teamName) {
    return List<CricketPlayer>.from(
      squads[teamName] ?? const <CricketPlayer>[],
    );
  }
}