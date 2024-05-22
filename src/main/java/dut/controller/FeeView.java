package dut.controller;

public class FeeView{
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public FeeView(float amount, String name, String number, int id, String state) {
        this.amount = amount;
        this.name = name;
        this.number = number;
        this.id = id;
        this.state = state;
    }

    int id;
    String number;
    String name;
    float amount;
    String state;
}
