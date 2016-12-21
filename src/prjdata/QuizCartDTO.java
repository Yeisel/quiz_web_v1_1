package prjdata;

public class QuizCartDTO {
	private int cart_Number = 0;
	private String cart_User_Id = null;
	private int cart_Pruduct_Number = 0;
	private int cart_Amount = 0;
	
	public int getCart_Number() {
		return cart_Number;
	}
	public void setCart_Number(int cart_Number) {
		this.cart_Number = cart_Number;
	}
	public String getCart_User_Id() {
		return cart_User_Id;
	}
	public void setCart_User_Id(String cart_User_Id) {
		this.cart_User_Id = cart_User_Id;
	}
	public int getCart_Pruduct_Number() {
		return cart_Pruduct_Number;
	}
	public void setCart_Pruduct_Number(int cart_Pruduct_Number) {
		this.cart_Pruduct_Number = cart_Pruduct_Number;
	}
	public int getCart_Amount() {
		return cart_Amount;
	}
	public void setCart_Amount(int cart_Amount) {
		this.cart_Amount = cart_Amount;
	}	
}
