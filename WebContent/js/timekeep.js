function GetRTime(end){
				    var EndTime= new Date(end);
				    var NowTime = new Date();
				    var t =EndTime.getTime() - NowTime.getTime();
				    var h=0;
				    var m=0;
				    var s=0;
				    if(t>=0){
				      d=Math.floor(t/1000/60/60/24);
				      h=Math.floor(t/1000/60/60%24);
				      m=Math.floor(t/1000/60%60);
				      s=Math.floor(t/1000%60);
				    }
				    document.getElementById("t_h").innerHTML = h;
				    document.getElementById("t_m").innerHTML = m;
				    document.getElementById("t_s").innerHTML = s;
				  }
$(function (){
	//每秒执行一次，提示用户,剩余时间
	setInterval(GetRTime,1000);
})



