class repo {
  String reponame;
  owner ownner;
  String description;
  int forks;
  int stars;
  int watchers;

  repo(
      {required this.reponame,
      required this.ownner,
      required this.description,
      required this.forks,
      required this.stars,
      required this.watchers});

  factory repo.fromJson(Map<String, dynamic> json) {
    return repo(
        reponame: json['name'],
        ownner: json['owner'],
        description: json['description'],
        forks: json['fork'],
        stars: json['star'],
        watchers: json['watchers']);
  }
}

class owner {
  String login;
  var reposurl;

  owner({required this.login, this.reposurl});
  factory owner.fromJson(Map<String, dynamic> json) {
    return owner(login: json['login'], reposurl: json['repos_url']);
  }
}

class all {
  List<repo> repos;
  all({required this.repos});

  factory all.fromJson(Map<String, dynamic> json) {
    return all(
        repos: List<repo>.from(json['repos'].map((x) => repo.fromJson(x))));
  }
}
