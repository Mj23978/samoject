enum TaskStatus { 

  complete("complete"),
  pending("pending"),
  starting("starting");

  final String statusType;
  
  const TaskStatus(this.statusType);

}
