package com.tekskills.DTO;

public class ExpenseChatDto {
	
	private String months;
	private int expenseCount;
	private int paymentCount;
	public String getMonths() {
		return months;
	}
	public void setMonths(String months) {
		this.months = months;
	}
	@Override
	public String toString() {
		return "ExpenseChatDto [months=" + months + ", expenseCount=" + expenseCount + ", paymentCount=" + paymentCount
				+ "]";
	}
	public int getExpenseCount() {
		return expenseCount;
	}
	public void setExpenseCount(int expenseCount) {
		this.expenseCount = expenseCount;
	}
	public int getPaymentCount() {
		return paymentCount;
	}
	public void setPaymentCount(int paymentCount) {
		this.paymentCount = paymentCount;
	}

}