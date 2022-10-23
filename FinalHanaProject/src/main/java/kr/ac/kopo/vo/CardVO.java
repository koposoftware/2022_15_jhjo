package kr.ac.kopo.vo;

public class CardVO {
	
	private String cardName;
	private String cardNum;
	private String cardValidDate;
	private String cardCvcNum;
	private String cardImgUrl;
	private String cardCateNum;
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardValidDate() {
		return cardValidDate;
	}
	public void setCardValidDate(String cardValidDate) {
		this.cardValidDate = cardValidDate;
	}
	public String getCardCvcNum() {
		return cardCvcNum;
	}
	public void setCardCvcNum(String cardCvcNum) {
		this.cardCvcNum = cardCvcNum;
	}
	public String getCardImgUrl() {
		return cardImgUrl;
	}
	public void setCardImgUrl(String cardImgUrl) {
		this.cardImgUrl = cardImgUrl;
	}
	public String getCardCateNum() {
		return cardCateNum;
	}
	public void setCardCateNum(String cardCateNum) {
		this.cardCateNum = cardCateNum;
	}
	@Override
	public String toString() {
		return "CardVO [cardName=" + cardName + ", cardNum=" + cardNum + ", cardValidDate=" + cardValidDate
				+ ", cardCvcNum=" + cardCvcNum + ", cardImgUrl=" + cardImgUrl + ", cardCateNum=" + cardCateNum + "]";
	}
	

}
