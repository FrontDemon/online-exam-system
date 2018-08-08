package com.oes.mwt.thread;

import java.io.IOException;
import java.util.Date;

import javax.websocket.Session;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * 
 * @author 马伟涛
 *
 *	启动计时线程
 *
 *
 */
public class Timekeeping implements Runnable {

	private Session session;
	
	//目标时间
	private Long target;
	
	private Long time;
	
	//构造方法
	public Timekeeping(Long target,Session session){
		this.session = session;
		this.target = target;
	}
	
	@Override
	public void run() {
		try {
			//发送消息给客户端，告诉客户端当前时间与目标时间
			//不使用客户机本地时间，计时标准按照服务器端时间
			String resultStart = "{\"state\":\"start\"}";
			this.session.getBasicRemote().sendText(resultStart);
			while (true) {
				//线程休眠0.5秒，为了不过多损耗CPU性能，选择0.5秒另一个原因是为了前台时间更加平滑
				Thread.sleep(500);
				
				Date current = new Date();
				Long currentLong = current.getTime();
				ObjectMapper om = new ObjectMapper();
				
				if (currentLong >= this.target){
					//Map<String,String> resultMap = new HashMap<>();
					//resultMap.put("state", "online");
					//resultMap.put("message", "end");
					//om.writeValueAsString(resultMap);
					//给js返回结束状态
					if (session.isOpen()){
						//字符串拼接成JSON格式
						String resultEnd = "{\"state\":\"end\",\"message:\":\"end\"}";
						//发送消息给客户端
						session.getBasicRemote().sendText(resultEnd);
					}
					//跳出循环结束线程
					break;	
				}else{
					if (session.isOpen()){
						//字符串拼接成JSON格式
						String resultEnd = "{\"state\":\"time\",\"endtime\":"+this.target+",\"currentime\":"+currentLong+"}";
						//向客户端发送消息，告知客户端剩余时间
						session.getBasicRemote().sendText(resultEnd);
					}else {
						break;	
					}
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

    public void sendMessage(String message) throws IOException{
        //向客户端发送消息
    	this.session.getBasicRemote().sendText(message);
        
    }
	
}
