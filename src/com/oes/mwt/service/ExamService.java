package com.oes.mwt.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.Map.Entry;

import org.springframework.util.MultiValueMap;

import com.oes.mwt.dao.DaoConnection;
import com.oes.mwt.entity.MarkInfo;
import com.oes.mwt.entity.PaperInfo;
import com.oes.mwt.entity.PaperQue;
import com.oes.mwt.entity.QueAnswer;
import com.oes.mwt.entity.StudentInfo;
import com.oes.mwt.entity.SubInfo;
import com.oes.mwt.util.*;;


/**
 * 
 * @author 马伟涛
 *
 * 系统服务层处理在线考试层面的操作，如科目选择，试卷选择，试卷查询等等
 */
public class ExamService {
	
	/***************************************************科目编辑***************************************************/
	
	
	//分页时页码和行数返回科目表的信息并存放在List数组中
	public static List<Map<String, String>> getSubPage (Integer page,Integer row){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement sp = dc.getPreExec(SubInfo.SELECTPAGING.toString(), page,row);
			ResultSet rs = sp.executeQuery();
			if (rs != null){
				while (rs.next()){
					Map<String, String> reaultMap = new HashMap<String, String>();
					//调用SimpleDateFormat日期格式
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					reaultMap.put(SubInfo.SUBID.toString(), rs.getString(1));
					reaultMap.put(SubInfo.SUBNAME.toString(),rs.getString(2));
					//取数据库中datatime类型字段数据
					Long sqlDateLong = rs.getTimestamp(3).getTime();//rs.getDate(3).getTime();
					reaultMap.put(SubInfo.SUBCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
					resultListMap.add(reaultMap);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultListMap;
	}
	
	
	
	//获取全部页面科目信息并存放进List数组
	public static List<Map<String, String>> getAllSubPage (){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement sp = dc.getPreExec(SubInfo.SELECTALL.toString());
			ResultSet rs = sp.executeQuery();
			if (rs != null){
				while (rs.next()){
					Map<String, String> reaultMap = new HashMap<String, String>();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					reaultMap.put(SubInfo.SUBID.toString(), rs.getString(1));
					reaultMap.put(SubInfo.SUBNAME.toString(),rs.getString(2));
					//取数据库中datatime类型字段数据
					Long sqlDateLong = rs.getTimestamp(3).getTime();//rs.getDate(3).getTime();
					reaultMap.put(SubInfo.SUBCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
					resultListMap.add(reaultMap);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultListMap;
	}
	
	
	//获取全部页面科目信息并存放进List数组
//	public static List<Map<String, String>> getEditSubPage (){
//		List<Map<String, String>> resultListMap = new ArrayList<>();
//		DaoConnection dc = DaoConnection.initDaoConnection();
//		try {
//			PreparedStatement sp = dc.getPreExec(SubInfo.SELECTALL.toString());
//			ResultSet rs = sp.executeQuery();
//			if (rs != null){
//				while (rs.next()){
//					Map<String, String> reaultMap = new HashMap<String, String>();
//					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//					reaultMap.put(SubInfo.SUBNAME.toString(),rs.getString(2));
//					//取数据库中datatime类型字段数据
//					Long sqlDateLong = rs.getTimestamp(3).getTime();//rs.getDate(3).getTime();
//					reaultMap.put(SubInfo.SUBCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
//					
//					reaultMap.put(SubInfo.SUBID.toString(), rs.getString(1));
//					resultListMap.add(reaultMap);
//				}
//			}
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		return resultListMap;
//	}
		
	
	//取出数据库表科目的数量
	public static Long getSubCount (){
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(SubInfo.SELECTCOUNT.toString());
			ResultSet rs = ps.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
	}
	
	
	//插入科目返回int值不为0则插入成功
	public static int insert (String subject){
		int resultInt = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			//调用UUID接口生成16进制的唯一数作为科目主键ID值
			PreparedStatement ps = dc.getPreExec(SubInfo.INSERT.toString(),subject);
			resultInt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultInt;
	}
	
	
	//删除科目返回int值不为0则删除成功
	public static int deleteById (String sub_id){
		int resultInt = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(SubInfo.DELETEBYID.toString(), sub_id);
			resultInt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultInt;
	}
	
	public static int deleteByPaperId (String paper_id){
		int resultInt = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(PaperInfo.DELETEBYPAPERID.toString(), paper_id);
			resultInt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return resultInt;
	}
	
	
	//更新选中科目信息返回int值不为0则更新成功
	public static int updateById (String subject,String sub_id){
		int resultInt = 0;
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(SubInfo.UPDATENAMEBYSUBID.toString(),subject ,sub_id);
			resultInt = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultInt;
	}
	
	
	/***************************************************试卷编辑***************************************************/
	
	
	//获取当前页数的问题
	public static List<Map<String, String>> getQuestion (Integer page,Integer row){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			PreparedStatement ps = dc.getPreExec(PaperQue.SELECTBYPAPERID.toString(), page,row);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> resultMap = new HashMap<>();
				String que_id = rs.getString(1);
				String que_name = rs.getString(2);
				String que_type = rs.getString(3);
				Long timestamp = rs.getTimestamp(4).getTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String que_creation_time = sdf.format(new Date(timestamp));
				String que_grade = rs.getInt(6)+"";
				String paper_id = rs.getString(7);
				resultMap.put(PaperQue.QUEID.toString(), que_id);
				resultMap.put(PaperQue.QUENAME.toString(), que_name);
				resultMap.put(PaperQue.QUETYPE.toString(), que_type);
				resultMap.put(PaperQue.QUECREATIONTIME.toString(),que_creation_time);
				resultMap.put(PaperQue.QUEGRADE.toString(),que_grade);
				resultMap.put(PaperQue.PAPERID.toString(),paper_id);
				resultListMap.add(resultMap);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultListMap;
	}
	
	
	//获取问题个数
	public static Long getQueCount (){
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(PaperQue.SELECTCOUNT.toString());
			ResultSet rs = ps.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
	}
	
	/**
	 * 
	 * @param 问题标题
	 * @param 问题类型
	 * @param 分数
	 * @param 答案编码
	 * @param 外键
	 * @param daanMap
	 * @return
	 */
	//插入问题和答案
	public static int InsertQuestionAndAnswers (String que_name,String que_type,Long que_answer_code,int que_grade,String paper_id,Map<String,String> daanMap){
		int result = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			String questionSQL = PaperQue.INSERT.toString();
			
			Connection connection = dc.getJDBCConnection();
			
			Statement statement = connection.createStatement();
			String que_id = (getLastQueId()+1)+"";
			statement.addBatch("insert into oes_paper_que (que_id,que_name,que_type,que_creation_time,que_answer_code,que_grade,paper_id) "
					+ "VALUES ('"+que_id+"','"+que_name+"','"+que_type+"',NOW(),"+que_answer_code+","+que_grade+",'"+paper_id+"')");
			Set<Entry<String, String>> daanEntry = daanMap.entrySet();
			for (Entry<String, String> entry : daanEntry){
				statement.addBatch("INSERT into oes_que_answer (ans_id,ans_content,ans_creation_time,que_id) VALUES ('"+entry.getKey()+"','"+entry.getValue()+"',NOW(),'"+que_id+"')");
			}
			result = statement.executeBatch()[0];
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	//取答案表最后一条数据的id值
	public static int getLastAnsId() {
		DaoConnection dc = DaoConnection.initDaoConnection();
		int result = 0;
		try {
			PreparedStatement ps = dc.getPreExec(QueAnswer.SELECTLASTANSID.toString());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//取答案表最后一条数据的id值
	public static int getLastQueId() {
		DaoConnection dc = DaoConnection.initDaoConnection();
		int result = 0;
		try {
			PreparedStatement ps = dc.getPreExec(PaperQue.SELECTLASTQUEID.toString());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				result = rs.getInt(1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
		
	/***************************************************试卷主表***************************************************/
	
	//获取当前页面的试卷数据
	public static List<Map<String, String>> getMain (Integer page,Integer row){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			PreparedStatement ps = dc.getPreExec(PaperInfo.SELECTPAGING.toString(), page,row);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> resultMap = new HashMap<>();
				String paper_id = rs.getString(1);
				String paper_name = rs.getString(2);
				long timestamp = rs.getTimestamp(3).getTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String paper_creation_of_time = sdf.format(new Date(timestamp));
				long paper_time_of_answer = rs.getLong(4);
				String sub_id = rs.getString(5);
				resultMap.put(PaperInfo.PAPERID.toString(), paper_id);
				resultMap.put(PaperInfo.PAPERNAME.toString(),paper_name);
				resultMap.put(PaperInfo.PAPERCREATIONTIME.toString(),paper_creation_of_time);
				resultMap.put(PaperInfo.PAPERTIMEOFANSWER.toString(),paper_time_of_answer+"");
				resultMap.put(PaperInfo.SUBID.toString(),sub_id);
				resultMap.put(SubInfo.SUBNAME.toString(),rs.getString(6));
				resultListMap.add(resultMap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultListMap;
	}
	
	
	//获取试卷的数量
	public static Long getMainCount (){
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(PaperInfo.SELECTCOUNT.toString());
			ResultSet rs = ps.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
	}
	
	
	//新增试卷插入试卷表
	public static int insertMain (String paper_name,String paper_time_of_answer,String sub_id){
		int result = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			PreparedStatement ps = dc.getPreExec(PaperInfo.INSERT.toString(),paper_name,paper_time_of_answer,sub_id);
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//更新选中试卷信息
	public static int updatetMain (String paper_name,String paper_time_of_answer,String sub_id,String paper_id){
		int result = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			PreparedStatement ps = dc.getPreExec(PaperInfo.UDDATEBYPAPERID.toString(),paper_name,paper_time_of_answer,sub_id,paper_id);
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	
	
	/**
	 * 根据sub_id获取科目下所有试卷
	 * @param sub_id
	 * @return
	 */
	
	//根据科目id获取该科目下所有试卷
	public static List<Map<String,String>> getMainBySubject (String sub_id){
		List<Map<String,String>> mains = new ArrayList<>();
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(PaperInfo.SELECTBYSUBID.toString(),sub_id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> entity = new HashMap<>();
				String paper_id = rs.getString(1);
				long paper_grade = getSumGrade(paper_id);
//				System.out.println(paper_grade);
				String paper_name = rs.getString(2);
				entity.put(PaperInfo.PAPERID.toString(), paper_id);
				entity.put(PaperInfo.PAPERNAME.toString(), paper_name);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				Long sqlDateLong = rs.getTimestamp(3).getTime();//rs.getDate(3).getTime();
				entity.put(PaperInfo.PAPERCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
				entity.put(PaperInfo.PAPERTIMEOFANSWER.toString(), rs.getString(4));
				entity.put("paper_grade", paper_grade+"");
				
				String queCount = getQueCount(paper_id)+"";
				entity.put("qC",queCount);
				
				String radioCount = getQueRadioCount(paper_id)+"";
				entity.put("rC",radioCount);
				
				String checkBoxCount = getQueCheckboxCount(paper_id)+"";
				entity.put("cC",checkBoxCount);
				
				entity.put(PaperInfo.SUBID.toString(), rs.getString(5));
				mains.add(entity);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mains;
	}
	
	
	/************************************************Action*************************************************************/
	/**
	 * 根据 paper_id 获取一份完整的试卷
	 * @param  parampaper_id
	 * @return
	 */
	
	//通过试卷主键paper_id获取完整的试卷
	public static Map<String,Object> getAllQuestion (String parampaper_id){
		
		//SELECT paper_id,paper_name,paper_creation_of_time,paper_time_of_answer,sub_id FROM oes_paper_info where paper_id = ?"),
		String selectMainSQL = PaperInfo.SELECTBYPAPERID.toString();

		String selectQuestionSQL = PaperQue.SELECTBYPAPERID.toString();

		String selectAnswerSQL =  QueAnswer.SELECTBYPAPERID.toString();
		
		int result = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		PreparedStatement ps;
		ResultSet rs;
		Map<String,Object> resultMainMap = new HashMap<>();
		List<Map<String,String>> resultQuestionsMaps = new ArrayList<>();
		List<Map<String,String>> resultAnswerMaps = new ArrayList<>();
		try {
			ps = dc.getPreExec(selectMainSQL,parampaper_id);
			rs = ps.executeQuery();
			rs.next();
			
			String paper_id = rs.getString(1);
			String paper_name = rs.getString(2);
			Long paper_creation_of_time = rs.getTimestamp(3).getTime();
			String paper_time_of_answer = rs.getString(4);
			String sub_id = rs.getString(5);
			resultMainMap.put("paper_id", paper_id);
			resultMainMap.put(PaperInfo.PAPERNAME.toString(), paper_name);
			resultMainMap.put(PaperInfo.PAPERCREATIONTIME.toString(), ExamUtils.TrasformGetimeToString(paper_creation_of_time));
			resultMainMap.put(PaperInfo.PAPERTIMEOFANSWER.toString(), paper_time_of_answer);
			resultMainMap.put("sub_id",sub_id);     //main 数据封装完毕
			
			
			ps = dc.getPreExec(selectQuestionSQL,parampaper_id);
			rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> question = new HashMap<>();
				String que_id = rs.getString(1);
				String que_name = rs.getString(2);
				String que_type = rs.getString(3);
				paper_creation_of_time = rs.getTimestamp(4).getTime();
				String que_answer_code = rs.getLong(5)+"";
				String que_grade = rs.getInt(6)+"";
				paper_id = rs.getString(7);
				question.put("que_id", que_id);
				question.put(PaperQue.QUENAME.toString(),que_name);
				question.put(PaperQue.QUETYPE.toString(), que_type);
				question.put(PaperQue.QUECREATIONTIME.toString(), ExamUtils.TrasformGetimeToString(paper_creation_of_time));
				question.put(PaperQue.QUEANSWERCODE.toString(),que_answer_code);
				question.put(PaperQue.QUEGRADE.toString(),que_grade);
				question.put("paper_id",paper_id);
				resultQuestionsMaps.add(question);
			}
			resultMainMap.put("questions", resultQuestionsMaps);
			//SELECT answer.ans_id,answer.`答案内容`,answer.`创建时间`,answer.que_id FROM bus_main AS main LEFT JOIN bus_question AS question on main.main_id=question.main_id LEFT JOIN bus_answer AS answer ON question.que_id=answer.que_id WHERE main.main_id = ?
			ps = dc.getPreExec(selectAnswerSQL,parampaper_id);
			rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> answer = new HashMap<>();
				
				String ans_id = rs.getString(1);
				String 答案内容 = rs.getString(2);
				paper_creation_of_time = rs.getTimestamp(3).getTime();
				String que_id = rs.getString(4);
				answer.put("ans_id", ans_id);
				answer.put(QueAnswer.ANSCONTENT.toString(), 答案内容);
				answer.put(QueAnswer.ANSCREATIONTIME.toString(), ExamUtils.TrasformGetimeToString(paper_creation_of_time));
				answer.put("que_id", que_id);
				
				resultAnswerMaps.add(answer);
			}
			resultMainMap.put("answers", resultAnswerMaps);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultMainMap;
	}

	
	
	//通过试卷主键paper_id获取完整的试卷
	public static Map<String,Object> getRandQuestion (String parampaper_id){
		
		//SELECT paper_id,paper_name,paper_creation_of_time,paper_time_of_answer,sub_id FROM oes_paper_info where paper_id = ?"),
		String selectMainSQL = PaperInfo.SELECTBYPAPERID.toString();

		String selectQuestionSQL = PaperQue.SELECTBYPAPERIDGETRAND.toString();

		String selectAnswerSQL =  QueAnswer.SELECTBYPAPERID.toString();
		
		int result = 0;
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		PreparedStatement ps;
		ResultSet rs;
		Map<String,Object> resultMainMap = new HashMap<>();
		List<Map<String,String>> resultQuestionsMaps = new ArrayList<>();
		List<Map<String,String>> resultAnswerMaps = new ArrayList<>();
		try {
			ps = dc.getPreExec(selectMainSQL,parampaper_id);
			rs = ps.executeQuery();
			rs.next();
			
			String paper_id = rs.getString(1);
			String paper_name = rs.getString(2);
			Long paper_creation_of_time = rs.getTimestamp(3).getTime();
			String paper_time_of_answer = rs.getString(4);
			String sub_id = rs.getString(5);
			resultMainMap.put("paper_id", paper_id);
			resultMainMap.put(PaperInfo.PAPERNAME.toString(), paper_name);
			resultMainMap.put(PaperInfo.PAPERCREATIONTIME.toString(), ExamUtils.TrasformGetimeToString(paper_creation_of_time));
			resultMainMap.put(PaperInfo.PAPERTIMEOFANSWER.toString(), paper_time_of_answer);
			resultMainMap.put("sub_id",sub_id);     //main 数据封装完毕
			
			
			ps = dc.getPreExec(selectQuestionSQL,parampaper_id);
			rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> question = new HashMap<>();
				String que_id = rs.getString(1);
				String que_name = rs.getString(2);
				String que_type = rs.getString(3);
				paper_creation_of_time = rs.getTimestamp(4).getTime();
				String que_answer_code = rs.getLong(5)+"";
				String que_grade = rs.getInt(6)+"";
				paper_id = rs.getString(7);
				question.put("que_id", que_id);
				question.put(PaperQue.QUENAME.toString(),que_name);
				question.put(PaperQue.QUETYPE.toString(), que_type);
				question.put(PaperQue.QUECREATIONTIME.toString(), ExamUtils.TrasformGetimeToString(paper_creation_of_time));
				question.put(PaperQue.QUEANSWERCODE.toString(),que_answer_code);
				question.put(PaperQue.QUEGRADE.toString(),que_grade);
				question.put("paper_id",paper_id);
				resultQuestionsMaps.add(question);
			}
			resultMainMap.put("questions", resultQuestionsMaps);
			//SELECT answer.ans_id,answer.`答案内容`,answer.`创建时间`,answer.que_id FROM bus_main AS main LEFT JOIN bus_question AS question on main.main_id=question.main_id LEFT JOIN bus_answer AS answer ON question.que_id=answer.que_id WHERE main.main_id = ?
			ps = dc.getPreExec(selectAnswerSQL,parampaper_id);
			rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> answer = new HashMap<>();
				
				String ans_id = rs.getString(1);
				String 答案内容 = rs.getString(2);
				paper_creation_of_time = rs.getTimestamp(3).getTime();
				String que_id = rs.getString(4);
				answer.put("ans_id", ans_id);
				answer.put(QueAnswer.ANSCONTENT.toString(), 答案内容);
				answer.put(QueAnswer.ANSCREATIONTIME.toString(), ExamUtils.TrasformGetimeToString(paper_creation_of_time));
				answer.put("que_id", que_id);
				
				resultAnswerMaps.add(answer);
			}
			resultMainMap.put("answers", resultAnswerMaps);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultMainMap;
	}

	
	//根据paper_id计算试卷总分
	public static long getSumGrade(String paperId) {
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement preparedStatement = dc.getPreExec(PaperQue.SELECTSUMGRADE.toString(),paperId);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
		
	}
	
	
	//根据试卷id获取试卷总题数
	public static long getQueCount(String paperId) {
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement preparedStatement = dc.getPreExec(PaperQue.SELECTCOUNTQUE.toString(),paperId);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
		
	}
	
	//获取试卷单选题数量
	public static long getQueRadioCount(String paperId) {
		DaoConnection dc = DaoConnection.initDaoConnection();
		String radio = "radio";
		try {
			PreparedStatement preparedStatement = dc.getPreExec(PaperQue.SELECTCOUNTRADIOORCHECKBOX.toString(),radio,paperId);
			ResultSet rs = preparedStatement.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
		
	}
	
	//获取试卷多选题数量
		public static long getQueCheckboxCount(String paperId) {
			DaoConnection dc = DaoConnection.initDaoConnection();
			String radio = "checkbox";
			try {
				PreparedStatement preparedStatement = dc.getPreExec(PaperQue.SELECTCOUNTRADIOORCHECKBOX.toString(),radio,paperId);
				ResultSet rs = preparedStatement.executeQuery();
				if (rs!=null){
					rs.next();
					return rs.getLong(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0L;
			
		}
	
	
	
	/**
	 * 计算分数
	 * @param parmMap
	 * @return
	 */
	public static int countScore (MultiValueMap<String, String> parmMap,String sno){
		
		int result = 0;
		String paper_id = parmMap.get("paper_id").get(0);
		DaoConnection dc = DaoConnection.initDaoConnection();
		Set<Entry<String, List<String>>> entrySet = parmMap.entrySet();
		int count = 0;
		for(Entry<String, List<String>> entry : entrySet){
			String que_id = entry.getKey();
			List<String> values = entry.getValue();
			try {
				PreparedStatement ps = dc.getPreExec(PaperQue.SELECTBYQUEID.toString(), que_id);
				ResultSet rs = ps.executeQuery();
				if (rs.next()){
					Long answer_code = rs.getLong(3);
					Integer grade = rs.getInt(4);
					long transforanswercode = ExamUtils.statistics(values);
//					System.out.println(answer_code);
//					System.out.println(transforanswercode);
					if (transforanswercode == answer_code){
						count+=grade;
					}
				}
//				System.out.println(count);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		try {
			PreparedStatement ps = dc.getPreExec(MarkInfo.INSERT.toString(),sno,count,paper_id);
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//获取当前页面分数信息
	public static List<Map<String, String>> getKsfs (String sno,Integer page,Integer row){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		
		try {
			
			PreparedStatement ps = dc.getPreExec(MarkInfo.SELECTPAGING.toString(),sno,page,row);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
				Map<String,String> resultMap = new HashMap<>();
				String paper_id = rs.getString(1);
				String paper_name = rs.getString(2);
				long timestamp = rs.getTimestamp(3).getTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String paper_creation_of_time = sdf.format(new Date(timestamp));
				long paper_time_of_answer = rs.getLong(4);
				String mark_grade = rs.getString(6);
				resultMap.put(PaperInfo.PAPERID.toString(), paper_id);
				resultMap.put(PaperInfo.PAPERNAME.toString(),paper_name);
				resultMap.put(PaperInfo.PAPERCREATIONTIME.toString(),paper_creation_of_time);
				resultMap.put(PaperInfo.PAPERTIMEOFANSWER.toString(),sdf.format(new Date(paper_time_of_answer)));
				resultMap.put(MarkInfo.MARKGRADE.toString(),mark_grade);
				resultListMap.add(resultMap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return resultListMap;
	}
	
	public static Long getInfoCount (String sno){
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement ps = dc.getPreExec(MarkInfo.SELECTCOUNT.toString(),sno);
			ResultSet rs = ps.executeQuery();
			if (rs!=null){
				rs.next();
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0L;
	}
	
	
	//获取学生成绩信息
	//获取全部页面科目信息并存放进List数组
	public static List<Map<String, String>> getSnoGrade(String sno){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement sp = dc.getPreExec(MarkInfo.SELECTBYSNOGRADE.toString(),sno);
			ResultSet rs = sp.executeQuery();
			if (rs != null){
				while (rs.next()){
					Map<String, String> reaultMap = new HashMap<String, String>();
					reaultMap.put(MarkInfo.MARKID.toString(), rs.getInt(1)+"");
					reaultMap.put(PaperInfo.PAPERNAME.toString(), rs.getString(2));
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					Long sqlDateLong = rs.getTimestamp(3).getTime();
					reaultMap.put(PaperInfo.PAPERCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
					reaultMap.put(MarkInfo.MARKGRADE.toString(), rs.getInt(4)+"");
					resultListMap.add(reaultMap);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultListMap;
	}
	
	
	//试卷搜索功能实现
	public static List<Map<String, String>> searchPaper(String paperName){
		List<Map<String, String>> resultListMap = new ArrayList<>();
		String pN = "%"+paperName+"%";
		DaoConnection dc = DaoConnection.initDaoConnection();
		try {
			PreparedStatement sp = dc.getPreExec(PaperInfo.SEARCHPAPER.toString(),pN);
			ResultSet rs = sp.executeQuery();
			if (rs != null){
				while (rs.next()){
//					Map<String, String> reaultMap = new HashMap<String, String>();
//					reaultMap.put(PaperInfo.PAPERID.toString(), rs.getInt(1)+"");
//					reaultMap.put(PaperInfo.PAPERNAME.toString(), rs.getString(2));
//					
//					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//					Long sqlDateLong = rs.getTimestamp(3).getTime();
//					reaultMap.put(PaperInfo.PAPERCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
//					reaultMap.put(PaperInfo.PAPERCREATIONTIME.toString(), rs.getInt(4)+"");
//					reaultMap.put(PaperInfo.SUBID.toString(), rs.getInt(5)+"");
//					resultListMap.add(reaultMap);
					
					Map<String,String> entity = new HashMap<>();
					String paper_id = rs.getString(1);
					long paper_grade = getSumGrade(paper_id);
//					System.out.println(paper_grade);
					String paper_name = rs.getString(2);
					entity.put(PaperInfo.PAPERID.toString(), paper_id);
					entity.put(PaperInfo.PAPERNAME.toString(), paper_name);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					Long sqlDateLong = rs.getTimestamp(3).getTime();//rs.getDate(3).getTime();
					entity.put(PaperInfo.PAPERCREATIONTIME.toString(), sdf.format(new Date(sqlDateLong)));
					entity.put(PaperInfo.PAPERTIMEOFANSWER.toString(), rs.getString(4));
					entity.put("paper_grade", paper_grade+"");
					
					String queCount = getQueCount(paper_id)+"";
					entity.put("qC",queCount);
					
					String radioCount = getQueRadioCount(paper_id)+"";
					entity.put("rC",radioCount);
					
					String checkBoxCount = getQueCheckboxCount(paper_id)+"";
					entity.put("cC",checkBoxCount);
					
					entity.put(PaperInfo.SUBID.toString(), rs.getString(5));
					resultListMap.add(entity);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultListMap;
	}
}
