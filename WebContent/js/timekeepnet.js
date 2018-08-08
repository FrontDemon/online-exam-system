function timer(endtimes){ 
    { 
    	var current = new Date().getTime();
        var ts = endtimes - current;//计算剩余的毫秒数
        if(ts>0){
        	h = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数  
	        m = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数  
	        s = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数    
	        h = checkTime(h);  
	        m = checkTime(m);
	        s = checkTime(s);  
	        document.getElementById("t_h").innerHTML = h;
		    document.getElementById("t_m").innerHTML = m;
		    document.getElementById("t_s").innerHTML = s; 
	        setInterval("timer(endtimes)",1000);  
        }
        else{
        	window.location.href = 'studentmain';
        }
    }  
}
function checkTime(i)    
{    
   if (i < 10) {    
       i = "0" + i;    
    }    
   return i;    
} 



