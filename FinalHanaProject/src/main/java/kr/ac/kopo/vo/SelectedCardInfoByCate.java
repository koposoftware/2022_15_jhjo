package kr.ac.kopo.vo;

public class SelectedCardInfoByCate {
    private String imgUrl; 
    private String cardName;
    private int annualFee;
    private String cardCateNum;
    private String sortCard;
    private String commentOfCard;
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public int getAnnualFee() {
		return annualFee;
	}
	public void setAnnualFee(int annualFee) {
		this.annualFee = annualFee;
	}
	public String getCardCateNum() {
		return cardCateNum;
	}
	public void setCardCateNum(String cardCateNum) {
		this.cardCateNum = cardCateNum;
	}
	public String getSortCard() {
		return sortCard;
	}
	public void setSortCard(String sortCard) {
		this.sortCard = sortCard;
	}
	public String getCommentOfCard() {
		return commentOfCard;
	}
	public void setCommentOfCard(String commentOfCard) {
		this.commentOfCard = commentOfCard;
	}
	@Override
	public String toString() {
		return "SelectedCardInfoByCate [imgUrl=" + imgUrl + ", cardName=" + cardName + ", annualFee=" + annualFee
				+ ", cardCateNum=" + cardCateNum + ", sortCard=" + sortCard + ", commentOfCard=" + commentOfCard + "]";
	}
	
}
