package com.oes.mwt.entity;

/**
 * 
 * @author 马伟涛
 * 教师信息实体
 */
public enum TeacherInfo {

	TABLENAME("oes_teacher_info"),
	
	TNO("tno"),
	
	TEACHERPSW("teacher_psw"),
	
	TEACHERNAME("teacher_name"),
	
	TEACHEREMAIL("teacher_email"),
	
	SELECTBYUSERNAME("select tno,teacher_psw,teacher_name,teacher_email from oes_teacher_info where tno = ?"),
	
	INSERT("insert into oes_teacher_info (tno,teacher_psw,teacher_name,teacher_email) values (?,?,?,?);"),
	
	SELECTBYTNO("select * from oes_teacher_info where tno=?");
	
	private String field;
	
	private TeacherInfo (String field){
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
