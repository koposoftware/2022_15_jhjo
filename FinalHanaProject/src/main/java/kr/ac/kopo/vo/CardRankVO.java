package kr.ac.kopo.vo;

public class CardRankVO {
	private String cardCateNum;
	private int cardBenefit;
	private String cardImgUrl;
	private int cardAnnualFee;
	private String cardName;
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	@Override
	public String toString() {
		return "CardRankVO [cardCateNum=" + cardCateNum + ", cardBenefit=" + cardBenefit + ", cardImgUrl=" + cardImgUrl
				+ ", cardAnnualFee=" + cardAnnualFee + ", cardName=" + cardName + "]";
	}
	public String getCardCateNum() {
		return cardCateNum;
	}
	public void setCardCateNum(String cardCateNum) {
		this.cardCateNum = cardCateNum;
	}
	public int getCardBenefit() {
		return cardBenefit;
	}
	public void setCardBenefit(int cardBenefit) {
		this.cardBenefit = cardBenefit;
	}
	public String getCardImgUrl() {
		return cardImgUrl;
	}
	public void setCardImgUrl(String cardImgUrl) {
		this.cardImgUrl = cardImgUrl;
	}
	public int getCardAnnualFee() {
		return cardAnnualFee;
	}
	public void setCardAnnualFee(int cardAnnualFee) {
		this.cardAnnualFee = cardAnnualFee;
	}

}
