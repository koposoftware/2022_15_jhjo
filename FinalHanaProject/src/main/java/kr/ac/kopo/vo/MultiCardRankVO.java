package kr.ac.kopo.vo;

public class MultiCardRankVO {
    private String firstMultiCardCateNum;
    private String secondMultiCardCateNum;
    private String firstMultiCardImgUrl;
    private String secondMultiCardImgUrl;
    private String firstMultiCardName;
    private String secondMultiCardName;
    private String firstMultiCardComment;
    private String secondMultiCardComment;
    private int obtainedBenefit;
    private int firstBenefit;
    private int secondBenefit;
	public String getFirstMultiCardCateNum() {
		return firstMultiCardCateNum;
	}
	public void setFirstMultiCardCateNum(String firstMultiCardCateNum) {
		this.firstMultiCardCateNum = firstMultiCardCateNum;
	}
	public String getSecondMultiCardCateNum() {
		return secondMultiCardCateNum;
	}
	public void setSecondMultiCardCateNum(String secondMultiCardCateNum) {
		this.secondMultiCardCateNum = secondMultiCardCateNum;
	}
	public String getFirstMultiCardImgUrl() {
		return firstMultiCardImgUrl;
	}
	public void setFirstMultiCardImgUrl(String firstMultiCardImgUrl) {
		this.firstMultiCardImgUrl = firstMultiCardImgUrl;
	}
	public String getSecondMultiCardImgUrl() {
		return secondMultiCardImgUrl;
	}
	public void setSecondMultiCardImgUrl(String secondMultiCardImgUrl) {
		this.secondMultiCardImgUrl = secondMultiCardImgUrl;
	}
	public String getFirstMultiCardName() {
		return firstMultiCardName;
	}
	public void setFirstMultiCardName(String firstMultiCardName) {
		this.firstMultiCardName = firstMultiCardName;
	}
	public String getSecondMultiCardName() {
		return secondMultiCardName;
	}
	public void setSecondMultiCardName(String secondMultiCardName) {
		this.secondMultiCardName = secondMultiCardName;
	}
	public String getFirstMultiCardComment() {
		return firstMultiCardComment;
	}
	public void setFirstMultiCardComment(String firstMultiCardComment) {
		this.firstMultiCardComment = firstMultiCardComment;
	}
	public String getSecondMultiCardComment() {
		return secondMultiCardComment;
	}
	public void setSecondMultiCardComment(String secondMultiCardComment) {
		this.secondMultiCardComment = secondMultiCardComment;
	}
	public int getObtainedBenefit() {
		return obtainedBenefit;
	}
	public void setObtainedBenefit(int obtainedBenefit) {
		this.obtainedBenefit = obtainedBenefit;
	}
	public int getFirstBenefit() {
		return firstBenefit;
	}
	public void setFirstBenefit(int firstBenefit) {
		this.firstBenefit = firstBenefit;
	}
	public int getSecondBenefit() {
		return secondBenefit;
	}
	public void setSecondBenefit(int secondBenefit) {
		this.secondBenefit = secondBenefit;
	}
	@Override
	public String toString() {
		return "MultiCardRankVO [firstMultiCardCateNum=" + firstMultiCardCateNum + ", secondMultiCardCateNum="
				+ secondMultiCardCateNum + ", firstMultiCardImgUrl=" + firstMultiCardImgUrl + ", secondMultiCardImgUrl="
				+ secondMultiCardImgUrl + ", firstMultiCardName=" + firstMultiCardName + ", secondMultiCardName="
				+ secondMultiCardName + ", firstMultiCardComment=" + firstMultiCardComment + ", secondMultiCardComment="
				+ secondMultiCardComment + ", obtainedBenefit=" + obtainedBenefit + ", firstBenefit=" + firstBenefit
				+ ", secondBenefit=" + secondBenefit + "]";
	}


}
