package com.oes.mwt.entity;

public enum PaperInfo {
	
	TABLENAME("oes_paper_info"),
	
	PAPERID("paper_id"),
	
	PAPERNAME("paper_name"),
	
	PAPERCREATIONTIME("paper_creation_of_time"),
	
	PAPERTIMEOFANSWER("paper_time_of_answer"),
	
	SUBID("sub_id"),
	
	INSERT("insert into oes_paper_info (paper_name,paper_creation_of_time,paper_time_of_answer,sub_id) values (?,NOW(),?,?);"),
	
	SELECTPAGING("select main.paper_id,main.paper_name,main.paper_creation_of_time,main.paper_time_of_answer,subject.sub_id,subject.sub_name from oes_paper_info as main LEFT JOIN oes_sub_info as subject on main.sub_id = subject.sub_id ORDER BY sub_id LIMIT ?,?"),
	
	//select oes_mark_info.mark_id,oes_paper_info.paper_name,oes_paper_info.paper_creation_of_time,mark_grade from oes_mark_info LEFT OUTER JOIN oes_paper_info on oes_mark_info.paper_id = oes_paper_info.paper_id WHERE oes_mark_info.sno=? ORDER BY oes_mark_info.mark_id
	
	
	SELECTCOUNT("select count(paper_id) as count from oes_paper_info"),
	
	UDDATEBYPAPERID ("UPDATE oes_paper_info SET paper_name = ? ,paper_time_of_answer = ? , sub_id = ? WHERE paper_id = ?"),
	
	SELECTBYPAPERID ("SELECT paper_id,paper_name,paper_creation_of_time,paper_time_of_answer,sub_id FROM oes_paper_info where paper_id = ?"),
	
	SELECTBYSUBID ("SELECT paper_id,paper_name,paper_creation_of_time,paper_time_of_answer,sub_id FROM oes_paper_info where sub_id = ?"),
	
	SEARCHPAPER("SELECT * FROM oes_paper_info WHERE paper_name LIKE ?"),
	
	DELETEBYPAPERID("delete from oes_paper_info where paper_id = ?");
	
	private String field;
	
	private PaperInfo (String field){
		this.field = field;
	}


	
	public String toString(){
		return this.field;
	}
	
}
