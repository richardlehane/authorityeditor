enum MatchType {
  titleEquals,
  titleContains,
  textContainsAll,
  textContainsAny,
  textContainsPhrase,
  termType,
  classType,
  updatedSince,
  retentionMoreThan,
  retentionLessThan,
  disposalAction,
  hasComments,
  hasCommentsAuthor;

  @override
  String toString() {
    return switch (this) {
      MatchType.titleEquals => "title equals",
      MatchType.titleContains => "title contains",
      MatchType.textContainsAll => "text fields contain all",
      MatchType.textContainsAny => "text fields contain any",
      MatchType.textContainsPhrase => "text fields contain phrase",
      MatchType.termType => "terms",
      MatchType.classType => "disposal classes",
      MatchType.updatedSince => "updated since",
      MatchType.retentionMoreThan => "retention period is more than",
      MatchType.retentionLessThan => "retention period is less than",
      MatchType.disposalAction => "disposal action is",
      MatchType.hasComments => "has comments",
      MatchType.hasCommentsAuthor => "has comments by author",
    };
  }
}

class Match {
  MatchType typ = MatchType.titleContains;
  dynamic value;

  @override
  String toString() {
    return switch (typ) {
      MatchType.termType => typ.toString(),
      MatchType.classType => typ.toString(),
      MatchType.retentionMoreThan => "$typ $value years",
      MatchType.retentionLessThan => "$typ $value years",
      MatchType.hasComments => typ.toString(),
      _ => "$typ $value",
    };
  }
}

class Search {
  final List<Match> matches;
  final bool and;

  Search(this.matches, [this.and = false]);

  @override
  String toString() {
    final sep = (and) ? " and " : " or ";
    return matches.join(sep);
  }
}
