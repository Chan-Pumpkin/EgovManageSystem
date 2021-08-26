package manage.system.board.service;

import egovframework.cmmn.ComDefaultVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {

	private Long id;
	private String title;
	


	public Long getId() { 
		 return id;
	} 
	 public void setId(Long id){
		 this.id = id; 
	}

	public String getTitle() { 
		 return title;
	} 
	 public void setTitle(String title){
		 this.title = title; 
	}

	

}
