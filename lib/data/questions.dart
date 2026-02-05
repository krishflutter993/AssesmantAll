final questions = [
  {
    'q':
        'Which cat species has the longest canine teeth as compared to body size?',
    'a': ['Clouded Leopard', 'African Lion', 'Siberian Tiger', 'Indian Tiger'],
    'correct': 'Clouded Leopard',
  },
  {
    'q': 'What is the largest planet in our Solar System?',
    'a': ['Earth', 'Jupiter', 'Saturn', 'Mars'],
    'correct': 'Jupiter',
  },
  {
    'q': 'Who wrote the play "Romeo and Juliet"?',
    'a': [
      'William Shakespeare',
      'Charles Dickens',
      'Jane Austen',
      'Leo Tolstoy',
    ],
    'correct': 'William Shakespeare',
  },
  {
    'q': 'What is the chemical symbol for Gold?',
    'a': ['Ag', 'Au', 'Gd', 'Go'],
    'correct': 'Au',
  },
  {
    'q': 'Which country is known as the Land of the Rising Sun?',
    'a': ['China', 'Japan', 'Thailand', 'South Korea'],
    'correct': 'Japan',
  },
  {
    'q': 'What is the capital of Australia?',
    'a': ['Sydney', 'Melbourne', 'Canberra', 'Perth'],
    'correct': 'Canberra',
  },
  {
    'q': 'Which element has the atomic number 1?',
    'a': ['Oxygen', 'Hydrogen', 'Helium', 'Carbon'],
    'correct': 'Hydrogen',
  },
  {
    'q': 'Who painted the Mona Lisa?',
    'a': [
      'Vincent van Gogh',
      'Leonardo da Vinci',
      'Pablo Picasso',
      'Claude Monet',
    ],
    'correct': 'Leonardo da Vinci',
  },
  {
    'q': 'Which planet is known as the Red Planet?',
    'a': ['Mars', 'Venus', 'Mercury', 'Jupiter'],
    'correct': 'Mars',
  },
  {
    'q': 'Which is the longest river in the world?',
    'a': ['Nile', 'Amazon', 'Yangtze', 'Mississippi'],
    'correct': 'Nile',
  },
  {
    'q': 'Who is known as the Father of Computers?',
    'a': ['Alan Turing', 'Charles Babbage', 'Tim Berners-Lee', 'Steve Jobs'],
    'correct': 'Charles Babbage',
  },
  {
    'q': 'Which gas do plants absorb from the atmosphere?',
    'a': ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
    'correct': 'Carbon Dioxide',
  },
  {
    'q': 'What is the hardest natural substance on Earth?',
    'a': ['Gold', 'Iron', 'Diamond', 'Quartz'],
    'correct': 'Diamond',
  },
  {
    'q': 'Which country hosted the 2016 Summer Olympics?',
    'a': ['China', 'Brazil', 'UK', 'Russia'],
    'correct': 'Brazil',
  },
  {
    'q': 'Who discovered penicillin?',
    'a': ['Marie Curie', 'Alexander Fleming', 'Louis Pasteur', 'Gregor Mendel'],
    'correct': 'Alexander Fleming',
  },
  {
    'q': 'Which organ purifies blood in the human body?',
    'a': ['Liver', 'Heart', 'Kidney', 'Lungs'],
    'correct': 'Kidney',
  },
  {
    'q': 'Which planet has the most moons?',
    'a': ['Earth', 'Saturn', 'Jupiter', 'Mars'],
    'correct': 'Saturn',
  },
  {
    'q': 'Which country is famous for the Eiffel Tower?',
    'a': ['Italy', 'France', 'Germany', 'Spain'],
    'correct': 'France',
  },
  {
    'q': 'What is the main gas in the Earth’s atmosphere?',
    'a': ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
    'correct': 'Nitrogen',
  },
  {
    'q': 'Who invented the telephone?',
    'a': [
      'Alexander Graham Bell',
      'Thomas Edison',
      'Nikola Tesla',
      'Guglielmo Marconi',
    ],
    'correct': 'Alexander Graham Bell',
  },
  {
    'q': 'Which continent is the Sahara Desert located in?',
    'a': ['Asia', 'Africa', 'Australia', 'South America'],
    'correct': 'Africa',
  },
  {
    'q': 'Which organ is responsible for pumping blood in the human body?',
    'a': ['Lungs', 'Heart', 'Kidneys', 'Brain'],
    'correct': 'Heart',
  },
  {
    'q': 'Who is known as the “Iron Man of India”?',
    'a': [
      'Mahatma Gandhi',
      'Sardar Vallabhbhai Patel',
      'Jawaharlal Nehru',
      'Subhas Chandra Bose',
    ],
    'correct': 'Sardar Vallabhbhai Patel',
  },
  {
    'q': 'Which is the smallest continent by land area?',
    'a': ['Europe', 'Australia', 'Antarctica', 'South America'],
    'correct': 'Australia',
  },
  {
    'q': 'Which vitamin is produced when a person is exposed to sunlight?',
    'a': ['Vitamin A', 'Vitamin B12', 'Vitamin D', 'Vitamin C'],
    'correct': 'Vitamin D',
  },
];

