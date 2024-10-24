class LearnResponse {
  final bool success;
  final int count;
  final List<LearningCourse> learningCourses;
  final int resultPerPage;

  LearnResponse({
    required this.success,
    required this.count,
    required this.learningCourses,
    required this.resultPerPage,
  });

  factory LearnResponse.fromJson(Map<String, dynamic> json) {
    return LearnResponse(
      success: json['success'],
      count: json['count'],
      learningCourses: (json['learningCourses'] as List)
          .map((course) => LearningCourse.fromJson(course))
          .toList(),
      resultPerPage: json['resultPerPage'],
    );
  }
}

// LearningCourse Model
class LearningCourse {
  final String id;
  final String title;
  final String content;
  final int prizeMoney;
  final String status;
  final ListedBy listedBy;
  final String postedBy;
  final List<Quiz> quiz;
  final String createdAt;
  final String updatedAt;

  LearningCourse({
    required this.id,
    required this.title,
    required this.content,
    required this.prizeMoney,
    required this.status,
    required this.listedBy,
    required this.postedBy,
    required this.quiz,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LearningCourse.fromJson(Map<String, dynamic> json) {
    return LearningCourse(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      prizeMoney: json['prizeMoney'],
      status: json['status'],
      listedBy: ListedBy.fromJson(json['listedBy']),
      postedBy: json['postedBy'],
      quiz: (json['quiz'] as List).map((q) => Quiz.fromJson(q)).toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

// ListedBy Model
class ListedBy {
  final String id;
  final String mobileNumber;
  final String role;

  ListedBy({
    required this.id,
    required this.mobileNumber,
    required this.role,
  });

  factory ListedBy.fromJson(Map<String, dynamic> json) {
    return ListedBy(
      id: json['_id'],
      mobileNumber: json['mobileNumber'],
      role: json['role'],
    );
  }
}

// Quiz Model
class Quiz {
  final String questionText;
  final List<Option> options;
  final String id;

  Quiz({
    required this.questionText,
    required this.options,
    required this.id,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      questionText: json['questionText'],
      options:
          (json['options'] as List).map((opt) => Option.fromJson(opt)).toList(),
      id: json['_id'],
    );
  }
}

// Option Model
class Option {
  final String optionLabel;
  final int optionValue;
  final String id;

  Option({
    required this.optionLabel,
    required this.optionValue,
    required this.id,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      optionLabel: json['optionLabel'],
      optionValue: json['optionValue'],
      id: json['_id'],
    );
  }
}
