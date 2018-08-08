package com.oes.mwt.entity;

public enum MarkInfo {
	
	TABLENAME("oes_mark_info"),
	
	MARKID("mark_id"),
	
	USER("user"),
	
	MARKGRADE("mark_grade"),
	
	PAPERID("paper_id"),
	
	SELECTBYUSERNAME("select mark_id,mark_grade,paper_id from oes_mark_info where sno = ?  ORDER BY mark_id"),
	
	INSERT("insert into oes_mark_info (sno,mark_grade,paper_id) values (?,?,?);"),
	
	SELECTPAGING("select main.paper_id,main.paper_name,main.paper_creation_of_time,main.paper_time_of_answer,main.sub_id,info.mark_grade from ose_paper_info as main RIGHT JOIN oes_mark_info as info on main.paper_id = info.paper_id WHERE info.user=? ORDER BY paper_creation_time LIMIT ?,?"),
	
	SELECTCOUNT("select count(mark_id) as count from oes_mark_info where user= ?"),
	
	SELECTBYSNOGRADE("select oes_mark_info.mark_id,oes_paper_info.paper_name,oes_paper_info.paper_creation_of_time,mark_grade from oes_mark_info LEFT OUTER JOIN oes_paper_info on oes_mark_info.paper_id = oes_paper_info.paper_id WHERE oes_mark_info.sno=? ORDER BY oes_mark_info.mark_id");
	
	private String field;
	
	private MarkInfo (String field){
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
