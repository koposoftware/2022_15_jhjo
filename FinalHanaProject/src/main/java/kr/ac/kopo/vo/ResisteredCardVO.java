package kr.ac.kopo.vo;

public class ResisteredCardVO {
	private String commentOfCard;
	private String cardName;
	private String annualCode;
	private	int annualFee;
	private String sortCard;
	
	public String getCommentOfCard() {
		return commentOfCard;
	}
	public void setCommentOfCard(String commentOfCard) {
		this.commentOfCard = commentOfCard;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getAnnualCode() {
		return annualCode;
	}
	public void setAnnualCode(String annualCode) {
		this.annualCode = annualCode;
	}
	public int getAnnualFee() {
		return annualFee;
	}
	public void setAnnualFee(int annualFee) {
		this.annualFee = annualFee;
	}
	public String getSortCard() {
		return sortCard;
	}
	public void setSortCard(String sortCard) {
		this.sortCard = sortCard;
	}
	@Override
	public String toString() {
		return "ResisteredCardVO [commentOfCard=" + commentOfCard + ", cardName=" + cardName + ", annualCode="
				+ annualCode + ", annualFee=" + annualFee + ", sortCard=" + sortCard + "]";
	}



}
