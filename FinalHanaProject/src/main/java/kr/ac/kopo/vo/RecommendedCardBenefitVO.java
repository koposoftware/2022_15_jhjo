package kr.ac.kopo.vo;

public class RecommendedCardBenefitVO {
	private String smallCate;
	private int cardBenefit;
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
	@Override
	public String toString() {
		return "RecommendedCardBenefitVO [smallCate=" + smallCate + ", cardBenefit=" + cardBenefit + "]";
	}
}
