package com.oes.mwt.entity;

public enum PaperQue {

	TABLENAME("oes_paper_que"),
	
	QUEID("que_id"),
	
	QUENAME("que_name"),
	
	QUETYPE("que_type"),
	
	QUECREATIONTIME("que_creation_time"),
	
	QUEANSWERCODE("que_answer_code"),
	
	QUEGRADE("que_grade"),
	
	PAPERID("paper_id"),
	
	INSERT("insert into oes_paper_que (que_id,que_name,que_creation_time,que_answer_code,que_grade,paper_id) values (?,?,NOW(),?,?,?);"),
	
	SELECTPAGING("select que_id,que_name,que_creation_time,que_answer_code,que_grade,paper_id from oes_paper_que ORDER BY que_creation_time LIMIT ?,?"),
	
	SELECTCOUNT("select count(que_id) as count from oes_paper_que"),
	
	SELECTBYPAPERID ("SELECT que_id,que_name,que_type,que_creation_time,que_answer_code,que_grade,paper_id FROM oes_paper_que where paper_id = ? ORDER BY que_grade"),
	
	SELECTBYQUEID ("SELECT que_name,que_creation_time,que_answer_code,que_grade,paper_id FROM oes_paper_que where que_id = ?"),
	
	SELECTSUMGRADE("SELECT SUM(que_grade) FROM oes_paper_que WHERE paper_id=?"),
	
	SELECTCOUNTQUE("SELECT COUNT(que_id) FROM oes_paper_que WHERE paper_id=?"),
	
	SELECTCOUNTRADIOORCHECKBOX("SELECT COUNT(*) FROM oes_paper_que WHERE que_type=? AND paper_id=?"),
	
	SELECTBYPAPERIDGETRAND ("SELECT * FROM oes_paper_que WHERE paper_id = ? ORDER BY RAND() LIMIT 5"),
	
	SELECTLASTQUEID("SELECT que_id FROM oes_paper_que ORDER BY que_id DESC LIMIT 1");
	
	private String field;
	
	private PaperQue (String field){
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
