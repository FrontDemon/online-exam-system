package com.oes.mwt.entity;


/**
 * 
 * @author 马伟涛
 * 学生信息实体
 */
public enum StudentInfo {
	
	TABLENAME("oes_student_info"),
	
	SNO("sno"),
	
	STUDENTPSW("student_psw"),
	
	STUDENTNAME("student_name"),
	
	STUDENTEMAIL("student_email"),
	
	SELECTBYUSERNAME("select sno,student_psw,student_name,student_email from oes_student_info where sno = ?"),
	
	INSERT("insert into oes_student_info (sno,student_psw,student_name,student_email) values (?,?,?,?);"),
	
	SELECTBYSNO("select * from oes_student_info where sno=?");
	
	private String field;
	
	private StudentInfo (String field){
		this.field = field;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}
	
	public String toString(){
		return this.field;
	}
	
}
