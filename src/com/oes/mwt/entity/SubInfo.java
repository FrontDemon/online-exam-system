package com.oes.mwt.entity;

public enum SubInfo {
	
	TABLENAME("oes_sub_info"),
	
	SUBID("sub_id"),
	
	SUBNAME("sub_name"),
	
	SUBCREATIONTIME("sub_creation_time"),
	
	SELECTPAGING("select sub_id,sub_name,sub_creation_time from oes_sub_info ORDER BY sub_creation_time LIMIT ?,?"),
	
	SELECTALL("select sub_id,sub_name,sub_creation_time from oes_sub_info ORDER BY sub_creation_time"),
	
	SELECTCOUNT("select count(sub_id) as count from oes_sub_info"),
	
	INSERT("insert into oes_sub_info(sub_name,sub_creation_time) values (?,NOW())"),
	
	DELETEBYID("delete from oes_sub_info where sub_id = ?"),
	
	UPDATENAMEBYSUBID("update oes_sub_info set sub_name=? where sub_id=?");

	private String field;
	
	private SubInfo(String field){
		this.field = field;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.field;
	}
	
}
