class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List followers;
  final List following;
  final bool isPrivate;

  const User({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.bio,
    required this.followers,
    required this.following,
    required this.isPrivate,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "photoUrl": photoUrl,
    "bio": bio,
    "followers": followers,
    "following": following,
    "isPrivate": isPrivate,
  };

  static User fromSnap(Map<String, dynamic> snap) {
    return User(
      username: snap['username'] ?? '',
      uid: snap['uid'] ?? '',
      email: snap['email'] ?? '',
      photoUrl: snap['photoUrl'] ?? '',
      bio: snap['bio'] ?? '',
      followers: snap['followers'] ?? [],
      following: snap['following'] ?? [],
      isPrivate: snap['isPrivate'] ?? false,
    );
  }
}