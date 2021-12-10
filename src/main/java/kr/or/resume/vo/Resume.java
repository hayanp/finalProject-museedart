package kr.or.resume.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Resume {
	private int resumeNo;
	private int requritNo;
	private String resumeGender;
	private String resumePhone;
	private String resumeDetail;
	private int memberNo;
	private ArrayList<ResumeTbl> rtList;
}
