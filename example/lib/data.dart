import 'package:dash_chat_2/dash_chat_2.dart';

String profileImage =
    'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/1-intro-photo-final.jpeg?alt=media&token=daf78997-d8f0-49d1-9120-a9380bde48b5';

// We have all the possibilities for users
ChatUser user = ChatUser(id: '0');
ChatUser user1 = ChatUser(id: '1');
ChatUser user2 = ChatUser(
    id: '2',
    firstName: 'Niki Lauda',
    lastName: "Khan",
    customProperties: {
      "phone": "01932331718",
      "email": "Shakilhassan887@gmail.com"
    });
ChatUser user3 = ChatUser(id: '3', lastName: 'Clark');
ChatUser user4 = ChatUser(id: '4', profileImage: profileImage);
ChatUser user5 = ChatUser(id: '5', firstName: 'Charles', lastName: 'Leclerc');
ChatUser user6 =
    ChatUser(id: '6', firstName: 'Max', profileImage: profileImage);
ChatUser user7 =
    ChatUser(id: '7', lastName: 'Toto', profileImage: profileImage);
ChatUser user8 = ChatUser(
    id: '8', firstName: 'Toto', lastName: 'Clark', profileImage: profileImage);

List<ChatMessage> allUsersSample = <ChatMessage>[
  ChatMessage(
    text: 'Test',
    user: user1,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user2,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user3,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user4,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user5,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user6,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user7,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
  ChatMessage(
    text: 'Test',
    user: user8,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
];

List<ChatMessage> basicSample = <ChatMessage>[
  ChatMessage(
      customProperties: {
        "type": 5,
      },
      user: user2,
      createdAt: DateTime.now(),
      text: '',
      medias: [
        ChatMedia(
            url: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
            fileName: "sdvsdvsdvsdv",
            type: MediaType.image,
            customProperties: {"sacasc": "sacasc"})
      ]),
  ChatMessage(
      customProperties: {
        "type": 2,
      },
      user: user2,
      createdAt: DateTime.now(),
      text: 'Your CV has been sent.',
      medias: [
        ChatMedia(
            url: "sdvsdvsdvsdvsd",
            fileName: "sdvsdvsdvsdv",
            type: MediaType.file,
            customProperties: {"sacasc": "sacasc"})
      ]),
      ChatMessage(
      customProperties: {
        "type": 2,
      },
      user: user2,
      createdAt: DateTime.now(),
      text: 'Your CV has been sent.',
      medias: [
        ChatMedia(
            url: "sdvsdvsdvsdvsd",
            fileName: "sdvsdvsdvsdv",
            type: MediaType.file,
            customProperties: {"sacasc": "sacasc"})
      ]),


      
  ChatMessage(
    customProperties: {
      "type": 1,
    },
    user: user2,
    createdAt: DateTime.now(),
    text: 'Your Phone Number has been sent.',
  ),
  ChatMessage(
    customProperties: {
      "type": 2,
    },
    user: user,
    createdAt: DateTime.now(),
    text: '',
  ),
  ChatMessage(
    customProperties: {
      "type": 2,
    },
    user: user,
    createdAt: DateTime.now(),
    text: '',
  ),
  ChatMessage(
    customProperties: {
      "type": 2,
    },
    user: user,
    createdAt: DateTime.now(),
    text: '',
  ),

  // ChatMessage(
  //   text: '1111111111111',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  ChatMessage(
      text: '',
      user: user,
      createdAt: DateTime.now(),
      customProperties: {"type": 2}),
  //   ChatMessage(
  //   text: 'Your CV has been sent.',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2}
  // ),
  // ChatMessage(
  //   text: '222222222222222',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: '3333333333333333',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: '4444444444444444',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: '555555555555555555',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2},medias: [
  //   ChatMedia(
  //             url: "https://www.africau.edu/images/default/sample.pdf",
  //             fileName: "sample.pdf",
  //             type: MediaType.file,
  //             customProperties: {"sdv": "sdvsd"})
  // ]),
  // ChatMessage(

  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2},medias: [
  //   ChatMedia(
  //             url: "https://www.africau.edu/images/default/sample.pdf",
  //             fileName: "sample.pdf",
  //             type: MediaType.file,
  //             customProperties: {"sdv": "sdvsd"})
  // ]),
  // ChatMessage(
  //   text: '',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2},medias: [
  //   ChatMedia(
  //             url: "https://www.africau.edu/images/default/sample.pdf",
  //             fileName: "sample.pdf",
  //             type: MediaType.file,
  //             customProperties: {"sdv": "sdvsd"})
  // ]),
  // ChatMessage(
  //   text: '',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2},medias: [
  //   ChatMedia(
  //             url: "https://www.africau.edu/images/default/sample.pdf",
  //             fileName: "sample.pdf",
  //             type: MediaType.file,
  //             customProperties: {"sdv": "sdvsd"})
  // ]),
  // ChatMessage(
  //   text: '',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2},medias: [
  //   ChatMedia(
  //             url: "https://www.africau.edu/images/default/sample.pdf",
  //             fileName: "sample.pdf",
  //             type: MediaType.file,
  //             customProperties: {"sdv": "sdvsd"})
  // ]),
  // ChatMessage(
  //   text: 'our phone number has been sent',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'google.com hello you  is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'our phone number has been sent',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 1}
  // ),
  // ChatMessage(
  //   text: 'our phone number has been sent',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: '',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2},medias: [
  //   ChatMedia(
  //             url: "https://www.africau.edu/images/default/sample.pdf",
  //             fileName: "sampleghgyfgfhgtfhgfhghg.pdf",
  //             type: MediaType.file,
  //             customProperties: {"sdv": "sdvsd"})
  // ]),
  // ChatMessage(
  //   text: 'Your request to ask phone number has been sent.',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 3}
  // ),
  //  ChatMessage(
  //   text: 'Your request to exchange CV has been sent.',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 4}
  // ),

  // ChatMessage(
  //   text: 'The recruiter has requested your Phone Number. Kindly accept the request to share your mobile number with the Recruiter.',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 3}
  // ),
  // ChatMessage(
  //   text: 'The recruiter has requested your CV. Kindly accept the request to share your CV with the Recruiter.',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 4}
  // ),

  // ChatMessage(
  //   text: 'Your CV has been sent.',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 2}
  // ),
  // ChatMessage(
  //   text: 'Your phone number has been sent.',
  //   user: user,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 1}
  // ),
  // ChatMessage(
  //   text: 'google.com hello you  is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'google.com hello you  is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'google.com hello you  is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'google.com hello you  is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime.now(),
  //   customProperties: {"type": 0}
  // ),

  // ChatMessage(
  //   text: 'google.com hello you @Marc is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime(2021, 01, 31, 16, 45),
  //   customProperties: {"type": 0}
  // ),

  // ChatMessage(
  //   text: 'google.com hello you @Marc is it &you okay?',
  //   user: user2,
  //   createdAt: DateTime(2021, 01, 31, 16, 45),
  //   customProperties: {"type": 0}

  // ),
  // ChatMessage(
  //   text: 'google.com',
  //   user: user2,
  //   createdAt: DateTime(2021, 01, 30, 16, 45),
  //   customProperties: {"type": 0}

  // ),
  // ChatMessage(
  //   text: "Oh what's up guys?",
  //   user: user2,
  //   createdAt: DateTime(2021, 01, 30, 16, 45),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'How you doin?',
  //   user: user8,
  //   createdAt: DateTime(2021, 01, 30, 16, 34),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'Hey!',
  //   user: user,
  //   createdAt: DateTime(2021, 01, 30, 15, 50),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'Hey!',
  //   user: user,
  //   createdAt: DateTime(2021, 01, 28, 15, 50),
  //   customProperties: {"type": 0}
  // ),
  // ChatMessage(
  //   text: 'Hey!',
  //   user: user,
  //   createdAt: DateTime(2021, 01, 28, 15, 50),
  //   customProperties: {"type": 0}
  // ),
];

List<ChatMessage> media = <ChatMessage>[
  ChatMessage(
    medias: <ChatMedia>[
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.image,
        fileName: 'image.png',
        isUploading: true,
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.image,
        fileName: 'image.png',
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/chat_medias%2F2GFlPkj94hKCqonpEdf1%2F20210526_162318.mp4?alt=media&token=01b814b9-d93a-4bf1-8be1-cf9a49058f97',
        type: MediaType.video,
        fileName: 'video.mp4',
        isUploading: false,
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.file,
        fileName: 'image.png',
      ),
      ChatMedia(
        url:
            'https://firebasestorage.googleapis.com/v0/b/molteo-40978.appspot.com/o/memes%2F155512641_3864499247004975_4028017188079714246_n.jpg?alt=media&token=0b335455-93ed-4529-9055-9a2c741e0189',
        type: MediaType.image,
        fileName: 'image.png',
      )
    ],
    user: user3,
    createdAt: DateTime(2021, 01, 30, 16, 34),
  ),
];

List<ChatMessage> quickReplies = <ChatMessage>[
  ChatMessage(
    text: 'How you doin?',
    user: user3,
    createdAt: DateTime.now(),
    quickReplies: <QuickReply>[
      QuickReply(title: 'Great!'),
      QuickReply(title: 'Awesome'),
    ],
  ),
];

List<ChatMessage> mentionSample = <ChatMessage>[
  ChatMessage(
    text: 'Hello @Niki, you should check #channel',
    user: user2,
    createdAt: DateTime(2021, 01, 31, 16, 45),
    mentions: [
      Mention(title: '@Niki', customProperties: {'userId': user5.id}),
      Mention(title: '#channel'),
    ],
  ),
  ChatMessage(
    text: "Oh what's up guys?",
    user: user5,
    createdAt: DateTime(2021, 01, 30, 16, 45),
  ),
];

List<ChatMessage> d = <ChatMessage>[];