final Map<String, Map<String, String>> categoryQuestions = {
  'Fundamentals': {
    'What is Flutter?':
        'Flutter is an open-source UI toolkit by Google for building natively compiled apps for mobile, web, and desktop from a single codebase using Dart.',
    'Explain OOP concepts.':
        'OOP (Object-Oriented Programming) includes Encapsulation, Abstraction, Inheritance, and Polymorphism.',
    'What is a widget in Flutter?':
        'A widget is an immutable description of part of a UI in Flutter.',
    'Difference between StatelessWidget and StatefulWidget?':
        'StatelessWidget cannot change state; StatefulWidget can rebuild when its state changes.',
    'Explain the Flutter build() method.':
        'The build() method describes the part of the UI represented by a widget and is called to render or rebuild it.',
    'What is hot reload and hot restart?':
        'Hot reload updates the running app with code changes without losing state; hot restart restarts the app and resets state.',
    'What are streams in Dart?':
        'A stream is a sequence of asynchronous events, allowing you to listen and react to data over time.',
    'Difference between async, await, and Future in Dart?':
        'Future represents a value that will be available later; async marks a function asynchronous; await pauses execution until the Future completes.',
  },
  'SQL': {
    'What is a JOIN?':
        'A JOIN combines rows from two or more tables based on a related column.',
    'Explain primary key and foreign key.':
        'Primary key uniquely identifies a record; foreign key links to a primary key in another table.',
    'What is the difference between INNER JOIN and OUTER JOIN?':
        'INNER JOIN returns matching rows only; OUTER JOIN returns matching rows plus non-matching rows from one or both tables.',
    'What is a UNIQUE constraint?':
        'A UNIQUE constraint ensures all values in a column are distinct.',
    'Explain normalization and denormalization.':
        'Normalization reduces redundancy and dependency; denormalization adds redundancy for performance.',
    'What is an index and why is it used?':
        'An index improves query performance by allowing faster data retrieval.',
    'Difference between DELETE and TRUNCATE.':
        'DELETE removes rows one by one and can be rolled back; TRUNCATE removes all rows quickly and cannot be rolled back.',
    'Explain GROUP BY and HAVING clauses.':
        'GROUP BY groups rows with the same values; HAVING filters groups based on conditions.',
  },
  'HR Questions': {
    'Tell me about yourself.':
        'Give a brief summary of your professional background, skills, and achievements relevant to the job.',
    'What are your strengths?':
        'Highlight skills or qualities that make you a strong candidate for the role.',
    'What are your weaknesses?':
        'Be honest but show how you are working to improve them.',
    'Where do you see yourself in 5 years?':
        'Share career goals that align with growth in the role or company.',
    'Why do you want to work with us?':
        'Explain your interest in the company’s culture, projects, or values.',
    'Describe a challenging situation you faced and how you handled it.':
        'Give a specific example, explain the problem, your actions, and the result.',
    'How do you handle stress or pressure?':
        'Explain techniques you use to stay organized, calm, and productive.',
    'Do you prefer working in a team or alone? Why?':
        'Answer honestly, explaining how your preference suits your work style or role.',
  },
};
