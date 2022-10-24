package kr.ac.kopo.vo;

public class ResisteredCardBenefitVO {
	private String sortCard;
	private String beneCode;
	private String beneType;
	private int beneLimit;
	private int basePerform;
	private int beneRate;
	private String sortCardSuffix;
	private int cardCateMaxNumber;

	public int getCardCateMaxNumber() {
		return cardCateMaxNumber;
	}
	public void setCardCateMaxNumber(int cardCateMaxNumber) {
		this.cardCateMaxNumber = cardCateMaxNumber;
	}
	public String getSortCard() {
		return sortCard;
	}
	public void setSortCard(String sortCard) {
		this.sortCard = sortCard;
	}
	public String getBeneCode() {
		return beneCode;
	}
	public void setBeneCode(String beneCode) {
		this.beneCode = beneCode;
	}
	public String getBeneType() {
		return beneType;
	}
	public void setBeneType(String beneType) {
		this.beneType = beneType;
	}
	public int getBeneLimit() {
		return beneLimit;
	}
	public void setBeneLimit(int beneLimit) {
		this.beneLimit = beneLimit;
	}
	public int getBasePerform() {
		return basePerform;
	}
	public void setBasePerform(int basePerform) {
		this.basePerform = basePerform;
	}
	public int getBeneRate() {
		return beneRate;
	}
	public void setBeneRate(int beneRate) {
		this.beneRate = beneRate;
	}
	public String getSortCardSuffix() {
		return sortCardSuffix;
	}
	public void setSortCardSuffix(String sortCardSuffix) {
		this.sortCardSuffix = sortCardSuffix;
	}
	@Override
	public String toString() {
		return "ResisteredCardBenefitVO [sortCard=" + sortCard + ", beneCode=" + beneCode + ", beneType=" + beneType
				+ ", beneLimit=" + beneLimit + ", basePerform=" + basePerform + ", beneRate=" + beneRate
				+ ", sortCardSuffix=" + sortCardSuffix + ", cardCateMaxNumber=" + cardCateMaxNumber + "]";
	}
}
