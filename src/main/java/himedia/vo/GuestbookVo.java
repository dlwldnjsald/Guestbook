package himedia.vo;

import java.util.Date;

public class GuestbookVo {

	//table Guestbook의 레코드 저장 위한 DTO 객체
	//1. 기본생성자
	//2. 비즈니스 로직을 가지지않은 순수 데이터 객체
	//3. field, getters, setters
	//4. tostring, equals  etc 객체관련 메서드 오버라이드 
	
	
	private Long no;
	private String name;
	private String password;
	private String content;
	private Date regDate;
	
	//기본 생성자
	public GuestbookVo() {
		
	}

	//all field
	public GuestbookVo(Long no, 
						String name, 
						String password, 
						String content, 
						Date regDate) {
		
		this.no = no;
		this.name = name;
		this.password = password;
		this.content = content;
		this.regDate = regDate;
	}

	// 부분 field->>no(PK) -> 시퀀스, regDate -> default
	public GuestbookVo(String name, String password, String content) {
		super();
		this.name = name;
		this.password = password;
		this.content = content;
	}

	
	//getters, setters
	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "GuestbookVo [no=" + no + ", name=" + name + ", password=" + password + ", content=" + content
				+ ", regDate=" + regDate + "]";
	}
	
	
	
	
	
	
	
}
