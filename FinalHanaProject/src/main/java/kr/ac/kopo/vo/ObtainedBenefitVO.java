package kr.ac.kopo.vo;

public class ObtainedBenefitVO {
	private String smallCate;
	private int cardBenefit;
	private String aliType;
	public String getSmallCate() {
		return smallCate;
	}
	public void setSmallCate(String smallCate) {
		this.smallCate = smallCate;
	}
	public int getCardBenefit() {
		return cardBenefit;
	}
	public void setCardBenefit(int cardBenefit) {
		this.cardBenefit = cardBenefit;
	}
	public String getAliType() {
		return aliType;
	}
	public void setAliType(String aliType) {
		this.aliType = aliType;
	}
	@Override
	public String toString() {
		return "ObtainedBenefitVO [smallCate=" + smallCate + ", cardBenefit=" + cardBenefit + ", aliType=" + aliType
				+ "]";
	}
	

}
