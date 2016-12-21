package prjdata;

public class QuizBuyDTO {
	private String buy_Number = null;
	private String buy_Id= null;
	private String buy_Date= null;
	private int buy_Pruduct_Number = 0;
	private int buy_Amount = 0;
	private int buy_Price = 0;
	private String buy_Progress = null;
	private String buy_Invoice = null;
	
	public String getBuy_Number() {
		return buy_Number;
	}
	public void setBuy_Number(String buy_Number) {
		this.buy_Number = buy_Number;
	}
	public String getBuy_Id() {
		return buy_Id;
	}
	public void setBuy_Id(String buy_Id) {
		this.buy_Id = buy_Id;
	}
	public String getBuy_Date() {
		return buy_Date;
	}
	public void setBuy_Date(String buy_Date) {
		this.buy_Date = buy_Date;
	}
	public int getBuy_Pruduct_Number() {
		return buy_Pruduct_Number;
	}
	public void setBuy_Pruduct_Number(int buy_Pruduct_Number) {
		this.buy_Pruduct_Number = buy_Pruduct_Number;
	}
	public int getBuy_Amount() {
		return buy_Amount;
	}
	public void setBuy_Amount(int buy_Amount) {
		this.buy_Amount = buy_Amount;
	}
	public int getBuy_Price() {
		return buy_Price;
	}
	public void setBuy_Price(int buy_Price) {
		this.buy_Price = buy_Price;
	}
	public String getBuy_Progress() {
		return buy_Progress;
	}
	public void setBuy_Progress(String buy_Progress) {
		this.buy_Progress = buy_Progress;
	}
	public String getBuy_Invoice() {
		return buy_Invoice;
	}
	public void setBuy_Invoice(String buy_Invoice) {
		this.buy_Invoice = buy_Invoice;
	}	
}
