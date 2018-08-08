package com.oes.mwt.entity;

public enum QueAnswer {

	TABLENAME("oes_que_answer"),
	
	ANSID("ans_id"),
	
	ANSCONTENT("ans_content"),
	
	ANSCREATIONTIME("ans_creation_time"),
	
	QUEID("que_id"),
	
	SELECTBYPAPERID("SELECT answer.ans_id,answer.ans_content,answer.ans_creation_time,answer.que_id FROM oes_paper_info AS main LEFT JOIN oes_paper_que AS question on main.paper_id=question.paper_id LEFT JOIN oes_que_answer AS answer ON question.que_id=answer.que_id WHERE main.paper_id = ?"),
	
	SELECTLASTANSID("SELECT ans_id FROM oes_que_answer ORDER BY ans_id DESC LIMIT 1");
	
	private String field;
		
	private QueAnswer (String field){
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
