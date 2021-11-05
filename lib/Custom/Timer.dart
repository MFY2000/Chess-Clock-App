// ignore_for_file: file_names


void main() {
  var obj = Timer(Time: {"Hours": 00, "Minutes": 10, "Seconds":00});

  print(obj);


}

class Timer {
  Map<String, int> Time;
  late int status; // 1 => Running, 0 => Stop, 3 => Timeover 


  Timer({required this.Time});

  
  void Start(){
    status = 1;
    Running();
  }
  
  Future<void> Running() async {
    if(status == 1)
      await Future.delayed(const Duration(seconds: 1), (){ afterASecond(); });
  }

  afterASecond(){
    int? Seconds = Time["Seconds"];
    if(Seconds == 0){
      if(Time["Minutes"] == 0){
        
      }
      Time["Seconds"] = 59;
      Time["Minutes"] = (Time["Minutes"]!-1);
    }
    else{
      Time["Seconds"] = (Seconds! - 1) ;
    }

    Running();
  }

}

