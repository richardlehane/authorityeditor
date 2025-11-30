import "node.dart";

enum MatchType {
  titleEquals,
  titleContains,
  textContainsAll,
  textContainsAny,
  textContainsPhrase,
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
      MatchType.retentionMoreThan => "$typ $value years",
      MatchType.retentionLessThan => "$typ $value years",
      MatchType.hasComments => typ.toString(),
      _ => "$typ $value",
    };
  }
}

class Search {
  final NodeType? scope;
  final bool and;
  final List<Match> matches;

  Search(this.matches, [this.and = true, this.scope]);

  @override
  String toString() {
    final sep = (and) ? " and " : " or ";
    if (scope == null) return matches.join(sep);
    if (scope == NodeType.termType) return "terms where ${matches.join(sep)}";
    return "classes where ${matches.join(sep)}";
  }
}
